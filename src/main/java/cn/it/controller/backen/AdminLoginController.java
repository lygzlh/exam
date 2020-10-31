package cn.it.controller.backen;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.alibaba.fastjson.JSONObject;

import cn.it.service.AdminLoginService;

@SessionAttributes({"admin"})
@RequestMapping("admin")
@Controller
public class AdminLoginController {

	@Autowired
	private AdminLoginService adminLoginService;
	
	
	/*
	 * Admin登录界面
	 */
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String Login(HttpSession session) {
		if((String)session.getAttribute("admin") == null) {
			return "backen/adminLogin";
		}else {
			return "redirect:home";
		}
		
	}
	
	/*
	 * 处理admin登录请求
	 */
	@ResponseBody
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String HandleLogin(Model model,@RequestParam("username") String username,
			@RequestParam("password") String password) {
		JSONObject object = new JSONObject();
		if(adminLoginService.findAdmin(username, password)) {
			model.addAttribute("admin", username);
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	/**
	 * 注销
	 * @param sessionStatus
	 * @param session
	 * @return
	 */

	@RequestMapping(value="logout",method=RequestMethod.POST)
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
	
}
