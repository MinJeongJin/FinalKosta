package teamphony.store.mapper;

import java.util.List;

import teamphony.domain.Task;
import teamphony.domain.TaskFile;

public interface TaskMapper {

	
	void insertTask(Task task);
	
	void insertTaskFile(TaskFile task);

	void updateTask(Task task);
//  추가했음
	void updateTaskPoint(Task point);
//	//  추가했음
//	void updateTaskFile(TaskFile task);
//
	void deleteTask(int taskId);
//	// 추가했음
	void deleteTaskFile(int taskId);
	//변경했음
	List<Task> selectAllTaskByFlag(int flag);
	//추가했음
	List<TaskFile> selectAllFileList();
	//추가 했음
	List<TaskFile> selectFileListByTaskId(int taskId);
	
	//추가 했음
	TaskFile selectFileList(int taskId);

	Task selectTaskByTaskId(int taskId);
//	//추가 했음
//	Task selectTaskDetail(int taskId);

//
//	List<Task> selectTaskByMemberId(String memberId);

	
	
}