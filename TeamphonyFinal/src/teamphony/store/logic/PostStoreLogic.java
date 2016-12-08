package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
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
		SqlSession session = getSessionFactory().openSession();

		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			mapper.updatePost(post);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void deletePost(int postId) {
		SqlSession session = getSessionFactory().openSession();

		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			mapper.deletePost(postId);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Post> selectAllPost(int teamCode) {
		SqlSession session = getSessionFactory().openSession();
		List<Post> list = null;
		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			list=mapper.selectAllPost(teamCode);

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
		SqlSession session = getSessionFactory().openSession();
		List<Post> list = new ArrayList<>();
		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			list=mapper.selectPostByMemberId(memberId);

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Post> selectPostByContents(String contents) {
		SqlSession session = getSessionFactory().openSession();
		List<Post> list = new ArrayList<>();
		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			list=mapper.selectPostByContents(contents);

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public Post selectPostByPostId(int postId){
		
		SqlSession session = getSessionFactory().openSession();
		Post post = null;
		try {
			PostMapper mapper = session.getMapper(PostMapper.class);
			post=mapper.selectPostByPostId(postId);

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return post;
	}

}
