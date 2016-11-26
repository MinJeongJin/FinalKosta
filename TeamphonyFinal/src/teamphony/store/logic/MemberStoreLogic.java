package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import teamphony.domain.Member;
import teamphony.store.facade.MemberStore;
import teamphony.store.mapper.MemberMapper;

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
			System.out.println("store "+ member.getMemberId());
			mapper.insertMember(member);
			session.commit();
		} catch (Exception e) {
		}finally{
			session.close();
		}
		
	}

	@Override
	public void updateMember(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(String memberId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member selectMemberByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
