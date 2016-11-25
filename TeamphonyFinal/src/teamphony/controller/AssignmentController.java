package teamphony.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
	private TaskService service;

	@RequestMapping("/create.do")
	public String createAssignment(String title, String contents, String deadlineDay, String deadlineHour) {
		
		String submitDay = deadlineDay + " " +deadlineHour;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM");
		
		Date deadline =null;   
		
		try{
			deadline = sdf.parse(submitDay);
		}catch (ParseException e) {
		e.printStackTrace();
		}

		Task task =new Task();
		task.setTitle(title);
		task.setContents(contents);
		task.setDeadline(deadline);
		
		service.registerTask(task);
		
		
		System.out.println("controller");
		return "redirect:searchAll.do" ;
	}

	@RequestMapping("/revise.do")
	public String reviseAssignment(Task task) {

		return null;
	}

	@RequestMapping("/erase.do")
	public String eraseAssignment(Task task) {

		return null;
	}

	@RequestMapping("/evaluate.do")
	public String evaluateAssignment(Task task, int starPoint) {

		return null;
	}

	/*
	 * [contextPath]/assignment/searchAssignmentByAssignmentId.do contextPath =
	 * /TeamphonyFinal - > 서버 - > 모듈텝 - > 그리드(Path)
	 */
	@RequestMapping("/searchByAssignmentId.do")
	public String searchAssignmentByAssignmentId(int taskId, Model model) {

		taskId = 1;
		Task task = service.findTaskByTaskId(taskId);
		model.addAttribute(task);

		return "/assignmentDetail";
	}

	@RequestMapping("/searchAll.do")
	public String searchAllAssignment(Model model) {

		List<Task> list = service.findAllTask();
		model.addAttribute("list",list);
		

		return "/task/assignment/assignmentList";
	}

}
