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
	public String createAssignment(String title, String contents, String deadlineDay, String deadlineHour
									,String evalDayStart, String evalHourStart, String evalDayEnd, String evalHourEnd, String flag) {

		String submitDay = deadlineDay + " " + deadlineHour;
		String evaluationStart = evalDayStart + " " + evalHourStart;
		String evaluationEnd = evalDayEnd + " " + evalHourEnd;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM");

		Date deadline = null;
		Date evaluationPeriodStart = null;
		Date evaluationPeriodEnd = null;
		
		
		try {

			deadline = sdf.parse(submitDay);
			evaluationPeriodStart = sdf.parse(evaluationStart);
			evaluationPeriodEnd = sdf.parse(evaluationEnd);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Task task = new Task();

		task.setTitle(title);
		task.setContents(contents);
		task.setDeadline(deadline);
		task.setFlag(Integer.parseInt(flag));
		task.setEvaluationPeriodStart(evaluationPeriodStart);
		task.setEvaluationPeriodEnd(evaluationPeriodEnd);
		
		System.out.println(task.toString());

		service.registerTask(task);

		return "redirect:searchAll.do";
	}

//	@RequestMapping("/revise.do")
//	public String reviseAssignment(String taskId, Model model) {
//		int taskIdNo;
//		taskIdNo = Integer.parseInt(taskId);
//
//		Task task = service.findTaskByTaskId(taskIdNo);
//		model.addAttribute("task", task);
//
//		return "task/assignment/assignmentModify";
//	}

	@RequestMapping(value = "/revise.do", method = RequestMethod.POST)
	public String reviseAssignment(String title, String contents, String deadlineDay, String deadlineHour, 
									String evalDayStart, String evalHourStart, String evalDayEnd, String evalHourEnd, Model model) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:MM");
		
		String submitDay = deadlineDay + " " + deadlineHour;
		String evaluationStart = evalDayStart + " " + evalHourStart;
		String evaluationEnd = evalDayEnd + " " + evalHourEnd;

		
		Date deadline =null;
		Date evaluationPeriodStart = null;
		Date evaluationPeriodEnd = null;
		
		try {
			deadline = sdf.parse(submitDay);
			evaluationPeriodStart = sdf.parse(evaluationStart);
			evaluationPeriodEnd = sdf.parse(evaluationEnd);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int taskId = 109;
		Task task = new Task(taskId, title, contents, deadline, evaluationPeriodStart,evaluationPeriodEnd);
		
		service.modifyTask(task);
		return "redirect:searchAll.do";
	}

	@RequestMapping("/erase.do")
	public String eraseAssignment(String taskId) {
		System.out.println("deleteTaskId = "+Integer.parseInt(taskId));
		service.removeTask(Integer.parseInt(taskId));
		
		return "redirect:searchAll.do";
	}

	@RequestMapping("/searchByTaskId.do")
	public String searchAssignmentByTaskId(String taskId, Model model) {
		
		Task task = new Task();

		task = service.findTaskByTaskId(Integer.parseInt(taskId));
		model.addAttribute("task", task);

		return "/task/assignment/assignmentDetail";
	}

	@RequestMapping("/searchAll.do")
	public String searchAllAssignment(Model model) {

		List<Task> list = service.findAllTaskByFlag(0);
		model.addAttribute("list", list);
		
		return "/task/assignment/assignmentList";
	}

}
