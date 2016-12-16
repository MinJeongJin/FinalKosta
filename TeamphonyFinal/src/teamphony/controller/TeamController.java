package teamphony.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import teamphony.domain.Member;
import teamphony.domain.Members;
import teamphony.domain.Team;
import teamphony.domain.Teams;
import teamphony.service.facade.TeamService;

// teamCode 중복 없이 randomGenerate

@Controller
@RequestMapping("team")
public class TeamController {

	public static final int MAX_TEAM = 9999;
	public static final int NORMAL = 1;
	public static final int WARNNING_NONE = 0;
	public static final int WARNNING_REDUNDANCY = -1;
	public static final int WARNNING_EXCESS = -9999;

	@Autowired
	private TeamService service;

	@RequestMapping(value = "create.do", method = RequestMethod.POST)
	public String createTeam(Team team, HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");
		String leaderId = member.getMemberId();
		int teamCode = getTeamCode();

		team.setLeaderId(leaderId);
		team.setCode(teamCode);

		if (session.getAttribute("teamCode") != null)
			session.removeAttribute("teamCode");

		session.setAttribute("teamCode", teamCode);

		// Leader는 생성과 동시에 그 팀에 속하는 팀원임
		service.registerTeam(team);
		service.belongToTeam(teamCode, leaderId);

		return "redirect:/team/main.do";
	}

	private int getTeamCode() {

		Set<Integer> codeSet = service.findAllTeamCodes();
		int codeSetSize = codeSet.size();

		if (codeSetSize >= MAX_TEAM) {

			System.out.println("팀수 초과");
			return WARNNING_EXCESS;
		}

		int genCode;
		Random codeGenerator = new Random(System.currentTimeMillis());

		while (true) {

			genCode = codeGenerator.nextInt(9000) + 1000;
			codeSet.add(genCode);

			if (codeSetSize < codeSet.size()) {

				return genCode;

			}
		}
	}

	@RequestMapping(value = "revise.do", method = RequestMethod.POST)
	public String reviseTeam(HttpSession session, Team team, Model model) {

		team.setCode((Integer) session.getAttribute("teamCode"));
		service.modifyTeam(team);

		return "redirect:/team/search.do";
	}

	@RequestMapping(value = "erase.do", method = RequestMethod.GET)
	public String eraseTeam(HttpSession session) {

		int teamCode = (Integer) session.getAttribute("teamCode");
		List<Member> memberList = service.findMembersByTeamCode(teamCode);

		for (Member member : memberList) { // 모든 팀원들을 내보냄
			service.leaveTeam(teamCode, member.getMemberId());
		}

		service.removeTeam(teamCode);

		return "redirect:/team/main.do";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.POST)
	public void joinTeam(int teamCode, HttpSession session, HttpServletResponse res) {

		Team team = service.findTeamByTeamCode(teamCode);
		String resObj = null;
		boolean stamp = true;

		if (team == null) {

			resObj = "{\"flag\":\"" + WARNNING_NONE + "\"}";

		} else {

			Member member = (Member) session.getAttribute("member");
			String memberId = member.getMemberId();
			List<Member> memberList = service.findMembersByTeamCode(teamCode);

			for (Member mem : memberList) {

				if (memberId.equals(mem.getMemberId())) {

					stamp = !stamp;
					resObj = "{\"flag\":\"" + WARNNING_REDUNDANCY + "\"}";

					break;
				}

			}

			if (stamp) {

				service.belongToTeam(teamCode, memberId);
				resObj = "{\"flag\":\"" + NORMAL + "\"}";
			}

		}

		try {
			res.getWriter().write(resObj);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "search.do", method = RequestMethod.POST)
	public String searchTeamByCode(int teamCode, HttpSession session, Model model) {

		Team team = service.findTeamByTeamCode(teamCode);
		List<Member> memberList = service.findMembersByTeamCode(teamCode);
		Member member = (Member) session.getAttribute("member");
		String id = null, leaderId = null;

		team.setMemberList(memberList);
		model.addAttribute("member", member);
		model.addAttribute("team", team);
		model.addAttribute("memberList", memberList);

		id = member.getMemberId();
		leaderId = team.getLeaderId();

		if (session.getAttribute("teamCode") != null)
			session.removeAttribute("teamCode");

		session.setAttribute("teamCode", teamCode);

		if (id.equals(leaderId))
			return "team/teamDetail_L";

		return "team/teamDetail";
	}

	@RequestMapping(value = "search.do", method = RequestMethod.GET)
	public String searchTeamByCode(HttpSession session, Model model) {

		int teamCode = (Integer) session.getAttribute("teamCode");

		Team team = service.findTeamByTeamCode(teamCode);
		List<Member> memberList = service.findMembersByTeamCode(teamCode);
		Member member = (Member) session.getAttribute("member");
		String id = null, leaderId = null;

		team.setMemberList(memberList);
		model.addAttribute("team", team);
		model.addAttribute("memberList", memberList);

		id = member.getMemberId();
		leaderId = team.getLeaderId();

		if (id.equals(leaderId))
			return "team/teamDetail_L";

		return "team/teamDetail";
	}

	public String searchMembersByCode(HttpSession session) {

		return null;
	}

	@RequestMapping(value = "withdraw.do", method = RequestMethod.GET)
	public String withdrawTeam(HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		String memberId = member.getMemberId();
		int teamCode = (Integer) session.getAttribute("teamCode");

		service.leaveTeam(teamCode, memberId);

		return "redirect:/team/main.do";
	}

	@RequestMapping(value = "invite.do", method = RequestMethod.POST)
	public String inviteMember(String e_mail_1, HttpSession session) {
		int teamCode = (Integer) session.getAttribute("teamCode");
		try {

			StringBuilder strBuild = new StringBuilder();
			strBuild.append("Welcome to Teamphony\n").append("Teamphony 홈페이지 주소 및 설명이 들어갈 예정\n")
					.append("귀하에게 전송된 Team Code : ").append(teamCode).append("\n")
					.append("로그인 후 팀코드를 검색하여 초대된 팀을 방문하세요.\n");
			String msg = strBuild.toString();

			GoogleMail.Send("tnghsla13", "tlqkf9464", e_mail_1, "Teamphony에 초대 되셨습니다.", msg);

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return "redirect:/team/search.do";
	}

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String searchTeamsByMemberId(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");
		String memberId = member.getMemberId();

		List<Team> teamList = service.findTeamsByMemberId(memberId);

		model.addAttribute("teamList", teamList);

		return "team/main";

	}

	@RequestMapping(value = "xml.do", produces = "application/xml")
	public @ResponseBody Teams getTeamsToXml() {

		List<Team> list = new ArrayList<>();
		Teams teams = new Teams();

		list = service.findAllTeam();
		
		for (Team team : list) {
			List<Member> memberList = service.findMembersByTeamCode(team.getCode());
			team.setMemberList(memberList);
		}

		teams.setTeams(list);
	
		return teams;
	}
}
