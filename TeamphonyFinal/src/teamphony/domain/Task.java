package teamphony.domain;

import java.util.Date;
import java.util.List;

public class Task {

	private int taskId;
	private String title;
	private String contents;
	private List<Member> memberList;
	private int point;
	private Date evaluationPeriodStart;
	private Date evaluationPeriodEnd;
	private Date deadline;
	private int flag;
	private List<TaskFile> taskFileList;
//추가했음
	private TaskFile taskFile;
	private Task task;
//평가 여부를 위한 변수 선언// ture == 1 , flase == 0 
	private boolean evaluated;
//평가 횟수를 위한 변수 선언
	private int evaluationCnt;
	
	
	public List<TaskFile> getTaskFileList() {
		return taskFileList;
	}

	public void setTaskFileList(List<TaskFile> taskFileList) {
		this.taskFileList = taskFileList;
	}

	public Task() {
		evaluated= false;
		evaluationCnt=0;
	}
	
//평가를 위한 task 생성자 
	public Task(int taskId, boolean evaluated, int evaluationCnt, int point ){
		this.evaluated= evaluated;
		this.evaluationCnt= evaluationCnt;
		this.point= point;
		this.taskId= taskId;
	}
//부여 과제를 위한 task 생성자
	public Task(int taskId, String title, String contents, Date deadline, Date evaluationPeriodStart, Date evaluationPeriodEnd) {
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
		this.deadline = deadline;
		this.evaluationPeriodStart = evaluationPeriodStart;
		this.evaluationPeriodEnd = evaluationPeriodEnd;
	}
	
//제출 과제를 위한 task 생성자
	public Task(int taskId, String title, String contents, String filePath) {
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
	}

	public Task(int taskId, String title, String contents, List<Member> memberList, String filePath, int point,
			Date evaluationPeriodStart,Date evaluationPeriodEnd, Date deadline) {
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
		this.memberList = memberList;
		this.point = point;
		this.evaluationPeriodStart = evaluationPeriodStart;
		this.evaluationPeriodEnd = evaluationPeriodEnd;
		this.deadline = deadline;
	}

	public Task(int taskId, String title, String contents, List<Member> memberList, String filePath, int point,
			Date evaluationPeriodStart,Date evaluationPeriodEnd, Date deadline, int flag) {
		this.taskId = taskId;
		this.title = title;
		this.contents = contents;
		this.memberList = memberList;
		this.point = point;
		this.evaluationPeriodStart = evaluationPeriodStart;
		this.evaluationPeriodEnd = evaluationPeriodEnd;
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

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public TaskFile getTaskFile() {
		return taskFile;
	}

	public void setTaskFile(TaskFile taskFile) {
		this.taskFile = taskFile;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}
	
	

	public Date getEvaluationPeriodStart() {
		return evaluationPeriodStart;
	}

	public void setEvaluationPeriodStart(Date evaluationPeriodStart) {
		this.evaluationPeriodStart = evaluationPeriodStart;
	}

	public Date getEvaluationPeriodEnd() {
		return evaluationPeriodEnd;
	}

	public void setEvaluationPeriodEnd(Date evaluationPeriodEnd) {
		this.evaluationPeriodEnd = evaluationPeriodEnd;
	}
//평가 여부를 위한 메소드
	public boolean isEvaluated() {
		return evaluated;
	}
//평가 여부를 위한 메소드
	public void setEvaluated(boolean evaluated) {
		this.evaluated = evaluated;
	}
//평가 횟수를 위한 메소드
	public int getEvaluationCnt() {
		return evaluationCnt;
	}
//평가 횟수를 위한 메소드
	public void setEvaluationCnt(int evaluationCnt) {
		this.evaluationCnt = evaluationCnt;
	}

	@Override
	public String toString() {
		return "taskId=" + taskId + "\n" + "title= " + title + "\n" + "contents= " + contents + "\n" + "deadline= "
				+ deadline + "\n" + "flag= " + flag + "\n" + "taskFileList= " + taskFileList+ "\n" 
				+ "evaluationPeriodStart= " + evaluationPeriodStart + "\n" + "evaluationPeriodEnd= " 
				+ evaluationPeriodEnd + "\n"+ "evaluated= " + evaluated + "\n"+"evaluationCnt= " + evaluationCnt + "\n" 
				+ "point= " + point;
	
	
	}
	

}
