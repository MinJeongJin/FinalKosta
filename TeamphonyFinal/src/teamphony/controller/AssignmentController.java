package teamphony.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamphony.domain.Task;
import teamphony.service.facade.TaskService;

@Controller
@RequestMapping("assignment")
public class AssignmentController {
	
	@Autowired
	private TaskService service ;
	

	public String createAssignment(Task task){
		
	return null;
	}

	public String  reviseAssignment(Task task){
		
	return null;
	}

	public String  eraseAssignment(Task task){
		
	return null;
	}

	public String  evaluateAssignment(Task task, int starPoint){
		
	return null;
	}

	public String  searchAssignmentByAssignmentId(String taskId , Model model){
		
	return null;
	}

	public String  searchAllAssignment(Model model){
		
	return null;
	}
	
}
