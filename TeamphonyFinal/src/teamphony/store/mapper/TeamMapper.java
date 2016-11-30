package teamphony.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import teamphony.domain.Member;
import teamphony.domain.Team;

public interface TeamMapper {

	void insertTeam(Team team);
	void updateTeam(Team team);
	void deleteTeam(int teamCode);
	Team selectTeamByTeamCode(int teamCode);
	List<Member> selectMembersByTeamCode(int teamCode);
	List<Team> selectTeamsByMemberId(String memberId);
	void insertBelong(@Param("teamCode") int teamCode, @Param("memberId") String memberId);
	void deleteBelong( int teamCode,  String memberId);
}
