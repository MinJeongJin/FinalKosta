package teamphony.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamphony.domain.Task;
import teamphony.service.facade.TaskService;

@Controller
@RequestMapping("assignment")
public class AssignmentController {

	@Autowired
	private TaskService service;

	@RequestMapping("/create.do")
	public String createAssignment(String title, String contents, String deadlineDay, String deadlineHour) {

		String submitDay = deadlineDay + " " + deadlineHour;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM");

		Date deadline = null;

		try {
			deadline = sdf.parse(submitDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Task task = new Task();
		task.setTitle(title);
		task.setContents(contents);
		task.setDeadline(deadline);

		service.registerTask(task);

		return "redirect:searchAll.do";
	}

	@RequestMapping("/revise.do")
	public String reviseAssignment(String taskId, Model model) {
		int taskIdNo;
		System.out.println("======start=========");
		System.out.println(taskId);
		
		taskIdNo = Integer.parseInt(taskId);
		
		
		
		System.out.println("taskId = " +taskId);
		
		Task task =service.findTaskByTaskId(taskIdNo);
		
		System.out.println(task.getTitle());
		System.out.println(task.getContents());
		System.out.println(task.getDeadline());
		
		model.addAttribute("task", task);
		return "task/assignment/assignmentModify";
	}
	
	
	
	@RequestMapping(value="/revise.do", method=RequestMethod.POST)
	public String reviseAssignment(String title, String contents, String deadlineDay, String deadlineHour) {
		

		return "";
	}

	
	
	
	
	@RequestMapping("/erase.do")
	public String eraseAssignment(int  taskId) {
		System.out.println("====================");
		
		service.removeTask(taskId);
		
		System.out.println("삭제 완료!!");
		System.out.println("은채쩔어!!");
		return "redirect:searchAll.do";
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
		taskId = 15;
		Task task = new Task();
		task.setTaskId(taskId);

		task = service.findTaskByTaskId(taskId);
		System.out.println("deadline : " + task.getDeadline());
		model.addAttribute("task", task);

		return "/task/assignment/assignmentDetail";
	}

	@RequestMapping("/searchAll.do")
	public String searchAllAssignment(Model model) {

		List<Task> list = service.findAllTask();
		model.addAttribute("list", list);

		return "/task/assignment/assignmentList";
	}

}
