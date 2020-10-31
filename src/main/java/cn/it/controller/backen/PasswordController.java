package cn.it.controller.backen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.it.domain.Admin;
import cn.it.service.UserService;

@RequestMapping("admin")
@Controller
public class PasswordController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="change_password",method=RequestMethod.GET)
	public String pswPage() {
		return "backen/changePwd";
	}
	
	@ResponseBody
	@RequestMapping(value="change_password",method=RequestMethod.POST)
	public String changePwd(@RequestParam("newPwd") String npwd,@RequestParam("pwd") String pwd) {
		JSONObject object = new JSONObject();
		Admin a = userService.adminPwdIsRight(pwd);
		if(a.getPassword().equals(pwd)) {
			
			if(userService.adminChangePassword(npwd)) {
				object.put("success", '1');
			}else {
				object.put("success", '2');
			}
		}else {
			object.put("success", '3');
		}
		
		return object.toJSONString();
	}
}
