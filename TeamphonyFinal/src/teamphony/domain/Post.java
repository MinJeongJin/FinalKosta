package teamphony.domain;

public class Post {

	private String contents;
	private String imagePath;
	private String videoLink;
	private String filePath;
	private Member member;
	private int teamCode;
	private int id;
	
	public Post(){}
	
	public Post(String contents, Member member, int teamCode){
		this.contents = contents;
		this.teamCode = teamCode;
		this.member = member;
	}
	
	public Post(String contents,  Member member, int teamCode, int id){
		this.contents = contents;
		this.teamCode = teamCode;
		this.member = member;
		this.id = id;
	}

	public int getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
