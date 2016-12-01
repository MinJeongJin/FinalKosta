package teamphony.store.mapper;

import java.util.List;

import teamphony.domain.Task;
import teamphony.domain.TaskFile;

public interface TaskMapper {

	
	void insertTask(Task task);
	
	void insertTaskFile(TaskFile task);

	void updateTask(Task task);
	//  추가했음
	void updateTaskFile(TaskFile task);

	void deleteTask(int taskId);
	// 추가했음
	void deleteTaskFile(int taskId);
	
	List<Task> selectAllTask();

	Task selectTaskByTaskId(int taskId);
	//추가 했음
	Task selectTaskDetail(int taskId);
	//추가 했음
	TaskFile selectFileList(int taskId);

	List<Task> selectTaskByMemberId(String memberId);

	
	
}