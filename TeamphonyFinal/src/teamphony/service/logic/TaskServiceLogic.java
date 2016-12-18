package teamphony.service.logic;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public void registerTask(Task task, HttpSession httpSession, String assignmentTitle, int assignmentId) {
		
		
		if(task.getFlag() == 1){
			
			System.out.println("taskService : "+task.getTaskFileList().get(0));
		}
		store.insertTask(task, httpSession, assignmentTitle, assignmentId);
	}
	

	@Override
	public void modifyTask(Task task, String assignmentTitle) {
		store.updateTask(task, assignmentTitle);

	}
	

	@Override
	public void removeTask(int taskId, int flag) {
		store.deleteTask(taskId,flag);
	}
	

	@Override
	public List<Task> findAllTaskByFlag(int flag, int teamCode) {
		return store.selectAllTaskByFlag(flag, teamCode);
	}
	
	

	@Override
	public List<Task> findTaskByMemberId(String memberId, int teamCode) {
		return store.selectTaskByMemberId(memberId, teamCode);
	}
	
	

	@Override
	public Task findTaskByTaskId(int taskId) {
		return store.selectTaskByTaskId(taskId);
	}
	
	public List<Task> findAllAssginment(){
		return store.selectAllAssginment();
	}
	

}
