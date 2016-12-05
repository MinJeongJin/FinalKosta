package teamphony.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamphony.domain.Member;
import teamphony.domain.Team;
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

	@RequestMapping("create.do")
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

		return "redirect:/team/main.do?flag=" + NORMAL;
	}

	private int getTeamCode() {

		Set<Integer> codeSet = new HashSet<Integer>();
		codeSet = service.findAllTeamCodes();
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

	@RequestMapping("erase.do")
	public String eraseTeam(HttpSession session) {

		int teamCode = (Integer) session.getAttribute("teamCode");
		List<Member> memberList = service.findMembersByTeamCode(teamCode);

		for (Member member : memberList) { // 모든 팀원들을 내보냄
			service.leaveTeam(teamCode, member.getMemberId());
		}

		service.removeTeam(teamCode);

		return "redirect:/team/main.do";
	}

	@RequestMapping("join.do")
	public String joinTeam(int teamCode, HttpSession session) {

		Team team = service.findTeamByTeamCode(teamCode);

		if (team == null) {

			return "redirect:/team/main.do?flag=" + WARNNING_NONE;

		} else {

			Member member = (Member) session.getAttribute("member");
			String memberId = member.getMemberId();
			List<Member> memberList = service.findMembersByTeamCode(teamCode);

			for (Member mem : memberList) {

				if (memberId.equals(mem.getMemberId())) {

					return "redirect:/team/main.do?flag=" + WARNNING_REDUNDANCY;
				}

			}

			service.belongToTeam(teamCode, memberId);

			return "redirect:/team/main.do?flag=" + NORMAL;
		}
	}

	@RequestMapping(value = "search.do", method = RequestMethod.POST)
	public String searchTeamByCode(int teamCode, HttpSession session, Model model) {

		System.out.println(teamCode);

		Team team = service.findTeamByTeamCode(teamCode);
		List<Member> memberList = service.findMembersByTeamCode(teamCode);
		Member member = (Member) session.getAttribute("member");
		String id = null, leaderId = null;

		team.setMemberList(memberList);
		model.addAttribute("team", team);
		model.addAttribute("memberList", memberList);

		id = member.getMemberId();
		leaderId = team.getLeaderId();

		if (session.getAttribute("teamCode") != null)
			session.removeAttribute("teamCode");

		session.setAttribute("teamCode", teamCode);

		if (id.equals(leaderId))
			return "team/teamManageForLeader";

		return "team/teamManage";
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
			return "team/teamManageForLeader";

		return "team/teamManage";
	}

	public String searchMembersByCode(HttpSession session) {

		return null;
	}

	@RequestMapping("withdraw.do")
	public String withdrawTeam(HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		String memberId = member.getMemberId();
		int teamCode = (Integer) session.getAttribute("teamCode");

		service.leaveTeam(teamCode, memberId);

		return "redirect:/team/main.do";
	}

	@RequestMapping("invite.do")
	public String inviteMember(String e_mail_1, HttpSession session) {
		int teamCode = (Integer) session.getAttribute("teamCode");
		try {
			GoogleMail.Send("tnghsla13", "tlqkf9464", e_mail_1, "Welcome to teamphony", teamCode + "");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return "redirect:/team/search.do?teamCode=" + teamCode;
	}

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String searchTeamsByMemberId(int flag, HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");
		String memberId = member.getMemberId();

		List<Team> teamList = service.findTeamsByMemberId(memberId);

		model.addAttribute("teamList", teamList);
		model.addAttribute("flag", flag);

		return "team/main";

	}
}
