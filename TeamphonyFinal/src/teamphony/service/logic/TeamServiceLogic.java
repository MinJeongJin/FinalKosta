package teamphony.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamphony.domain.Member;
import teamphony.domain.Team;
import teamphony.service.facade.TeamService;
import teamphony.store.facade.TeamStore;

@Service
public class TeamServiceLogic implements TeamService {

	@Autowired
	private TeamStore store;
	
	
	@Override
	public void registerTeam(Team team) {

		store.insertTeam(team);
		
	}

	@Override
	public void modifyTeam(Team team) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeTeam(int teamCode) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Team> findTeamsByMemberId(String memberId) {

		
		return store.selectTeamsByMemberId(memberId);
	}

	@Override
	public Team findTeamByTeamCode(int teamCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> findMembersByTeamCode(int teamCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void belongToTeam(int teamCode, String memberId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void leaveTeam(int teamCode, String memberId) {
		// TODO Auto-generated method stub
		
	}

}
