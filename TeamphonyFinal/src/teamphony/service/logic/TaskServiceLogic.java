package teamphony.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamphony.domain.Task;
import teamphony.service.facade.TaskService;
import teamphony.store.facade.TaskStore;

@Service
public class TaskServiceLogic implements TaskService {

	@Autowired
	private TaskStore store;
	
	

	@Override
	public void registerTask(Task task) {
		
		store.insertTask(task);
	}
	

	@Override
	public void modifyTask(Task task) {
		System.out.println("================service================");
		store.updateTask(task);

	}
	

	@Override
	public void removeTask(int taskId) {
		store.deleteTask(taskId);
	}
	

	@Override
	public List<Task> findAllTaskByFlag(int flag) {
		return store.selectAllTaskByFlag(flag);
	}
	
	

	@Override
	public List<Task> findTaskByMemberId(String memberId) {
		return store.selectTaskByMemberId(memberId);
	}
	
	

	@Override
	public Task findTaskByTaskId(int taskId) {
		return store.selectTaskByTaskId(taskId);
	}
	
	
	

}
