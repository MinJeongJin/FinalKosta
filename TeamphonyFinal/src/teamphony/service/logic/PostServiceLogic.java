package teamphony.service.logic;

import java.util.List;

import org.springframework.stereotype.Service;

import teamphony.domain.Post;
import teamphony.service.facade.PostService;

@Service
public class PostServiceLogic implements PostService {

	@Override
	public void registerPost(Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Post> findAllPost(int teamId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post findPostByPostId(int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> findPostByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> findPostByContents(String contents) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyPost(Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removePost(Post post) {
		// TODO Auto-generated method stub
		
	}

}
