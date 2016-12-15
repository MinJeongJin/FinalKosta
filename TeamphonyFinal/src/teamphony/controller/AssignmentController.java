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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;

import teamphony.domain.Member;
import teamphony.domain.Task;
import teamphony.domain.Tasks;
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
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("teamCode"));
		
		model.addAttribute("memberList", memberList);
		
		return "task/assignment/assignmentRegister";
	}

	@RequestMapping(value="/create.do", method= RequestMethod.POST)
	public String createAssignment(Task task
									,String deadlineDay, String deadlineHour
									,String evalDayStart, String evalHourStart
									,String evalDayEnd, String evalHourEnd
									,String[] memberIdList
									,HttpSession httpSession
		                            ,String assignmentId
		                            ,String assignmentTitle) {
		
		task.setDeadline("날짜: "+ deadlineDay +"   시간: "+ deadlineHour );
		task.setEvaluationPeriodStart("날짜: "+evalDayStart +"   시간: "+ evalHourStart);
		task.setEvaluationPeriodEnd("날짜: "+evalDayEnd +"   시간: " +evalHourEnd);
		task.setTeamCode((int)httpSession.getAttribute("teamCode"));
		
		System.out.println("==============================");
		System.out.println(task.toString());
		System.out.println("==============================");
		service.registerTask(task, httpSession , assignmentTitle, task.getTaskId());
		
		return "redirect:searchAll.do";
	}

	@RequestMapping("/revise.do")
	public String reviseAssignment(HttpSession session, String taskId, Model model) {
		Team team = new Team();

		Task task = service.findTaskByTaskId(Integer.parseInt(taskId));
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("teamCode"));
		
		task.setMemberList(memberList);
		model.addAttribute("task", task);

		return "task/assignment/assignmentModify";
	}

	@RequestMapping(value = "/revise.do", method = RequestMethod.POST)
	public String reviseAssignment(Task task
									,String deadlineDay, String deadlineHour
									,String evalDayStart, String evalHourStart
									,String evalDayEnd, String evalHourEnd
									,String[] memberIdList
		                            ,String assignmentTitle) {

		
		task.setDeadline("날짜: "+ deadlineDay +"   시간: "+ deadlineHour );
		task.setEvaluationPeriodStart("날짜: "+evalDayStart +"   시간: "+ evalHourStart);
		task.setEvaluationPeriodEnd("날짜: "+evalDayEnd +"   시간: " +evalHourEnd);
		
		service.modifyTask(task, assignmentTitle);
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
		
		session.setAttribute("teamCode", 9642 );
		
		System.out.println("============assignmentController=============");
		System.out.println("getSession= " + session.getAttribute("teamCode"));
		
		int teamCode = (int)session.getAttribute("teamCode");
		
		
		List<Member> memberList = teamService.findMembersByTeamCode(teamCode);
		List<Task> list = service.findAllTaskByFlag(0,teamCode);
		
		for(Task task : list){
			task.setMemberList(memberList);
		}
		model.addAttribute("list", list);
		
		return "/task/assignment/assignmentList";
	}
	
	@RequestMapping(value="/searchByMemberId.do", method= RequestMethod.POST)
	public String searchAssignmentByMemberId(String memberId, Model model){
		List<Task> list = service.findTaskByMemberId(memberId);
		model.addAttribute("memberId",memberId);
		model.addAttribute("list",list);
		
		for(Task task : list){
			System.out.println("==========searchByMemberId==========");
			System.out.println(task.toString());
			System.out.println("=================================");
		}
		
		return "/task/assignment/memberAssignmentList";
	}
	
	@RequestMapping(value="xml.do", produces="application/xml")
	public @ResponseBody Tasks getTasksToXml(){
		System.out.println("xml Test");
		
		List<Task> list  = new ArrayList<>();
		Tasks tasks = new Tasks();
		
		list = service.findAllAssginment();
		
		for (Task task : list) {
			System.out.println(task.getTitle());
		}
		
		tasks.setTasks(list);
		
		return tasks;
	}
	
}
