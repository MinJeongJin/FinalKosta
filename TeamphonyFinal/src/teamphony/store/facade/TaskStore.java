package teamphony.store.facade;

import java.util.List;

import teamphony.domain.Task;

public interface TaskStore {

	void insertTask(Task task);

	void updateTask(Task task);

	void deleteTask(int taskId);

	List<Task> selectAllTask();

	Task selectTaskByTaskId(int taskId);

	List<Task> selectTaskByMemberId(String memberId);
	
}
