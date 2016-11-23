package teamphony.domain;

import java.sql.Date;
import java.util.List;

public class Task {

	private int taskId;
	private String title;
	private String contents;
	private List<Member> memberList;
	private Date deadline;
	private String filePath;
	private int point;
	private Date evaluationPeriod;
	private int flag;


	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public List<Member> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getEvaluationPeriod() {
		return evaluationPeriod;
	}

	public void setEvaluationPeriod(Date evaluationPeriod) {
		this.evaluationPeriod = evaluationPeriod;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	
	
	
	

}
