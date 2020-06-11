package adminis.controller.admin;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aspose.words.Document;
import com.aspose.words.DocumentBuilder;
import com.aspose.words.Field;
import com.aspose.words.SaveFormat;
import com.aspose.words.SaveOptions;
import com.aspose.words.net.System.Data.DataRow;
import com.aspose.words.net.System.Data.DataTable;

import adminis.entity.Account;
import adminis.entity.BookOrder;
import adminis.entity.RoomType;
import adminis.page.admin.Page;
import adminis.service.AccountService;
import adminis.service.BookOrderService;
import adminis.service.RoomTypeService;


@RequestMapping("/admin/book_order")
@Controller
public class BookOrderController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private BookOrderService bookOrderService;
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.addObject("roomTypeList", roomTypeService.findAll());
		model.addObject("accountList", accountService.findAll());
		model.setViewName("book_order/list");
		return model;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(BookOrder bookOrder){
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "Please file in the right information!");
			return ret;
		}
		if(bookOrder.getAccountId() == null){
			ret.put("type", "error");
			ret.put("msg", "The customer can not be empty!");
			return ret;
		}
		if(bookOrder.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "House type can not be empty!"); 
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getName())){
			ret.put("type", "error");
			ret.put("msg", "The reservation order contact name cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "The reservation order contact tele-number cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getIdCard())){
			ret.put("type", "error");
			ret.put("msg", "The contacts' Id card number cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "Arrive time cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getLeaveDate())){
			ret.put("type", "error");
			ret.put("msg", "Leave time cannot be empty!");
			return ret;
		}
		bookOrder.setCreateTime(new Date());
		if(bookOrderService.add(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "Add fail, please contact the Administrator!");
			return ret;
		}
		RoomType roomType = roomTypeService.find(bookOrder.getRoomTypeId());
		if(roomType != null){
			roomType.setBookNum(roomType.getBookNum() + 1);
			roomType.setAvilableNum(roomType.getAvilableNum() - 1);
			roomTypeService.updateNum(roomType);
			if(roomType.getAvilableNum() == 0){
				roomType.setStatus(0);
				roomTypeService.edit(roomType);
			}
		}
		ret.put("type", "success");
		ret.put("msg", "Add success!");
		return ret;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(HttpServletRequest request,BookOrder bookOrder) throws ParseException{
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "Please fill in right order information!");
			return ret;
		}
		if(bookOrder.getAccountId() == null){
			ret.put("type", "error");
			ret.put("msg", "The customer can not be empty!");
			return ret;
		}
		if(bookOrder.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "House type can not be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getName())){
			ret.put("type", "error");
			ret.put("msg", "The reservation order contact tele-number cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getMobile())){
			ret.put("type", "error");
			ret.put("msg", "The reservation order contact tele-number cannot be empty!");
		}
		if(StringUtils.isEmpty(bookOrder.getIdCard())){
			ret.put("type", "error");
			ret.put("msg", "The contacts' Id card number cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getArriveDate())){
			ret.put("type", "error");
			ret.put("msg", "Arrive time cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(bookOrder.getLeaveDate())){
			ret.put("type", "error");
			ret.put("msg", "Leave time cannot be empty!");
			return ret;
		}
		BookOrder existBookOrder = bookOrderService.find(bookOrder.getId());
		if(existBookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "Please choose the right data to edit!");
			return ret;
		}
		if(existBookOrder.getRoomTypeId().longValue() != bookOrder.getRoomTypeId().longValue()){
			RoomType oldRoomType = roomTypeService.find(existBookOrder.getRoomTypeId());
			oldRoomType.setAvilableNum(oldRoomType.getAvilableNum() + 1);
			oldRoomType.setBookNum(oldRoomType.getBookNum() - 1);
			roomTypeService.updateNum(oldRoomType);
			if(oldRoomType.getStatus() == 0){
				if(oldRoomType.getAvilableNum() > 0){
					oldRoomType.setStatus(1);
					roomTypeService.edit(oldRoomType);
				}
			}
			RoomType newRoomType = roomTypeService.find(bookOrder.getRoomTypeId());
			newRoomType.setAvilableNum(newRoomType.getAvilableNum() - 1);
			newRoomType.setBookNum(newRoomType.getBookNum() + 1);
			roomTypeService.updateNum(newRoomType);
			if(newRoomType.getAvilableNum() <= 0){
				newRoomType.setStatus(0);
				roomTypeService.edit(newRoomType);
			}
		}
		Date date  = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
		if(existBookOrder.getStatus()!=2 && bookOrder.getStatus() == 2) {
			RoomType Type = roomTypeService.find(bookOrder.getRoomTypeId());
			Type.setAvilableNum(Type.getAvilableNum() + 1);
			Type.setBookNum(Type.getBookNum() - 1);
			roomTypeService.updateNum(Type);
		}
		else if(bookOrder.getLeaveDate().compareTo(dateFormat.format(date)) == 0) {
			RoomType Type = roomTypeService.find(bookOrder.getRoomTypeId());
			Type.setAvilableNum(Type.getAvilableNum() + 1);
			Type.setBookNum(Type.getBookNum() - 1);
			roomTypeService.updateNum(Type);
		}
		if(bookOrder.getStatus() == 1 && (existBookOrder.getStatus() == 0 || existBookOrder.getStatus() == 2)) {
			String s1 = bookOrder.getArriveDate();
			String s2 = bookOrder.getLeaveDate();
			Date ad = dateFormat.parse(s1);
			Date ld = dateFormat.parse(s2);
			long diff = ld.getTime()-ad.getTime();
			long se = 1000;
			long mi = se*60;
			long ho = mi*60;
			long day = ho*24;
			long totalday = diff/day;
			if(totalday >= 30) {
				bookOrder.setContract(1);
				existBookOrder.setContract(1);
				long month = totalday/30;
				int dayy;
				int aa = Integer.parseInt(s1.substring(8, 10));
				int bb = Integer.parseInt(s2.substring(8, 10));
				
				if(aa > bb)
					dayy = bb-aa+30;
				else
					dayy = bb-aa;
				RoomType Room = roomTypeService.find(bookOrder.getRoomTypeId());
				Account acc = accountService.find(bookOrder.getAccountId());
				Util u = new Util(Room,bookOrder,acc,month, dayy);
				try {
					u.fill(request.getServletContext().getRealPath("/"));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(bookOrderService.edit(bookOrder) <= 0){
					ret.put("type", "error");
					ret.put("msg", "Edit fail, please contact Administrator!");
					return ret;
				}
				ret.put("type","contract");
				ret.put("msg", "Modify success!");
				return ret;
			}
		}
		if(bookOrderService.edit(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "Edit fail, please contact Administrator!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "Modify success!");
		return ret;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="accountId",defaultValue="") Long accountId,
			@RequestParam(name="roomTypeId",defaultValue="") Long roomTypeId,
			@RequestParam(name="idCard",defaultValue="") String idCard,
			@RequestParam(name="mobile",defaultValue="") String mobile,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("accountId", accountId);
		queryMap.put("roomTypeId", roomTypeId);
		queryMap.put("idCard", idCard);
		queryMap.put("mobile", mobile);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", bookOrderService.findList(queryMap));
		ret.put("total", bookOrderService.getTotal(queryMap));
		return ret;
	}
	
}
