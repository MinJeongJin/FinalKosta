package teamphony.domain;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@XmlRootElement(name="taskMember")
@XmlAccessorType(XmlAccessType.FIELD)
@Component
public class TaskMember {
	
	private int assignmentid;
	private int submissionid;
// 0 == Not	, 1 == committed	
	private int committed;
	private String memberid; 
	private String assignmentTitle; 
	
	public TaskMember() {
		committed = 0;
		
	}

	public int getAssignmentid() {
		return assignmentid;
	}

	public void setAssignmentid(int assignmentid) {
		this.assignmentid = assignmentid;
	}

	public int getSubmissionid() {
		return submissionid;
	}

	public void setSubmissionid(int submissionid) {
		this.submissionid = submissionid;
	}

	public int getCommitted() {
		return committed;
	}

	public void setCommitted(int committed) {
		this.committed = committed;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getAssignmentTitle() {
		return assignmentTitle;
	}

	public void setAssignmentTitle(String assignmentTitle) {
		this.assignmentTitle = assignmentTitle;
	}

	
	
	
	
	

}
