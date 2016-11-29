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

	@Autowired
	private MemberService memberService;

	@RequestMapping("create.do")
	public String createTeam(Team team, HttpSession session) {

		// leaderId 임시 set
		String tempLeaderId = "tnghsla13";

		team.setLeaderId(tempLeaderId);
		// code 또한 임시 generate
		team.setCode(getTeamCode());

		// Leader는 생성과 동시에 그 팀에 속하는 팀원임
		Member leader = memberService.findMemberByMemberId(tempLeaderId);

		List<Member> memberList = new ArrayList<Member>();
		memberList.add(leader);

		teamService.registerTeam(team);

		return "redirect:/team/main.do";
	}

	private int getTeamCode() {

		if (TEAM_CODE > 9999) {

			System.out.println("팀 수에 한계가 발생했습니다.");
			return -1;
		}

		return TEAM_CODE++;
	}

	public String reviseTeam(Team team) {

		return null;
	}

	public String eraseTeam(int teamCode) {

		return null;
	}

	public String joinTeam(int teamCode, HttpSession session) {

		return null;
	}

	public String searchTeamByCode(HttpSession session, Model model) {

		return null;
	}

	public String searchMemberByCode(HttpSession session) {

		return null;
	}

	public String withdrawTeam(HttpSession session) {

		return null;
	}

	public String inviteMember(List<String> email, HttpSession session) {

		return null;
	}

	@RequestMapping("main.do")
	public String searchTeamsByMemberId(HttpSession session, Model model) {

		System.out.println("정상적으로 잘 작동하고 있습니다.");
		String testId = "tnghsla13";

		List<Team> teamList = teamService.findTeamsByMemberId(testId);

		model.addAttribute("teamList", teamList);

		
		
		return "team/teamList";
	}
}
