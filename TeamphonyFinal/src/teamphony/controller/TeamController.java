package teamphony.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamphony.domain.Team;
import teamphony.service.facade.TeamService;

// teamCode 중복 없이 randomGenerate

@Controller
@RequestMapping("team")
public class TeamController {

	private static int TEAM_CODE = 1000;

	@Autowired
	private TeamService service;
	
	 

	@RequestMapping("create.do")
	public String createTeam(Team team, HttpSession session, Model model) {

		team.setLeaderId("1");
		team.setCode(getTeamCode());
		service.registerTeam(team);

		return "team/teamList";
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
}
