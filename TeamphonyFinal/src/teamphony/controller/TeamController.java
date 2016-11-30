package teamphony.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		Member member = (Member)session.getAttribute("member");
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

		return null;
	}

	@RequestMapping("search.do")
	public String searchTeamByCode(HttpSession session, Model model) {

		return null;
	}

	public String searchMemberByCode(HttpSession session) {

		return null;
	}

	@RequestMapping("withdraw.do")
	public String withdrawTeam(HttpSession session) {

		return null;
	}

	@RequestMapping("invite.do")
	public String inviteMember(List<String> email, HttpSession session) {

		return null;
	}

	@RequestMapping("main.do")
	public String searchTeamsByMemberId(HttpSession session, Model model) {

		Member member = (Member)session.getAttribute("member");
		String memberId = member.getMemberId();

		List<Team> teamList = teamService.findTeamsByMemberId(memberId);

		model.addAttribute("teamList", teamList);

		return "team/teamList";
	}
}
