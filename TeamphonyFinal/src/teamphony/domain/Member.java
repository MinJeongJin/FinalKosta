package teamphony.domain;

public class Member {

	private String memberId;
	private String password;
	private String alias;
	private String imagePath;
	private int starPoint;

	public Member() {
	}

	public Member(String memberId, String password) {
		this.memberId = memberId;
		this.password = password;
	}

	public Member(String memberId, String password, String alias, String imagePath) {
		this.memberId = memberId;
		this.password = password;
		this.alias = alias;
		this.imagePath = imagePath;
		this.starPoint = 0;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}

}
