package teamphony.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.MemberResolver.Method;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamphony.domain.Member;
import teamphony.domain.Team;
import teamphony.service.facade.MemberService;
import teamphony.service.facade.TeamService;

// teamCode 중복 없이 randomGenerate

@Controller
@RequestMapping("team")
public class TeamController {

	private static int TEAM_CODE = 1000;

	@Autowired
	private TeamService teamService;

	@RequestMapping("create.do")
	public String createTeam(Team team, HttpSession session) {

		// Member로 임시 테스트
		Member member = (Member) session.getAttribute("member");
		String leaderId = member.getMemberId();
		int teamCode = getTeamCode();

		team.setLeaderId(leaderId);

		// code 임시 generate
		team.setCode(teamCode);
		session.setAttribute("teamCode", teamCode);

		// Leader는 생성과 동시에 그 팀에 속하는 팀원임
		teamService.registerTeam(team);
		teamService.belongToTeam(teamCode, leaderId);

		return "redirect:/team/main.do";
	}

	private int getTeamCode() {

		if (TEAM_CODE > 9999) {

			System.out.println("팀 수에 한계가 발생했습니다.");
			return -1;
		}

		return TEAM_CODE++;
	}

	@RequestMapping("revise.do")
	public String reviseTeam(Team team) {

		return null;
	}

	@RequestMapping("erase.do")
	public String eraseTeam(int teamCode) {

		return null;
	}

	@RequestMapping("join.do")
	public String joinTeam(int teamCode, HttpSession session) {

		Team team = teamService.findTeamByTeamCode(teamCode);

		return "team/teamManage";
	}

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String searchTeamByCode(int teamCode, HttpSession session, Model model) {

		Team team = teamService.findTeamByTeamCode(teamCode);
		List<Member> memberList = teamService.findMembersByTeamCode(teamCode);
		Member member = (Member) session.getAttribute("member");
		String id = null, leaderId = null;

		team.setMemberList(memberList);
		model.addAttribute("team", team);
		model.addAttribute("memberList", memberList);

		id = ((Member) session.getAttribute("member")).getMemberId();
		leaderId = team.getLeaderId();

		if (session.getAttribute("teamCode") == null) {

			session.setAttribute("teamCode", teamCode);
		}

		if (id.equals(leaderId))
			return "team/teamManageForLeader";

		return "team/teamManage";
	}

	public String searchMembersByCode(HttpSession session) {

		return null;
	}

	@RequestMapping("withdraw.do")
	public String withdrawTeam(HttpSession session) {

		return null;
	}

	@RequestMapping("invite.do")
	public String inviteMember(String e_mail_1, HttpSession session) {
		int teamCode = (Integer) session.getAttribute("teamCode");
		try {
			GoogleMail.Send("tnghsla13", "tlqkf9464", e_mail_1, "Welcom to teamphony", teamCode + "");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return "redirect:/team/search.do?teamCode=" + teamCode;
	}

	@RequestMapping("main.do")
	public String searchTeamsByMemberId(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");
		String memberId = member.getMemberId();

		List<Team> teamList = teamService.findTeamsByMemberId(memberId);

		model.addAttribute("teamList", teamList);

		return "team/main";
	}
}
