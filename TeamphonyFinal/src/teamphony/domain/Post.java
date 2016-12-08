package teamphony.domain;

public class Post {

	private int postId;
	private String contents;
	private String imagePath;
	private String videoLink;
	private String filePath;
	private Member member;
	private int teamCode;
	
	
	public Post(){}
	
	public Post(String contents, Member member, int teamCode){
		this.contents = contents;
		this.teamCode = teamCode;
		this.member = member;
	}
	
	public Post(String contents,  Member member, int teamCode, int postId){
		this.contents = contents;
		this.teamCode = teamCode;
		this.member = member;
		this.postId = postId;
	}

	public int getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}
