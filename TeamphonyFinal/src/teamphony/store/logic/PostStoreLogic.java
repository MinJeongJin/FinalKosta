package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import teamphony.domain.Post;
import teamphony.store.facade.PostStore;
import teamphony.store.mapper.MemberMapper;
import teamphony.store.mapper.PostMapper;

@Repository
public class PostStoreLogic implements PostStore {
	
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
	public void insertPost(Post post) {
		SqlSession session = getSessionFactory().openSession();

		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			mapper.insertPost(post);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void updatePost(Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Post> selectAllPost(int teamId) {
		SqlSession session = getSessionFactory().openSession();
		List<Post> list = null;
		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			list=mapper.selectAllPost(teamId);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Post> selectPostByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> selectPostByContents(String content) {
		// TODO Auto-generated method stub
		return null;
	}

}
