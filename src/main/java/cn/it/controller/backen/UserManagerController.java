package cn.it.controller.backen;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.it.domain.Category;
import cn.it.domain.Progress;
import cn.it.domain.Question;
import cn.it.domain.User;
import cn.it.service.QuestionService;
import cn.it.service.UserService;

@Controller
@RequestMapping("admin")
public class UserManagerController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private QuestionService questionService;
	
	/*
	 * 获取user页
	 */
	@RequestMapping("get_user")
	public String getUser(HttpSession session,Map<String, Object> map,@RequestParam("page") Integer page) {
		int cpage = (page-1)*10;
		int pgcount = userService.countUserNum("");
		int start = 1;
		map.put("recordCount",pgcount);
		if(pgcount%10==0) {
			pgcount = pgcount/10;
		}else {
			pgcount = pgcount/10+1;
		}
		if(pgcount>9) {

			if(page>4 && page<pgcount-4) {
				start=page-4;
			}else if(page>pgcount-4) {
				start=pgcount-8;
			}
		}
		List<User> users = userService.findAll(cpage);
		map.put("userList", users);
		map.put("cpage",page);
		map.put("pgcount",pgcount);
		map.put("start",start);
		return "backen/userManagerPage";
	}
	
	/*
	 * 查询
	 */
	@ResponseBody
	@RequestMapping(value="searchUser",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public String searchUser(@RequestParam("name") String name,@RequestParam("page") Integer page) {
		int cpage = (page-1)*10;
		int pgcount = userService.countUserNum(name);
		int start = 1;
		JSONObject object = new JSONObject();
		object.put("recordCount",pgcount);
		if(pgcount%10==0) {
			pgcount = pgcount/10;
		}else {
			pgcount = pgcount/10+1;
		}
		if(pgcount>9) {

			if(page>4 && page<pgcount-4) {
				start=page-4;
			}else if(page>pgcount-4) {
				start=pgcount-8;
			}
		}
		List<User> users = userService.findAllByName(name,cpage);
		object.put("userList",users);
		object.put("cpage",page);
		object.put("pgcount",pgcount);
		object.put("start",start);
		return object.toJSONString();
	}
	/*
	 * 新增
	 */
	@ResponseBody
	@RequestMapping("newUser")
	public String newUser(User user) {
		JSONObject object = new JSONObject();
		if(userService.insert(user)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	/*
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("delete-user")
	public String delUser(@RequestParam("cid") Integer cid) {
		JSONObject object = new JSONObject();
		if(userService.delUserById(cid)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	
	/*
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("update-user")
	public String updateUser(User user) {
		JSONObject object = new JSONObject();
		if(userService.updateUser(user)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	/*
	 * 查看
	 */
	@ResponseBody
	@RequestMapping("detail-user")
	public String detailUser(HttpSession session,@RequestParam("uid") Integer uid) {
		JSONObject object = new JSONObject();
		List<Category> cate = questionService.findAllCategory();
		List<Progress> progressInfo = new ArrayList<Progress>();
		for(Category c:cate) {
			int qnum = questionService.countQuestionNum("",c.getId());
			int wnum = questionService.rwQuestionCount(0, 1, uid,c.getId());
			int rnum = questionService.rwQuestionCount(1, 0, uid,c.getId());
			Progress p = new Progress(c,qnum,wnum,rnum);
			progressInfo.add(p);
		}
		object.put("progressList",progressInfo);
		return object.toJSONString();
	}
}
