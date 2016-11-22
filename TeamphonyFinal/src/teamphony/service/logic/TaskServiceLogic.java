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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyTask(Task task) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeTask(String taskId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Task> findAllTask() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Task> findTaskByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Task findTaskByTaskId(String taskId) {
		// TODO Auto-generated method stub
		return null;
	}



}
