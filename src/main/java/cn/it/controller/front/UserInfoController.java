package cn.it.controller.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.it.service.UserService;

@Controller
public class UserInfoController {
	
	@Autowired
	private UserService userService;
	
	/*
	 * 获取修改页面
	 */
	@RequestMapping(value="changeInfo",method=RequestMethod.GET)
	public String changeInfo() {
		return "front/changeInfo";
	}
	/*
	 * 修改提交
	 */
	@ResponseBody
	@RequestMapping(value="changeInfo",method=RequestMethod.POST)
	public String changeInfo(HttpSession session,@RequestParam("nickname") String nickname,
			@RequestParam("gender") String gender,
			@RequestParam("phone") String phone) {
			JSONObject object = new JSONObject();
			if (userService.changeInfo((Integer)session.getAttribute("uid"), nickname, phone, gender)) {
				object.put("success", true);
			}else {
				object.put("success", false);
			}
			return object.toJSONString();
	}
	/*
	 * 修改密码
	 */
	@ResponseBody
	@RequestMapping(value="changePassword",method=RequestMethod.POST)
	public String changePassword(HttpSession session,@RequestParam("password") String password,
			@RequestParam("new_password") String new_password) {
		
			JSONObject object = new JSONObject();
			if(userService.findOneByName((String)session.getAttribute("user")).getPassword().equals(password) ) {
				if (userService.changePassword((Integer)session.getAttribute("uid"), new_password)) {
					object.put("success", true);
				}else {
					object.put("success", false);
				}
			}else {
				object.put("success", false);
			}
			
			return object.toJSONString();
	}
	/*
	 * 获取用户信息
	 */
	@ResponseBody
	@RequestMapping(value="get_info",method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	public String getInfo(HttpSession session) {
		
			JSONObject object = new JSONObject();
			object.put("user",userService.findOneByName((String)session.getAttribute("user")));
			return object.toJSONString();
	}
}
