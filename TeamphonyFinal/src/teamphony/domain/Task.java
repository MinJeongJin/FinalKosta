package teamphony.domain;

import java.util.Date;
import java.util.List;

public class Task {

	private int taskId;
	private String title;
	private String contents;
	private List<Member> memberList;
	private int point;
	private Date evaluationPeriod;
	private Date deadline;
	private int flag;

	private List<TaskFile> taskFileList;

	public List<TaskFile> getTaskFileList() {
		return taskFileList;
	}

	public void setTaskFileList(List<TaskFile> taskFileList) {
		this.taskFileList = taskFileList;
	}

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

	public Task(int taskId, String title, String contents, String filePath) {
		super();
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
	}

	public Task(int taskId, String title, String contents, List<Member> memberList, String filePath, int point,
			Date evaluationPeriod, Date deadline) {
		super();
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
		this.memberList = memberList;
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

	public int getPointStar() {
		int percent = point * 100 / 5;
		return percent;
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

	@Override
	public String toString() {
		return "taskId=" + taskId + "\n" + "title= " + title + "\n" + "contents= " + contents + "\n" + "deadline= "
				+ deadline + "\n" + "flag= " + flag;
	}



}
