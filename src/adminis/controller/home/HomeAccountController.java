package adminis.controller.home;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import adminis.entity.Account;
import adminis.entity.BookOrder;
import adminis.entity.RoomType;
import adminis.service.AccountService;
import adminis.service.BookOrderService;
import adminis.service.FeedBackService;
import adminis.service.RoomTypeService;

import adminis.entity.FeedBack;


@RequestMapping("/home/account")
@Controller
public class HomeAccountController {
	
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private BookOrderService bookOrderService;
	@Autowired
	private FeedBackService feedBackService;


	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView Bookings(ModelAndView model,Long roomTypeId
			){
		model.setViewName("home/account/index");
		return model;
	}		

	
	@RequestMapping(value="/download",method=RequestMethod.GET)
	public void download(ModelAndView model,
			HttpServletRequest request,
			HttpServletResponse response
			) throws IOException{
		String filename = request.getParameter("filename");
		
		String path = request.getServletContext().getRealPath("/") + "/resources/template/"+filename;
		
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		String type = request.getServletContext().getMimeType(filename);
		response.setContentType(type);
		
		ServletOutputStream out = response.getOutputStream();
		
		/*File fi = new File(path);
		if(!fi.exists()) {
			path = request.getServletContext().getRealPath("/") + "/resources/template/"+"no_contract.docx";
		}*/
		
		try {
			FileInputStream in = new FileInputStream(path);
			byte[] b = new byte[1024];
			int len = 0;
			while((len=in.read(b))!=-1) {
				out.write(b,0,len);
			}
			in.close();
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/booking",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model,HttpServletRequest request
			){
		Account account = (Account)request.getSession().getAttribute("account");
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("accountId", account.getId());
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		model.addObject("bookOrderList", bookOrderService.findList(queryMap));
		model.addObject("roomTypeList", roomTypeService.findAll());
		model.setViewName("home/account/booking");
		return model;
	}

	@RequestMapping(value="/profile",method=RequestMethod.GET)
	public ModelAndView Changepwd(ModelAndView model,HttpServletRequest request
			){
		Account account = (Account)request.getSession().getAttribute("account");
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("accountId", account.getId());
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		model.addObject("bookOrderList", bookOrderService.findList(queryMap));
		model.addObject("roomTypeList", roomTypeService.findAll());
		model.setViewName("home/account/profile");
		return model;
	}

	@RequestMapping(value="/feedBack",method=RequestMethod.GET)
	public ModelAndView FeedBack(ModelAndView model,HttpServletRequest request
			,@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="offset",defaultValue="0") Integer offset,
			@RequestParam(name="pageSize",defaultValue="6") Integer pageSize){
		Account account = (Account)request.getSession().getAttribute("account");
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("createId", account.getId());
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		model.addObject("feedBackList", feedBackService.findList(queryMap));
		model.setViewName("home/account/feedBack");
		
		int num=feedBackService.getTotal(queryMap);
		model.addObject("kw", name);
		model.addObject("maxOffset",num/pageSize+((num%pageSize==0)?0:1)-1);
		model.addObject("offset", offset);		
		return model;
	}
	
