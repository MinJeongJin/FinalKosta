package teamphony.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamphony.service.facade.PostService;

@Controller
@RequestMapping("post")
public class PostController {
	
	@Autowired
	private PostService service;
	
	
	public String createPost(HttpSession session, HttpServletRequest request, String contents){
		return "redirct:/searchAll.do";
	}
	
	public String searchAllPost(HttpSession session, Model model){
		int teamCode = (int)session.getAttribute("teamCode");
		return "post/postList";
	}
	

}
