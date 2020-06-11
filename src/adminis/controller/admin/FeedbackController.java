package adminis.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import adminis.entity.FeedBack;
import adminis.page.admin.Page;
import adminis.service.AccountService;
import adminis.service.FeedBackService;

@RequestMapping("/admin/feedback")
@Controller
public class FeedbackController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private FeedBackService feedbackService;
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model) {
		model.addObject("accountList", accountService.findAll());
		model.setViewName("feedback/list");
		return model;
	}
	
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(FeedBack feedback) {
		Map<String, String> ret = new HashMap<String, String>();
		if(feedback == null){
			ret.put("type", "error");
			ret.put("msg", "Please fill in the right feedback content!"); 
			return ret;
		}
		if(feedback.getCreateId() == null){
			ret.put("type", "error");
			ret.put("msg", "Feedback people cannot be empty!");
			return ret;
		}
		if(StringUtils.isEmpty(feedback.getFeedback())){
			ret.put("type", "error");
			ret.put("msg", "Feedback response cannot be empty!");
			return ret;
		}
		feedback.setStatus(1);
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
		feedback.setHandleTime(dateFormat.format(date));
		if(feedbackService.edit(feedback) <= 0){
			ret.put("type", "error");
			ret.put("msg", "Edit fail, please contact administrator!"); 
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "Modify success!");
		return ret;
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(name="createId",defaultValue="") Long createId,
			@RequestParam(name="text",defaultValue="") String text,
			@RequestParam(name="feedType",defaultValue="") Integer feedType,
			@RequestParam(name="status",required=false) Integer status,
			Page page
			) {
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("createId", createId);
		queryMap.put("text", text);
		queryMap.put("status", status);
		queryMap.put("feedType", feedType);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", feedbackService.findList(queryMap));
		ret.put("total", feedbackService.getTotal(queryMap));
		return ret;
	}
}