	@RequestMapping(value="/upload_photo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> uploadPhoto(MultipartFile photo,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(photo == null){
			ret.put("type", "error");
			ret.put("msg", "Please choose the file you want to upload£¡"); 
			return ret;
		}
		if(photo.getSize() > 1024*1024*1024){
			ret.put("type", "error");
			ret.put("msg", "The size cannot bigger than 10M£¡"); 
			return ret;
		}
		String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".")+1,photo.getOriginalFilename().length());
		if(!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())){
			ret.put("type", "error");
			ret.put("msg", "Please choose pics as jpg,jpeg,gif,png£¡"); 
			return ret;
		}
		String savePath = request.getServletContext().getRealPath("/") + "/resources/upload/";
		File savePathFile = new File(savePath);
		if(!savePathFile.exists()){
			savePathFile.mkdir();
		}
		String filename = new Date().getTime()+"."+suffix;
		try {
			photo.transferTo(new File(savePath+filename));
		}catch (Exception e) {
			// TODO Auto-generated catch block
			ret.put("type", "error");
			ret.put("msg", "Save file error£¡"); 
			e.printStackTrace();
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "Save file success£¡"); 
		ret.put("filepath",request.getServletContext().getContextPath() + "/resources/upload/" + filename );
		return ret;
	}
	
	@RequestMapping(value="/addFeedBack",method=RequestMethod.POST)
	public ModelAndView addFeedBack(ModelAndView model,
			HttpServletRequest request,
			@RequestParam(value="story")String text,
			@RequestParam(value="photo")String photo,
			@RequestParam(value="feedBackType")int feedType
			){
		Account account = (Account)request.getSession().getAttribute("account");
		FeedBack feedback = new FeedBack();
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
		feedback.setCreatTime(dateFormat.format(date));
		feedback.setCreateId(account.getId());
		feedback.setText(text);
		feedback.setPhoto(photo);
		feedback.setFeedType(feedType);
		feedBackService.add(feedback);
		model.setViewName("redirect:/home/account/feedBack");
		return model;
	}
	

	@RequestMapping(value="/book_order",method=RequestMethod.GET)
	public ModelAndView bookOrder(ModelAndView model,Long roomTypeId
			){
		model.addObject("roomType", roomTypeService.find(roomTypeId));
		model.setViewName("home/account/book_order");
		return model;
	}
	
	

	@RequestMapping(value="/book_order",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> bookOrderAct(BookOrder bookOrder,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(bookOrder == null){
			ret.put("type", "error");
			ret.put("msg", "Please fill in right order information!"); 
			return ret;
		}
		Account account = (Account)request.getSession().getAttribute("account");
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "Customer cannot be empty!"); 
			return ret;
		}
		bookOrder.setAccountId(account.getId());
		if(bookOrder.getRoomTypeId() == null){
			ret.put("type", "error");
			ret.put("msg", "Room type cannot be empty!"); 
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
			ret.put("msg", "Contactor's id card number cannot be empty!"); 
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
		bookOrder.setStatus(0);
		if(bookOrderService.add(bookOrder) <= 0){
			ret.put("type", "error");
			ret.put("msg", "Add failed, please contact administrator!"); 
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
		ret.put("msg", "Book success!"); 
		return ret;
	}
	

	@RequestMapping(value="/update_info",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> updateInfoAct(Account account,HttpServletRequest request){
		Map<String,String> retMap = new HashMap<String, String>();
		if(account == null){
			retMap.put("type", "error");
			retMap.put("msg", "Please fill in right userinfo£¡"); 
			return retMap;
		}
		if(StringUtils.isEmpty(account.getName())){
			retMap.put("type", "error");
			retMap.put("msg", "Username cannot be empty£¡"); 
			return retMap;
		}
		Account loginedAccount = (Account)request.getSession().getAttribute("account");
		if(isExist(account.getName(),loginedAccount.getId())){
			retMap.put("type", "error");
			retMap.put("msg", "Username already exist£¡"); 
			return retMap;
		}
		loginedAccount.setAddress(account.getAddress());
		loginedAccount.setIdCard(account.getIdCard());
		loginedAccount.setMobile(account.getMobile());
		loginedAccount.setName(account.getName());
		loginedAccount.setRealName(account.getRealName());
		if(accountService.edit(loginedAccount) <= 0){
			retMap.put("type", "error");
			retMap.put("msg", "Modify failed, please contact administrator£¡"); 
			return retMap;
		}
		request.getSession().setAttribute("account", loginedAccount);
		retMap.put("type", "success");
		retMap.put("msg", "Modify success£¡"); 
		return retMap;
	}
	

	@RequestMapping(value="/update_pwd",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> updatePwdAct(String oldPassword,String newPassword,HttpServletRequest request){
		Map<String,String> retMap = new HashMap<String, String>();
		if(StringUtils.isEmpty(oldPassword)){
			retMap.put("type", "error");
			retMap.put("msg", "Please fill in your old password£¡"); 
			return retMap;
		}
		if(StringUtils.isEmpty(newPassword)){
			retMap.put("type", "error");
			retMap.put("msg", "Please fill in your new password£¡"); 
			return retMap;
		}
		Account loginedAccount = (Account)request.getSession().getAttribute("account");
		if(!oldPassword.equals(loginedAccount.getPassword())){
			retMap.put("type", "error");
			retMap.put("msg", "Old password is wrong£¡"); 
			return retMap; 
		}
		loginedAccount.setPassword(newPassword);
		if(accountService.edit(loginedAccount) <= 0){
			retMap.put("type", "error");
			retMap.put("msg", "Modify failed, please contact administrator£¡"); 
			return retMap;
		}
		retMap.put("type", "success");
		retMap.put("msg", "Modify success£¡");
		return retMap;
	}
	

	private boolean isExist(String name,Long id){
		Account account = accountService.findByName(name);
		if(account == null)return false;
		if(account != null && account.getId().longValue() == id)return false;
		return true;
	}
}
