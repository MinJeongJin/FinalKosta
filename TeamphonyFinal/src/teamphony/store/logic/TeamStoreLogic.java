package teamphony.store.logic;

import java.util.List;

import teamphony.domain.Member;
import teamphony.domain.Team;
import teamphony.store.facade.TeamStore;

public class TeamStoreLogic implements TeamStore {

	@Override
	public void insertTeam(Team team) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTeam(Team team) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTeam(int teamCode) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Team selectTeamByTeamCode(int teamCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> selectMembersByTeamCode(int teamCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Team> selectTeamsByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void selectBelong(int teamCode, String memberId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBelong(int teamCode, String memberId) {
		// TODO Auto-generated method stub
		
	}

}
