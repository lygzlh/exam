package cn.it.controller.backen;

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
import cn.it.domain.Question;
import cn.it.service.QuestionService;

@RequestMapping("admin")
@Controller
public class QuestionManageController {

	@Autowired
	private QuestionService questionService;
	
	/*
	 * 获取问题返回前端
	 */
	@RequestMapping(value="question",method=RequestMethod.GET)
	public String question(HttpSession session,Map<String, Object> map,@RequestParam("page") Integer page) {
		int cpage = (page-1)*10;
		int pgcount = questionService.countQuestionNum("",0);
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

		List<Question> questions = questionService.findAll(cpage);
		List<Category> categorys = questionService.findAllCategory();
		map.put("questionList", questions);
		map.put("categoryList", categorys);
		map.put("cpage",page);
		map.put("pgcount",pgcount);
		map.put("start",start);
		return "backen/questionManager";
	}
	
	/*
	 * 修改问题
	 */
	@ResponseBody
	@RequestMapping(value="update_question",method=RequestMethod.POST)
	public String updateQuestion(Question question) {
		JSONObject object = new JSONObject();
		if(questionService.updataQuestion(question)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	
	/*
	 * 添加问题
	 */
	@ResponseBody
	@RequestMapping(value="add_question",method=RequestMethod.POST)
	public String addQuestion(Question question) {
		JSONObject object = new JSONObject();
		if(questionService.insertQuestion(question)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	
	/*
	 * 删除问题
	 */
	@ResponseBody
	@RequestMapping(value="delete_question",method=RequestMethod.POST)
	public String deleteQuestion(@RequestParam("nid") String nid) {
		JSONObject object = new JSONObject();
		if(questionService.deleteQuestion(Integer.valueOf(nid))) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	
	/*
	 * 查询
	 */
	@ResponseBody
	@RequestMapping(value="find_question",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public String findQuestion(Map<String, Object> map,@RequestParam("title") String title,@RequestParam("category") Integer cate,@RequestParam("page") Integer page) {
		int cpage = (page-1)*10;
		int pgcount = questionService.countQuestionNum(title,cate);
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

		List<Question> questions = questionService.findQuestionByTitle(title,cate,cpage);
		
		object.put("questionList",questions);
		object.put("cpage",page);
		object.put("pgcount",pgcount);
		object.put("start",start);
		return object.toJSONString();
	}
	
	/*
	 * 新增类别
	 */
	@ResponseBody
	@RequestMapping("new_cate")
	public String newCate(@RequestParam("cate") String name) {
		JSONObject object = new JSONObject();
		if(questionService.insertCategory(name)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	/*
	 * 删除类别
	 */
	@ResponseBody
	@RequestMapping("delete_cate")
	public String delCate(@RequestParam("cate") Integer cid) {
		JSONObject object = new JSONObject();
		if(questionService.deleteCategory(cid)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
	/*
	 * 修改类别
	 */
	@ResponseBody
	@RequestMapping("change_cate")
	public String changeCate(@RequestParam("cid") Integer cid,@RequestParam("cate") String name) {
		JSONObject object = new JSONObject();
		if(questionService.changeCategory(cid, name)) {
			object.put("success",true);
		}else {
			object.put("success",false);
		}
		return object.toJSONString();
	}
}
