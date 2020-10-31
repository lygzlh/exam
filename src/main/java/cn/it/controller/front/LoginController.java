package cn.it.controller.front;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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

import cn.it.domain.User;
import cn.it.service.UserService;

@Controller
@SessionAttributes({"user","uid"})
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	
	/*
	 * 登录界面
	 */
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String loginGet(HttpSession session) {
		if((String)session.getAttribute("admin") == null) {
			return "front/login";
		}else {
			return "redirect:/";
		}
		
	}
	
	/*
	 * 获取前端发来的登录信息
	 */
	@ResponseBody
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String loginPost(Model model,@RequestParam(value="username") String username,
			@RequestParam(value="password") String password) {
		JSONObject object = new JSONObject();
		User user = userService.findOneByName(username);
		if(user!=null) {
			if(user.getPassword().equals(password)) {
				object.put("success", true);
				model.addAttribute("user", username);
				model.addAttribute("uid",user.getId());
			}else {
				object.put("success", false);
			}
		}else {
			object.put("success", false);
		}
		
		return object.toJSONString();
	}
	
	/**
	 * 注销
	 * @param sessionStatus
	 * @param session
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/login";
	}
	
}
