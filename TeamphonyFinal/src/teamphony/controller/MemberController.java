package teamphony.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import teamphony.domain.Member;
import teamphony.service.facade.MemberService;
import teamphony.service.facade.TeamService;

@Controller
@RequestMapping("member")
public class MemberController {
	private static final String filePath = "resources\\images\\";

	@Autowired
	private MemberService service;
	
	@Autowired
	private TeamService teamService;

	@RequestMapping(value = "login.do")
	public String login(HttpSession session, String loginId, String loginPw, Model model) {
		System.out.println(loginId);
		Member result = service.findMemberByMemberId(loginId);
		System.out.println(result.getMemberId());
		
		if (result.getAlias() == null || result.getPassword().length() == 0) {
			model.addAttribute("result", "notId");
			return "/common/login";
		} else if (!result.getPassword().equals(loginPw)) {
			model.addAttribute("result", "true");
			return "/common/login";
		} else {
			System.out.println(result.getStarPoint());
			session.setAttribute("member", result);
			return "redirect:/team/main.do";
		}

	}

	@RequestMapping(value = "create.do", method = RequestMethod.POST)
	public String createMember(String memberId, String password, String alias, HttpServletRequest request) {
		Member member = new Member(memberId, alias, password);

		// http://addio3305.tistory.com/83 참조

		// Request에서 첨부파일을 받기위해 캐스팅을 함
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		// 첨부 파일을 개수 파악?
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		// 필요한 변수 선언
		MultipartFile multipartFile = null;
		String originalFileName = null;
		
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println(root+filePath + memberId);

		// 파일을 저장할 폴더 설정
		File file = new File(root+filePath + memberId + "\\");
		// 폴더가 없으면 폴더 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		// 첨부 파일 찾기
		if (iterator.hasNext()) {
			// 첨부파일 불러오기
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			// 첨부파일 존재 여부 확인
			if (multipartFile.isEmpty() == false) {
				// 파일이름 저장
				originalFileName = multipartFile.getOriginalFilename();

				// 폴더구조를 폴더안에 아이디로 구분 해야하기 때문에 폴더구조 생성
				file = new File(root+filePath + memberId + "\\" + originalFileName);
				member.setImagePath(root+filePath + memberId + "\\" + originalFileName);
				try {
					// 파일 전송
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		service.registerMember(member);

		return "/common/login";
	}

	@RequestMapping("check.do")
	public String checkMember(HttpSession session, String password, String flag) {

		Member member = (Member) session.getAttribute("member");
		System.out.println(password);
		System.out.println(member.getPassword());
		System.out.println(flag);
		if (member.getPassword().equals(password)) {
			return "/member/myPage";
		}
		return null;
	}

	@RequestMapping(value = "revise", method = RequestMethod.POST)
	public String reviseMember(HttpSession session, String password, String alias, HttpServletRequest request) {

		Member member = new Member();
		Member login = (Member) session.getAttribute("member");
		// Request에서 첨부파일을 받기위해 캐스팅을 함
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		// 첨부 파일을 개수 파악?
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		// 필요한 변수 선언
		MultipartFile multipartFile = null;
		String originalFileName = null;

		// 파일을 저장할 폴더 설정
		File file = new File(filePath + login.getMemberId() + "\\");
		// 폴더가 없으면 폴더 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		// 첨부 파일 찾기
		if (iterator.hasNext()) {
			// 첨부파일 불러오기
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			// 첨부파일 존재 여부 확인
			if (multipartFile.isEmpty() == false) {
				// 파일이름 저장
				originalFileName = multipartFile.getOriginalFilename();

				// 폴더구조를 폴더안에 아이디로 구분 해야하기 때문에 폴더구조 생성
				file = new File(filePath + login.getMemberId() + "\\" + originalFileName);
				member.setImagePath(filePath + login.getMemberId() + "\\" + originalFileName);
				try {
					// 파일 전송
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} 

		System.out.println(password + " " + alias);
		if (!session.isNew()) {
			member.setMemberId(login.getMemberId());
		}
		if (password.equals("null")) {
			member.setPassword(login.getPassword());
		} else {
			member.setPassword(password);
		}
		if (alias.equals("null")) {
			member.setPassword(login.getAlias());
		} else {
			member.setAlias(alias);
		}

		service.modifyMember(member);
		session.setAttribute("member", member);

		return "/member/myPage";
	}

	@RequestMapping(value = "revise.do", method = RequestMethod.GET)
	public String revise(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");

		System.out.println(member.getMemberId());

		Member reviseMember = service.findMemberByMemberId(member.getMemberId());

		model.addAttribute("member", reviseMember);
		System.out.println("ok");
		return "/member/reviseMember";
	}

	@RequestMapping("delete.do")
	public String delete(HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		System.out.println(member.getMemberId());
		service.removeMember(member.getMemberId());

		return "/common/login";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/views/common/login.jsp";
	}
	
	@RequestMapping(value="evaluationList", method=RequestMethod.GET)
	public String EvaluationMemberList(HttpSession session, Model model){
		int teamCode = (int)session.getAttribute("teamCode");
		
		List<Member> list=teamService.findMembersByTeamCode(teamCode);
		
		model.addAttribute("memberList",list);
		
		return "/member/evaluationList";
	}
	
	@RequestMapping(value="evaluation", method=RequestMethod.GET)
	public String EvaluationMember(String memberId, Model model){
		
		Member member = service.findMemberByMemberId(memberId);
		
		model.addAttribute("evaluationMember",member);
		
		return "/member/evaluationMember";
	}
	
	@RequestMapping(value="evaluation", method=RequestMethod.POST)
	public String EvaluationMember(String memberId, int starPoint){
		System.out.println(memberId);
		System.out.println(starPoint);
		service.saveStarPoint(memberId, starPoint);
		
		return "redirect:/team/main.do";
	}


}
