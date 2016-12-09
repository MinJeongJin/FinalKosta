package teamphony.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import teamphony.domain.Task;
import teamphony.domain.TaskFile;

public interface TaskMapper {

//수정했음
	void insertAssignment(Task task);
//추가했음
	void insertSubmission(Task task);
	
	void insertTaskFile(TaskFile task);
	
	void insertTaskMember(@Param("taskId") int taskId, @Param("memberId") String memberId );

	void updateTask(Task task);
//	추가했음
	void updateTaskPoint(int point);
//	추가했음
	void updateTaskFile(TaskFile taskFile);

	void deleteTask(int taskId);
//	 추가했음
	void deleteTaskFile(int taskId);
//	추가 했음
	void deleteMemberIdByTaskId(int taskId);
//	변경했음
	List<Task> selectAllTaskByFlag(int flag);
//	추가했음
	List<TaskFile> selectAllFileList();
//	추가 했음
	List<TaskFile> selectFileListByTaskId(int taskId);
	
//	추가 했음
	TaskFile selectFileList(int taskId);
//	추가 했음
	String[] selectMemberIdByTaskId(int taskId);
	
	Task selectTaskByTaskId(int taskId);
//추가 했음
	List<Integer> selectTaskIdByMemberId(String memberId);
	
	
}