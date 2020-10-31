package cn.it.controller.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSONObject;

import cn.it.domain.Category;
import cn.it.domain.Question;
import cn.it.domain.User;
import cn.it.service.QuestionService;

@Controller
public class ExamController {
	
	@Autowired
	private QuestionService questionService;
	String rightAnswer= null;
    int nid = 0; //题目id
	/*
	 * 出题
	 */
	@RequestMapping(value="practice")
	public String test(HttpSession session,Map<String, Object> map,@RequestParam("category") Integer cate) {
		String user = (String)session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}else {
		    List<Question> question = questionService.randomQuestion((Integer)session.getAttribute("uid"),cate);

		    if(question.size()==0) {
		    	return "redirect:/progress_detail?category="+cate;
		    }else {
				for(Question q:question) {
					rightAnswer=q.getRightAnswer();
					nid = q.getId();
				}
				int questionCount = questionService.countQuestionNum("", cate);
				int finishCount = questionService.countFinishQuestion("", cate, (Integer)session.getAttribute("uid"));
				map.put("isWrong", 0);
				map.put("questionList", question);
				map.put("questionCount", questionCount);
				map.put("finishCount", finishCount);
				return "front/practice";
		    }
		}
	}
	
	/*
	 * 处理回答是否是正确答案
	 */
	@ResponseBody
	@RequestMapping(value="handle_question",method=RequestMethod.POST)
	public String handleQuestion(HttpSession session,@RequestParam(value ="answer") String answer) {
			JSONObject object = new JSONObject();
			if(answer.equals(rightAnswer)) {
				object.put("success", true);
				questionService.rightQuestion((Integer)session.getAttribute("uid"), nid,1);
			}else {
				object.put("success", false);
				questionService.rightQuestion((Integer)session.getAttribute("uid"), nid,0);
			}
			object.put("right",rightAnswer);
		return object.toJSONString();
	}
	
	/*
	 * 错题练习出题
	 */
	@RequestMapping(value="wrong_practice")
	public String wrongPractice(HttpSession session,Map<String, Object> map,@RequestParam("category") Integer cate) {
		List<Question> wrongQuestion = questionService.randomWrongQuestion((Integer)session.getAttribute("uid"), cate);
		if(wrongQuestion.size()==0) {
	    	return "redirect:/progress_detail?category="+cate;
	    }else {
			for(Question q:wrongQuestion) {
				rightAnswer=q.getRightAnswer();
				nid = q.getId();
			}
			int questionCount = questionService.countWrongQuestionNum("", cate, (Integer)session.getAttribute("uid"));
			int finishCount = 0;
			map.put("isWrong", 1);
			map.put("questionList", wrongQuestion);
			map.put("questionCount", questionCount);
			map.put("finishCount", finishCount);
			return "front/practice";
	    }

	}
	
	/*
	 * 处理错题答案
	 */
	@ResponseBody
	@RequestMapping(value="handle_wrong_question",method=RequestMethod.POST)
	public String handleWrongQuestion(HttpSession session,@RequestParam(value ="answer") String answer) {
			JSONObject object = new JSONObject();
			if(answer.equals(rightAnswer)) {
				object.put("success", true);
				questionService.wrongQuestionHandle((Integer)session.getAttribute("uid"), nid);
			}else {
				object.put("success", false);
			}
			object.put("right",rightAnswer);
		return object.toJSONString();
	}
	
	/*
	 * 重置问题
	 */
	@ResponseBody
	@RequestMapping(value="reset_question",method=RequestMethod.POST)
	public String resetQuestion(HttpSession session,@RequestParam("category") Integer cate) {
		JSONObject object = new JSONObject();
		if(questionService.resetQuestion((Integer)session.getAttribute("uid"), cate)) {
			object.put("success", true);
		}else {
			object.put("success", false);
		}
		return object.toJSONString();
	}

}
