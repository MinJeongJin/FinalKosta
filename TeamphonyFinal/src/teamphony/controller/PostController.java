package teamphony.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamphony.domain.Member;
import teamphony.domain.Post;
import teamphony.service.facade.MemberService;
import teamphony.service.facade.PostService;

@Controller
@RequestMapping("post")
public class PostController {
	
	@Autowired
	private PostService postService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="create.do", method=RequestMethod.POST)
	public String createPost(HttpSession session, HttpServletRequest request, String contents){
		
		Post post = new Post();
		post.setContents(contents);
		post.setMember(memberService.findMemberByMemberId(((Member)session.getAttribute("member")).getMemberId()));
		post.setTeamCode((int)session.getAttribute("teamCode"));
		post.setFilePath("pass");
		post.setImagePath("pass");
		post.setVideoLink("pass");
		
		postService.registerPost(post);
		
		return "redirect:/post/postList.do";
	}
	
	@RequestMapping("list.do")
	public String searchAllPost(HttpSession session, Model model){
		int teamCode = (int)session.getAttribute("teamCode");
		List<Post> listPost = postService.findAllPost(teamCode);
		
		model.addAttribute("listPost", listPost);
		return "post/postList";
	}
	
}