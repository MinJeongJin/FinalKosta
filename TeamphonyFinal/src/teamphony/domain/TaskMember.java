package teamphony.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="taskMember")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class TaskMember {
	
	private int assignmentId;
	private int submissionId;
// 0 == Not	, 1 == committed	
	private int committed;
	private String memberId; 
	private String assignmentTitle; 
	
	public TaskMember() {
		committed = 0;
		
	}

	
	public int getAssignmentId() {
		return assignmentId;
	}

	public void setAssignmentId(int assignmentId) {
		this.assignmentId = assignmentId;
	}


	public int getSubmissionId() {
		return submissionId;
	}


	public void setSubmissionId(int submissionId) {
		this.submissionId = submissionId;
	}

	public int getCommitted() {
		return committed;
	}

	public void setCommitted(int committed) {
		this.committed = committed;
	}

	
	public String getAssignmentTitle() {
		return assignmentTitle;
	}

	public void setAssignmentTitle(String assignmentTitle) {
		this.assignmentTitle = assignmentTitle;
	}

	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getMemberId() {
		return memberId;
	}


	@Override
	public String toString() {
		return "assignmentid = " + assignmentId + "\n"
				+"submissionid = " + submissionId + "\n"
				+"committed = " + committed + "\n"
				+"memberId = " + memberId + "\n"
				+"assignmentTitle = " + assignmentTitle + "\n";
				
	
	}
	


}
