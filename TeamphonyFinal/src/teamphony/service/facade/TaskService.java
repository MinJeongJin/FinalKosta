package teamphony.service.facade;

import java.util.List;

import teamphony.domain.Task;

public interface TaskService {

	 void registerTask(Task task);

	 void modifyTask(Task task);

	 void removeTask(int taskId);

	 List<Task> findAllTask();

	 List<Task> findTaskByMemberId(String memberId);

	 Task findTaskByTaskId(int taskId);

}
