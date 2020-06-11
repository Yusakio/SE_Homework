package adminis.controller.home;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import adminis.entity.Account;
import adminis.service.AccountService;
import adminis.service.RoomTypeService;


@RequestMapping("/home")
@Controller
public class HomeController {
	
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model
			){
		model.setViewName("home/index/index");
		return model;
	}
	
	
	@RequestMapping(value="/room_list",method=RequestMethod.GET)
	public ModelAndView index1(ModelAndView model,
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="offset",defaultValue="0") Integer offset,
			@RequestParam(name="pageSize",defaultValue="6") Integer pageSize
			){
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("offset", offset*pageSize);
		queryMap.put("pageSize", pageSize);
		model.addObject("roomTypeList", roomTypeService.findList(queryMap));
		model.setViewName("home/index/room_list");
		
		int num=roomTypeService.getTotal(queryMap);
		//System.out.println(num);
		model.addObject("kw", name);
		model.addObject("maxOffset",num/pageSize+((num%pageSize==0)?0:1)-1);
		model.addObject("offset", offset);
		return model;
	}
	
	@RequestMapping(value="/about",method=RequestMethod.GET)
	public ModelAndView about(ModelAndView model
			){
		model.setViewName("home/about/about");
		return model;
	}
	@RequestMapping(value="/service",method=RequestMethod.GET)
	public ModelAndView service(ModelAndView model
			){
		model.setViewName("home/service/service");
		return model;
	}
	@RequestMapping(value="/contact",method=RequestMethod.GET)
	public ModelAndView contact(ModelAndView model
			){
		model.setViewName("home/contact/contact");
		return model;
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView login(ModelAndView model
			){
		model.setViewName("home/index/login");
		return model;
	}
	
	@RequestMapping(value="/reg",method=RequestMethod.GET)
	public ModelAndView reg(ModelAndView model
			){
		model.setViewName("home/index/reg");
		return model;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> loginAct(Account account,String vcode,HttpServletRequest request){
		Map<String,String> retMap = new HashMap<String, String>();
		if(account == null){
			retMap.put("type", "error");
			retMap.put("msg", "Please check your information!");
			return retMap;
		}
		if(StringUtils.isEmpty(account.getName())){
			retMap.put("type", "error");
			retMap.put("msg", "Username should not be empty.");
			return retMap;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			retMap.put("type", "error");
			retMap.put("msg", "Password should not be empty.");
			return retMap;
		}
		if(StringUtils.isEmpty(vcode)){
			retMap.put("type", "error");
			retMap.put("msg", "Verify code should not be empty.");
			return retMap;
		}
		Object attribute = request.getSession().getAttribute("accountLoginCpacha");
		if(attribute == null){
			retMap.put("type", "error");
			retMap.put("msg", "Please renew the verify code.");
			return retMap;
		}
		if(!vcode.equalsIgnoreCase(attribute.toString())){
			retMap.put("type", "error");
			retMap.put("msg", "Verify code is wrong.");
			return retMap;
		}
		Account findByName = accountService.findByName(account.getName());
		if(findByName == null){
			retMap.put("type", "error");
			retMap.put("msg", "Username does not exist.");
			return retMap;
		}
		if(!account.getPassword().equals(findByName.getPassword())){
			retMap.put("type", "error");
			retMap.put("msg", "Wrong Password");
			return retMap;
		}
		if(findByName.getStatus() == -1){
			retMap.put("type", "error");
			retMap.put("msg", "The account is forbidden, please contact the administrator!");
			return retMap;
		}
		request.getSession().setAttribute("account", findByName);
		request.getSession().setAttribute("accountLoginCpacha", null);
		retMap.put("type", "success");
		retMap.put("msg", "Login Success!");
		return retMap;
	}
	
	@RequestMapping(value="/reg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> regAct(Account account){
		Map<String,String> retMap = new HashMap<String, String>();
		if(account == null){
			retMap.put("type", "error");
			retMap.put("msg", "Please check your information!");
			return retMap;
		}
		if(StringUtils.isEmpty(account.getName())){
			retMap.put("type", "error");
			retMap.put("msg", "Username should not be empty.");
			return retMap;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			retMap.put("type", "error");
			retMap.put("msg", "Password should not be empty.");
			return retMap;
		}
		if(StringUtils.isEmpty(account.getMobile())){
			retMap.put("type", "error");
			retMap.put("msg", "Telephone should not be empty.");
			return retMap;
		}
		if(isExist(account.getName())){
			retMap.put("type", "error");
			retMap.put("msg", "Username exists.");
			return retMap;
		}
		if(accountService.add(account) <= 0){
			retMap.put("type", "error");
			retMap.put("msg", "Register failed, please contact the administrator!");
			return retMap;
		}
		retMap.put("type", "success");
		retMap.put("msg", "Register Success!");
		return retMap;
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		request.getSession().setAttribute("account", null);
		return "redirect:login";
	}
	
	private boolean isExist(String name){
		Account account = accountService.findByName(name);
		if(account == null)return false;
		return true;
	}
}
