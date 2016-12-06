package teamphony.service.facade;

import java.util.List;

import teamphony.domain.Post;

public interface PostService {

	void registerPost(Post post);
	List<Post> findAllPost(int teamId);
	Post findPostByPostId(int postId);
	List<Post> findPostByMemberId(String memberId);
	List<Post> findPostByContents(String contents);
	void modifyPost(Post post);
	void removePost(int postId);
}
