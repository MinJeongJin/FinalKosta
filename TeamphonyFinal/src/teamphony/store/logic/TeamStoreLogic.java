package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import teamphony.domain.Member;
import teamphony.domain.Team;
import teamphony.store.facade.TeamStore;
import teamphony.store.mapper.TeamMapper;

@Repository
public class TeamStoreLogic implements TeamStore {

	private static final String Resource = "config.xml";

	private SqlSessionFactory getSessionFactory() {

		Reader reader = null;

		try {
			reader = Resources.getResourceAsReader(Resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(reader);
	}

	@Override
	public void insertTeam(Team team) {
		SqlSession session = getSessionFactory().openSession();
		try {
			TeamMapper mapper = session.getMapper(TeamMapper.class);
			mapper.insertTeam(team);
			session.commit();
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			session.close();
		}

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
