package teamphony.store.facade;

import java.util.List;

import teamphony.domain.Post;

public interface PostStore {

	void insertPost(Post post);
	void updatePost(Post post);
	void deletePost(int postId);
	List<Post> selectAllPost(int teamId);
	List<Post> selectPostByMemberId(String memberId);
	List<Post> selectPostByContents(String content);
	Post selectPostByPostId(int postId);
}
