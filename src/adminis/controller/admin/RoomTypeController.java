package adminis.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import adminis.entity.RoomType;
import adminis.page.admin.Page;
import adminis.service.RoomTypeService;

@RequestMapping("/admin/room_type")
@Controller
public class RoomTypeController {
	
	@Autowired
	private RoomTypeService roomTypeService;
	
	

	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("room_type/list");
		return model;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(RoomType roomType){
		Map<String, String> ret = new HashMap<String, String>();
		if(roomType == null){
			ret.put("type", "error");
			ret.put("msg", "Please fill in the right room type information!"); 
			return ret;
		}
		if(StringUtils.isEmpty(roomType.getName())){
			ret.put("type", "error");
			ret.put("msg", "Room type name cannot be empty!"); 
			return ret;
		}
		roomType.setAvilableNum(roomType.getRoomNum());
		roomType.setBookNum(0);
		roomType.setLivedNum(0);
		if(roomTypeService.add(roomType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "Add failed, please contact administrator!"); 
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "Add success!");
		return ret;
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(RoomType roomType){
		Map<String, String> ret = new HashMap<String, String>();
		if(roomType == null){
			ret.put("type", "error");
			ret.put("msg", "Please fill in the right room type information!");
			return ret;
		}
		if(StringUtils.isEmpty(roomType.getName())){
			ret.put("type", "error");
			ret.put("msg", "Room type name cannot be empty!"); 
			return ret;
		}
		RoomType existRoomType = roomTypeService.find(roomType.getId());
		if(existRoomType == null){
			ret.put("type", "error");
			ret.put("msg", "Cannot find this data!"); 
			return ret;
		}
		int offset = roomType.getRoomNum() - existRoomType.getRoomNum();
		roomType.setAvilableNum(existRoomType.getAvilableNum() + offset);
		if(roomType.getAvilableNum() <= 0){
			roomType.setAvilableNum(0);
			roomType.setStatus(0);
			if(roomType.getAvilableNum() + existRoomType.getLivedNum() + existRoomType.getBookNum() > roomType.getRoomNum()){
				ret.put("type", "error");
				ret.put("msg", "Room number is unreasonable!"); 
				return ret;
			}
		}
		if(roomTypeService.edit(roomType) <= 0){
			ret.put("type", "error");
			ret.put("msg", "Modify failed, please contact administrator!"); 
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
			@RequestParam(name="status",required=false) Integer status,
			Page page
			){
		Map<String,Object> ret = new HashMap<String, Object>();
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", roomTypeService.findList(queryMap));
		ret.put("total", roomTypeService.getTotal(queryMap));
		return ret;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "Please choose the information you want to delete!"); 
			return ret;
		}
		try {
			if(roomTypeService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "Delete failed, please contact administrator!"); 
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "Order information exists in this room. Please delete all order information in this room first!"); 
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "Delete success!"); 
		return ret;
	}
}
