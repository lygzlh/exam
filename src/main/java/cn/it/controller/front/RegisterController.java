package cn.it.controller.front;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONParser;
import com.alibaba.fastjson.JSONObject;

import cn.it.domain.User;
import cn.it.service.UserService;

@Controller
public class RegisterController {
	
	@Autowired
	private UserService userService;
	
	/*
	 * 获取注册界面
	 */
	@RequestMapping(value="register",method=RequestMethod.GET)
	public String Register(HttpSession session,Map<String, Object> map) {
		return "front/register";
	}
	
	/*
	 * 接收注册信息
	 */
	@ResponseBody
	@RequestMapping(value="register",method=RequestMethod.POST)
	public String Register(User user) {
		JSONObject object = new JSONObject();
			if (userService.insert(user)) {
				object.put("success", true);
			}else {
				object.put("success", false);
			}
		return object.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="isExists",method=RequestMethod.POST)
	public String isExists(@RequestParam("username") String username) {
		JSONObject object = new JSONObject();
			if (userService.isExistsUser(username)) {
				object.put("success", true);
			}else {
				object.put("success", false);
			}
		return object.toJSONString();
	}
}
