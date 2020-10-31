package cn.it.controller.front;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.it.domain.Category;
import cn.it.domain.Progress;
import cn.it.service.QuestionService;

@Controller
public class ProgressController {
	
	@Autowired
	private QuestionService questionService;
	/*
	 * 进度查询页面
	 */
	@RequestMapping(value="progress",method=RequestMethod.GET)
	public String progressBar(HttpSession session,Map<String, Object> map) {
		
		List<Category> cate = questionService.findAllCategory();
		List<Progress> progressInfo = new ArrayList<Progress>();
		for(Category c:cate) {
			int uid=(Integer)session.getAttribute("uid");
			int qnum = questionService.countQuestionNum("",c.getId());
			int wnum = questionService.rwQuestionCount(0, 1, uid,c.getId());
			int rnum = questionService.rwQuestionCount(1, 0, uid,c.getId());
			Progress p = new Progress(c,qnum,wnum,rnum);
			progressInfo.add(p);
		}
		map.put("progressList",progressInfo);
		return "front/progress";
	}
	
	/*
	 * 进度详情
	 */
	@RequestMapping(value="progress_detail",method=RequestMethod.GET)
	public String detailProgress(HttpSession session,Map<String, Object> map,@RequestParam("category") Integer cate) {
		int uid=(Integer)session.getAttribute("uid");
		String cname = questionService.findCategoryById(cate);
		int qnum = questionService.countQuestionNum("",cate);
		int wnum = questionService.rwQuestionCount(0, 1, uid,cate);
		int rnum = questionService.rwQuestionCount(1, 0, uid,cate);
		int fnum = wnum + rnum;
		map.put("cname", cname);
		map.put("qnum", qnum);
		map.put("wnum", wnum);
		map.put("rnum", rnum);
		map.put("fnum", fnum);
		return "front/progressDetail";
	}
}
