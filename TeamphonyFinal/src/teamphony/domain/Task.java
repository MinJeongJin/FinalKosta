package teamphony.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="task")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class Task {

	private int taskId;
	private String title;
	private String contents;
	private List<Member> memberList;
////부여 과제 명단을 위한 변수 선언
	private String[] memberIdList;
	private int point;
	private int flag;
	private List<TaskFile> taskFileList;
//평가 여부를 위한 변수 선언// ture == 1 , flase == 0 
	private boolean evaluated;
//평가 횟수를 위한 변수 선언
	private int evaluationCnt;
	private String deadline;
	private String evaluationPeriodStart;
	private String evaluationPeriodEnd;
	
	
	public int getTaskId() {
		return taskId;
	}
	
	public List<TaskFile> getTaskFileList() {
		return taskFileList;
	}

	public void setTaskFileList(List<TaskFile> taskFileList) {
		this.taskFileList = taskFileList;
	}

	public Task() {
		point= 0;
		evaluated= false;
		evaluationCnt=0;
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
	
	public float getAverage(){
		int startPoint = 0;
		
			if(evaluationCnt != 0){
				float average = (float) point/ evaluationCnt;
				return average;
			}
			return startPoint;
	}

//10점 만점의 percentage 계산 
	public double getPointStar() {
		int startPointStar = 0;
		
			if(evaluationCnt !=0 ){
				double percent = ( point *1.0 / evaluationCnt ) * 10 ;
				return percent;
			}
			return startPointStar;
	}

	public int getPoint() {
		return point;
	}
//평가시 획득한 점수를 기존의 점수와 더해서 점수 합산을 한다.
	public void setPoint(int point) {
		this.point = this.point + point;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
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
//평가를 할 때 마다 횟수를 1씩 증가 시킨다.
	public void setEvaluationCnt(int evaluationCnt) {
		this.evaluationCnt = this.evaluationCnt + evaluationCnt;
		
	}

	public String[] getMemberIdList() {
		return memberIdList;
	}

	public void setMemberIdList(String[] memberIdList) {
		this.memberIdList = memberIdList;
	}
	
	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getEvaluationPeriodStart() {
		return evaluationPeriodStart;
	}

	public void setEvaluationPeriodStart(String evaluationPeriodStart) {
		this.evaluationPeriodStart = evaluationPeriodStart;
	}

	public String getEvaluationPeriodEnd() {
		return evaluationPeriodEnd;
	}

	public void setEvaluationPeriodEnd(String evaluationPeriodEnd) {
		this.evaluationPeriodEnd = evaluationPeriodEnd;
	}

	@Override
	public String toString() {
		return "taskId=" + taskId + "\n" 
				+ "title= " + title + "\n" 
				+ "contents= " + contents + "\n" 
				+ "deadline= " + deadline + "\n" 
				+ "flag= " + flag + "\n" 
				+ "taskFileList= " + taskFileList+ "\n" 
				+ "evaluationPeriodStart= " + evaluationPeriodStart + "\n" 
				+ "evaluationPeriodEnd= " + evaluationPeriodEnd + "\n"
				+ "evaluated= " + evaluated + "\n"
				+ "point= " + point + "\n"
				+ "evaluationCnt= " + evaluationCnt + "\n" 
				+ "pointStar= " + getPointStar() + "%" + "\n";
//				+ "memberList= " + memberList.size() + "\n" ;
	
	}
	

}
