package teamphony.service.facade;

import java.util.List;
import java.util.Set;

import teamphony.domain.Member;
import teamphony.domain.Team;

public interface TeamService {

	void registerTeam(Team team);
	void modifyTeam(Team team);
	void removeTeam(int teamCode);
	List<Team> findTeamsByMemberId(String memberId);
	Team findTeamByTeamCode(int teamCode);
	List<Member> findMembersByTeamCode(int teamCode);
	void belongToTeam(int teamCode, String memberId);
	void leaveTeam(int teamCode, String memberId);
	Set<Integer> findAllTeamCodes();
}
