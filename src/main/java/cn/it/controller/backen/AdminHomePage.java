package cn.it.controller.backen;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("admin")
@Controller
public class AdminHomePage {

	@RequestMapping("/home")
	public String home(HttpSession session) {
		if((String)session.getAttribute("admin") == null) {
			return "redirect:login";
		}else {
			return "backen/adminHome";
		}
		
	}
	
}
