package teamphony.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamphony.domain.Post;
import teamphony.service.facade.PostService;
import teamphony.store.facade.PostStore;

@Service
public class PostServiceLogic implements PostService {
	
	@Autowired
	PostStore store;

	@Override
	public void registerPost(Post post) {
		store.insertPost(post);
	}

	@Override
	public List<Post> findAllPost(int teamId) {
		return store.selectAllPost(teamId);
	}

	@Override
	public Post findPostByPostId(int postId) {
		return store.selectPostByPostId(postId);
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
