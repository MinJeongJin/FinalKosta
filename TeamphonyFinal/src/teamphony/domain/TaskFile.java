package teamphony.domain;

public class TaskFile {
	private int submissionId;
	private String filePath;
	
	
	public TaskFile() {
		// TODO Auto-generated constructor stub
	}
	
	public TaskFile(String filePath) {
		super();
		this.filePath = filePath;
	}
	
	public int getSubmissionId() {
		return submissionId;
	}

	public void setSubmissionId(int submissionId) {
		this.submissionId = submissionId;
	}


	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	@Override
	public String toString() {
		return "\n"+"submissionId= "+ submissionId +"\n"+ "filePath"+ filePath+"\n";
	}
	
	
	
	

}
