package teamphony.domain;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.springframework.stereotype.Component;

@Component
@XmlRootElement(name="taskFiles")
@XmlAccessorType(XmlAccessType.FIELD)
public class TaskFiles {
	
	@XmlElement(name="taskFile")
	private List<TaskFile> taskFiles;

	public List<TaskFile> getTaskFiles() {
		return taskFiles;
	}

	public void setTaskFiles(List<TaskFile> taskFiles) {
		this.taskFiles = taskFiles;
	}

}
