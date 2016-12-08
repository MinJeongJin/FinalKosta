package teamphony.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamphony.domain.Member;
import teamphony.domain.Task;
import teamphony.domain.Team;
import teamphony.service.facade.TaskService;
import teamphony.service.facade.TeamService;

@Controller
@RequestMapping("assignment")
public class AssignmentController {

	@Autowired
	private TaskService service;
	@Autowired
	private TeamService teamService;
	
	@RequestMapping("/create.do")
	public String createAssignment(HttpSession session, Model model){
		Team team = new Team();
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("code"));
		
		model.addAttribute("memberList", memberList);
		
		return "task/assignment/assignmentRegister";
	}

	@RequestMapping(value="/create.do", method= RequestMethod.POST)
	public String createAssignment(Task task
									,String deadlineDay, String deadlineHour
									,String evalDayStart, String evalHourStart
									,String evalDayEnd, String evalHourEnd
									,String[] memberIdList) {
		
		String submitDay = deadlineDay + " " + deadlineHour;
		String evaluationStart = evalDayStart + " " + evalHourStart;
		String evaluationEnd = evalDayEnd + " " + evalHourEnd;

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd HH:MM");
		
		Date deadline = null;
		Date evaluationPeriodStart = null;
		Date evaluationPeriodEnd = null;
		
		try {

			deadline = dateFormat.parse(submitDay);
			evaluationPeriodStart = dateFormat.parse(evaluationStart);
			evaluationPeriodEnd = dateFormat.parse(evaluationEnd);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		task.setDeadline(deadline);
		task.setEvaluationPeriodStart(evaluationPeriodStart);
		task.setEvaluationPeriodEnd(evaluationPeriodEnd);
		
		service.registerTask(task);
		
		return "redirect:searchAll.do";
	}

	@RequestMapping("/revise.do")
	public String reviseAssignment(HttpSession session, String taskId, Model model) {
		Team team = new Team();

		Task task = service.findTaskByTaskId(Integer.parseInt(taskId));
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("code"));
		
		task.setMemberList(memberList);
		model.addAttribute("task", task);

		return "task/assignment/assignmentModify";
	}

	@RequestMapping(value = "/revise.do", method = RequestMethod.POST)
	public String reviseAssignment(Task task
									,String deadlineDay, String deadlineHour
									,String evalDayStart, String evalHourStart
									,String evalDayEnd, String evalHourEnd
									,String[] memberIdList) {

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
		
		task.setDeadline(deadline);
		task.setEvaluationPeriodStart(evaluationPeriodStart);
		task.setEvaluationPeriodEnd(evaluationPeriodEnd);
		
		service.modifyTask(task);
		return "redirect:searchAll.do";
	}
	

	@RequestMapping("/erase.do")
	public String eraseAssignment(String taskId,String flag) {
		
		service.removeTask(Integer.parseInt(taskId),Integer.parseInt(flag));
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
	public String searchAllAssignment(HttpSession session, Model model) {
//test 를 위하여 임의로 session에 팀 코드를 부여 하였다.
		
		Team team = new Team();
		Task task = new Task();
		team.setCode(1111);
		session.setAttribute("code", team.getCode());
		
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("code"));
		List<Task> list = service.findAllTaskByFlag(0);
		
		task.setMemberList(memberList);
		model.addAttribute("list", list);
		
		return "/task/assignment/assignmentList";
	}

}
