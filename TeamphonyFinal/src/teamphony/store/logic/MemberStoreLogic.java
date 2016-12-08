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
import teamphony.store.facade.MemberStore;
import teamphony.store.mapper.MemberMapper;
import teamphony.store.mapper.TaskMapper;

@Repository
public class MemberStoreLogic implements MemberStore {
	
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
	public void insertMember(Member member) {

		SqlSession session = getSessionFactory().openSession();

		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.insertMember(member);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void updateMember(Member member) {
		SqlSession session = getSessionFactory().openSession();

		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.updateMember(member);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
	}

	@Override
	public void deleteMember(String memberId) {
		SqlSession session = getSessionFactory().openSession();
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.deleteMember(memberId);
			session.commit();
		} catch (Exception e) {
		}finally{
			session.close();
		}
	}

	@Override
	public Member selectMemberByMemberId(String memberId) {
		Member member = new Member();
		SqlSession session = getSessionFactory().openSession();
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member = mapper.selectMemberByMemberId(memberId);
			List<Integer> list = mapper.getStarPoint(memberId);
			int sum=0;
			for (Integer starPoint : list) {
				sum+=starPoint;
			}
			member.setStarPoint((double)sum/list.size());
		} catch (Exception e) {
		}finally{
			session.close();
		}
		return member;
	}

	@Override
	public void insertStarPoint(String memberId, int starPoint) {
		SqlSession session = getSessionFactory().openSession();
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.insertStarPoint(memberId, starPoint);
			System.out.println(memberId+" "+starPoint);
			session.commit();
		} catch (Exception e) {
		}finally{
			session.close();
		}
	}

}
