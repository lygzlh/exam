package cn.it.controller.front;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.it.domain.Category;
import cn.it.service.QuestionService;

@Controller
public class HomePageController {
	
	@Autowired
	private QuestionService questionService;
	/*
	 * ��ҳ
	 */
	@RequestMapping("/")
	public String homePage(HttpSession session,Map<String, Object> map) {
		String user = (String)session.getAttribute("user");
		if(user == null) {
			return "redirect:/login";
		}else {
		    List<Category> cates = questionService.findAllCategory();
		    map.put("categoryList", cates);
			return "front/homePage";
		}
	}

}
