package teamphony.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamphony.domain.Member;
import teamphony.service.facade.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping("login.do")
	public String login(HttpSession session, String loginId, String loginPw, Model model) {
		Member member = new Member(loginId, loginPw);
		// boolean result = service.checkMember(member);
		if (loginId.equals("admin")) {
			session.setAttribute("loginId", loginId);
			return "/team/teamList";
		} else {
			model.addAttribute("result", "true");
			return "/common/login";
		}
	}

	@RequestMapping("create.do")
	public String createMember(Member member) {
		
		System.out.println(member.getMemberId());

		service.registerMember(member);
		
		return "/common/login";
	}
}
