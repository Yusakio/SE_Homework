package adminis.controller.admin;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.aspose.words.Document;
import com.aspose.words.DocumentBuilder;
import com.aspose.words.SaveFormat;
import com.aspose.words.SaveOptions;
import com.aspose.words.net.System.Data.DataRow;
import com.aspose.words.net.System.Data.DataTable;

import adminis.controller.admin.Template.TemplateBuilder;
import adminis.entity.Account;
import adminis.entity.BookOrder;
import adminis.entity.RoomType;

public class Util {

	private String name;
	private String idCard;
	private String arriveDate;
	private String leaveDate;
	private Float price;
	private long month;
	private int day;
	private Long id;
	public Util() {
		
	}
	public Util(RoomType room, BookOrder bookorder, Account account, long month, int day) {
		this.name = account.getName();
		this.idCard = bookorder.getIdCard();
		this.arriveDate = bookorder.getArriveDate();
		this.leaveDate = bookorder.getLeaveDate();
		this.price = room.getPrice();
		this.month = month;
		this.day = day;
		this.id = bookorder.getId();
	}
	public void fill(String realpath) throws IOException {
		Date date  = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
		String n=name;
		String i=idCard;
		String ad=arriveDate;
		String ld=leaveDate;
		Float p=price;
		Template data = Template.builder()
				.name(n)
				.idCard(i)
				.arriveDate(ad)
				.leaveDate(ld)
				.price(p)
				.month(month)
				.day(day)
				.createTime(dateFormat.format(date))
				.build();
		//byte[] modelByte = Files.readAllBytes(Paths.get("C:\\Users\\hp\\Desktop\\asposeTemplate.docx"));
		
		byte[] modelByte = Files.readAllBytes(Paths.get(realpath + "\\resources\\template\\asposeTemplate.docx"));
		System.out.println(realpath);
		byte[] resultByte = Util.fillWordDataByDomain(modelByte, data);
		
		//File resultFile = new File(realpath + "\\resources\\template\\"+name+"Contract.docx");
		File resultFile = new File(realpath + "\\resources\\template\\"+name+id+"Contract.docx");
		FileOutputStream fos = new FileOutputStream(resultFile);
		fos.write(resultByte);
		fos.close();
	}
	
	public static BufferedImage resizeBufferedImage(BufferedImage source, int targetW, int targetH, boolean flag) {
        int type = source.getType();
        BufferedImage target = null;
        double sx = (double) targetW / source.getWidth();
        double sy = (double) targetH / source.getHeight();
        if (flag && sx > sy) {
            sx = sy;
            targetW = (int) (sx * source.getWidth());
        } else if(flag && sx <= sy){
            sy = sx;
            targetH = (int) (sy * source.getHeight());
        }
        if (type == BufferedImage.TYPE_CUSTOM) { 
            ColorModel cm = source.getColorModel();
            WritableRaster raster = cm.createCompatibleWritableRaster(targetW, targetH);
            boolean alphaPremultiplied = cm.isAlphaPremultiplied();
            target = new BufferedImage(cm, raster, alphaPremultiplied, null);
        } else {
            target = new BufferedImage(targetW, targetH, type);
        }
        Graphics2D g = target.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.drawRenderedImage(source, AffineTransform.getScaleInstance(sx, sy));
        g.dispose();
        return target;
    }
	
	public static byte[] fillWordDataByDomain(byte[] modelWordByte, Object obj) {
        try {
            Class<?> aClass = obj.getClass();
            java.lang.reflect.Field[] fields = aClass.getDeclaredFields();
            Map<String, Object> data = new HashMap<>(fields.length);
            for (java.lang.reflect.Field field : fields) {
                PropertyDescriptor pd = new PropertyDescriptor(field.getName(), aClass);
                Method method = pd.getReadMethod();
                String key = field.getName();
                Object value = method.invoke(obj);
                if (value != null) {
                    data.put(key, value);
                }
            }
            return fillWordDataByMap(modelWordByte, data);
        } catch (Exception e) {
            return new byte[0];
        }
    }

	public static byte[] fillWordDataByMap(byte[] file, Map<String, Object> data) throws Exception {
        byte[] ret = null;
        if (data == null || data.isEmpty()) {
            return ret;
        }

        try (InputStream is = new ByteArrayInputStream(file);
             ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Document doc = new Document(is);
            DocumentBuilder builder = new DocumentBuilder(doc);
            Map<String, String> toData = new HashMap<>();
            for (Map.Entry<String, Object> en : data.entrySet()) {
                String key = en.getKey();
                Object value = en.getValue();

                if (value instanceof List) {
                    //写入表数据
                    DataTable dataTable = fillListData((List) value, key, builder);
                    doc.getMailMerge().executeWithRegions(dataTable);
                }

                if (value instanceof BufferedImage) {
                    builder.moveToMergeField(key);
                    builder.insertImage((BufferedImage) value);
                }

                String valueStr = String.valueOf(en.getValue());
                if (value == null || value.equals("null")) {
                    continue;
                }
                toData.put(key, valueStr);
            }
            String[] fieldNames = new String[toData.size()];
            String[] values = new String[toData.size()];
            int i = 0;
            for (Map.Entry<String, String> entry : toData.entrySet()) {
                fieldNames[i] = entry.getKey();
                values[i] = entry.getValue();
                i++;
            }
            doc.getMailMerge().execute(fieldNames, values);
            doc.save(out, SaveOptions.createSaveOptions(SaveFormat.DOCX));
            ret = out.toByteArray();
        }
        return ret;
    }
	
	private static DataTable fillListData(List<Object> list, String tableName, DocumentBuilder builder) throws Exception {

        DataTable dataTable = new DataTable(tableName);
        for (Object obj : list) {
            DataRow dataRow = dataTable.newRow();
            Class<?> objClass = obj.getClass();
            java.lang.reflect.Field[] fields = objClass.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                java.lang.reflect.Field field = fields[i];
                dataTable.getColumns().add(fields[i].getName());
                PropertyDescriptor pd = new PropertyDescriptor(field.getName(), objClass);
                Method method = pd.getReadMethod();
                dataRow.set(i, method.invoke(obj));
            }
            dataTable.getRows().add(dataRow);
        }
        return dataTable;
    }
}
