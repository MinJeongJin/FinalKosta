package teamphony.domain;

public class Member {

	private String memberId;
	private String password;
	private String alias;
	private String imagePath;
	private double starPoint;
	private double star;

	public Member() {}

	public Member(String memberId, String password) {
		this.memberId = memberId;
		this.password = password;
	}

	public Member(String memberId, String alias, String password) {
		this.memberId = memberId;
		this.password = password;
		this.alias = alias;
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

	public double getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(double starPoint) {
		this.starPoint = starPoint;
	}
	
	public double getStar(){
		return Math.round(starPoint/2.0);
	}

}
