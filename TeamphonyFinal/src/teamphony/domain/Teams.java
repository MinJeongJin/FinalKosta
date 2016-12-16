package teamphony.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@Component
@XmlRootElement(name = "teams")
@XmlAccessorType(XmlAccessType.FIELD)
public class Teams {

	@XmlElement(name = "team")
	private List<formattedTeam> teams;

	public List<formattedTeam> getTeams() {

		return teams;
	}

	public void setTeams(List<Team> teams) {

		List<Team> temp = teams;
		this.teams = new ArrayList<>();

		for (Team team : temp) {

			String name, leaderId;
			int cycle, code;
			Date endDate;
			List<Member> memberList;

			name = team.getName();
			leaderId = team.getLeaderId();
			cycle = team.getCycle();
			code = team.getCode();
			endDate = team.getEndDate();
			memberList = team.getMemberList();

			this.teams.add(new formattedTeam(name, cycle, endDate, code, memberList, leaderId));

		}

	}

	static class formattedTeam {

		private String name;
		private int cycle;
		private String endDate;
		private int code;
		private List<Member> memberList;
		private String leaderId;

		public formattedTeam( String name, int cycle, Date endDate, int code, List<Member> memberList,
				String leaderId) {

			this.code = code;
			this.name = name;
			this.cycle = cycle;
			this.endDate = endDate.toString();
			this.memberList = memberList;
			this.leaderId = leaderId;

		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getCycle() {
			return cycle;
		}

		public void setCycle(int cycle) {
			this.cycle = cycle;
		}

		public String getEndDate() {
			return endDate;
		}

		public void setEndDate(String endDate) {
			this.endDate = endDate;
		}

		public int getCode() {
			return code;
		}

		public void setCode(int code) {
			this.code = code;
		}

		public List<Member> getMemberList() {
			return memberList;
		}

		public void setMemberList(List<Member> memberList) {
			this.memberList = memberList;
		}

		public String getLeaderId() {
			return leaderId;
		}

		public void setLeaderId(String leaderId) {
			this.leaderId = leaderId;
		}

	}

}
