package teamphony.store.facade;

import java.util.List;
import java.util.Set;

import teamphony.domain.Member;
import teamphony.domain.Team;

public interface TeamStore {
	
	void insertTeam(Team team);
	void updateTeam(Team team);
	void deleteTeam(int teamCode);
	Team selectTeamByTeamCode(int teamCode);
	List<Member> selectMembersByTeamCode(int teamCode);
	List<Team> selectTeamsByMemberId(String memberId);
	void insertBelong(int teamCode, String memberId);
	void deleteBelong(int teamCode, String memberId);
	Set<Integer> selectAllTeamCodes();
	List<Team> selectAllTeam();
}
