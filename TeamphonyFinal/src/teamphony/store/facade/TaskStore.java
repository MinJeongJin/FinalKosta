package teamphony.store.facade;

import java.util.List;

import javax.servlet.http.HttpSession;

import teamphony.domain.Task;

public interface TaskStore {

	void insertTask(Task task, HttpSession httpSession);

	void updateTask(Task task);

	void deleteTask(int taskId, int flag);

	List<Task> selectAllTaskByFlag(int flag, int teamCode);

	Task selectTaskByTaskId(int taskId);

	List<Task> selectTaskByMemberId(String memberId);
	
	List<Task> selectAllAssginment();
	
}
