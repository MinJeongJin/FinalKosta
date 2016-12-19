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
import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;

import teamphony.domain.Member;
import teamphony.domain.Task;
import teamphony.domain.TaskMember;
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
	
	@RequestMapping(value="/create.do" , method =RequestMethod.GET)
	public String createAssignment(String loginedId, HttpSession session, Model model){
		Team team = new Team();
		team = teamService.findTeamByTeamCode((int)session.getAttribute("teamCode"));
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("teamCode"));

		System.out.println("==========assignment/create.do/get===========");
		System.out.println("getLeaderId= "+ team.getLeaderId());
		System.out.println("loginedId= "+ loginedId);
		
		if( !loginedId.equals(team.getLeaderId()) ){
			return "common/leaderError";
		}
		
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
		
//		System.out.println("==============================");
//		System.out.println(task.toString());
//		System.out.println("==============================");
		service.registerTask(task, httpSession , assignmentTitle, task.getTaskId());
		
		return "redirect:searchAll.do";
	}

	@RequestMapping("/revise.do")
	public String reviseAssignment(HttpSession session
									,String loginedId
									,String taskId
									,Model model) {
		Team team = new Team();
		team = teamService.findTeamByTeamCode((int)session.getAttribute("teamCode"));
		
		if( !loginedId.equals(team.getLeaderId()) ){
			return "common/leaderError";
		}
		
		
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

		task.setTitle(assignmentTitle);
		task.setDeadline("날짜: "+ deadlineDay +"   시간: "+ deadlineHour );
		task.setEvaluationPeriodStart("날짜: "+evalDayStart +"   시간: "+ evalHourStart);
		task.setEvaluationPeriodEnd("날짜: "+evalDayEnd +"   시간: " +evalHourEnd);
		
		service.modifyTask(task, assignmentTitle);
		return "redirect:searchAll.do";
	}
	

	@RequestMapping(value="/erase.do", method=RequestMethod.GET)
	public String eraseAssignment(HttpSession session
								,String loginedId
								,String taskId
								,String flag) {
		
		Team team = new Team();
		team = teamService.findTeamByTeamCode((int)session.getAttribute("teamCode"));
		
			if( !loginedId.equals(team.getLeaderId()) ){
				return "common/leaderError";
			}
			
		service.removeTask(loginedId, Integer.parseInt(taskId),Integer.parseInt(flag));
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
		
		
		List<Member> memberList = teamService.findMembersByTeamCode((int)session.getAttribute("teamCode"));
		List<Task> list = service.findAllTaskByFlag(0,(int)session.getAttribute("teamCode"));
		
		model.addAttribute("list", list);
		
		return "/task/assignment/assignmentList";
	}
	
	@RequestMapping(value="/searchByMemberId.do", method= RequestMethod.POST)
	public String searchAssignmentByMemberId(HttpSession httpSession, String memberId, Model model){
		
		List<Task> taskList = new ArrayList<>();
		List<Task> assignmentList =new ArrayList<>();
		List<Task> submissionList =new ArrayList<>();
		
		taskList = service.findTaskByMemberId(memberId, (int)httpSession.getAttribute("teamCode"));
		
		for(Task task : taskList){
//flag 1==submission   flag 0==assignment			
			if(task.getFlag() == 0){
				
				assignmentList.add(task);
			}else if (task.getFlag() == 1){
				
				submissionList.add(task);
			}
		}
		model.addAttribute("assignmentList", assignmentList);
		model.addAttribute("submissionList", submissionList);
		
		for(Task task : assignmentList){
			System.out.println("=========assignmentList============");
			System.out.println(task.getTaskMember().size());
		}
		
//		for(Task task : submissionList){
//			System.out.println(task.toString());
//			System.out.println("==================================");
//			System.out.println("task.getTaskMember().toString()= "+task.getTaskMember().toString());
//			System.out.println("==================================");
//		}
		model.addAttribute("memberId",memberId);
		
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
