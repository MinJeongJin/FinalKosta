package teamphony.domain;

import java.util.Date;
import java.util.List;

public class Task {

	private int taskId;
	private String title;
	private String contents;
	private List<Member> memberList;
	private String filePath;
	private int point;
	private Date evaluationPeriod;
	private Date deadline;
	private int flag;
	
	public Task() {
		// TODO Auto-generated constructor stub
	}
	
	public Task(int taskId, String title, String contents, Date deadline) {
		super();
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
		this.deadline = deadline;
	}
	
	public Task(int taskId, String title, String contents, List<Member> memberList, String filePath, int point,
			Date evaluationPeriod, Date deadline) {
		super();
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
		this.memberList = memberList;
		this.filePath = filePath;
		this.point = point;
		this.evaluationPeriod = evaluationPeriod;
		this.deadline = deadline;
	}
	
	
	
	public Task(int taskId, String title, String contents, List<Member> memberList, String filePath, int point,
			Date evaluationPeriod, Date deadline, int flag) {
		super();
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
		this.memberList = memberList;
		this.filePath = filePath;
		this.point = point;
		this.evaluationPeriod = evaluationPeriod;
		this.deadline = deadline;
		this.flag = flag;
	}


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
