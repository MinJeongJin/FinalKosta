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
		
		task.setDeadline("�궇吏�: "+ deadlineDay +"   �떆媛�: "+ deadlineHour );
		task.setEvaluationPeriodStart("�궇吏�: "+evalDayStart +"   �떆媛�: "+ evalHourStart);
		task.setEvaluationPeriodEnd("�궇吏�: "+evalDayEnd +"   �떆媛�: " +evalHourEnd);
		
//		/service.registerTask(task);
		
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

		
		task.setDeadline("�궇吏�: "+ deadlineDay +"   �떆媛�: "+ deadlineHour );
		task.setEvaluationPeriodStart("�궇吏�: "+evalDayStart +"   �떆媛�: "+ evalHourStart);
		task.setEvaluationPeriodEnd("�궇吏�: "+evalDayEnd +"   �떆媛�: " +evalHourEnd);
		
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
//test 瑜� �쐞�븯�뿬 �엫�쓽濡� session�뿉 �� 肄붾뱶瑜� 遺��뿬 �븯���떎.
		
		Team team = new Team();
		team.setCode(9642);
		session.setAttribute("code", team.getCode());
		
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("code"));
		List<Task> list = service.findAllTaskByFlag(0);
		
		for(Task task : list){
			task.setMemberList(memberList);
			System.out.println(task.getMemberList().size());
		}
		model.addAttribute("list", list);
		
		return "/task/assignment/assignmentList";
	}
	
	@RequestMapping(value="/searchByMemberId.do", method= RequestMethod.POST)
	public String searchAssignmentByMemberId(String memberId, Model model){
		List<Task> list = service.findTaskByMemberId(memberId);
		model.addAttribute("memberId",memberId);
		model.addAttribute("list",list);
		
		return "/task/assignment/memberAssignmentList";
	}
	
	
	

}
