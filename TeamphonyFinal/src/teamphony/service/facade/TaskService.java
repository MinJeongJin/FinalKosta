package teamphony.service.facade;

import java.util.List;

import javax.servlet.http.HttpSession;

import teamphony.domain.Task;

public interface TaskService {
	
	
	 void registerTask(Task task, HttpSession httpSession, String assignmentTitle, int assignmentId);

	 void modifyTask(Task task, String assignmentTitle);

	 void removeTask(int taskId, int flag);

	 List<Task> findAllTaskByFlag(int flag, int teamCode);

	 List<Task> findTaskByMemberId(String memberId);

	 Task findTaskByTaskId(int taskId);
	 
	 List<Task> findAllAssginment();

}
