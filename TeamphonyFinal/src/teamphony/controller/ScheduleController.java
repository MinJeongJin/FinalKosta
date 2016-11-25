package teamphony.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamphony.domain.Schedule;
import teamphony.service.facade.ScheduleService;

@Controller
@RequestMapping("schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="create.do")
	public String createSchedule(Schedule schedule, HttpSession session){
		schedule.setTeamCode((String) session.getAttribute("teamCode"));
		scheduleService.registerSchedule(schedule);
		return "redirect:/calendar2";
	}
	
	@RequestMapping(value="revise.do", method=RequestMethod.GET)
	public String modifySchedule(int scheduleId, Model model){
		Schedule schedule = scheduleService.findScheduleByScheduleId(scheduleId);
		model.addAttribute("schedule", schedule);
		return null;
	}
	
	@RequestMapping(value="revise.do", method=RequestMethod.POST)
	public String modifySchedule(Schedule schedule){
		scheduleService.modifySchedule(schedule);
		return null;
	}
	
	@RequestMapping("erase.do")
	public String eraseSchedule(int scheduleId){
		scheduleService.removeSchedule(scheduleId);
		return null;
	}
	
	@RequestMapping("detail.do")
	public String searchScheduleByScheduleId(int scheduleId, Model model){
		Schedule schedule = scheduleService.findScheduleByScheduleId(scheduleId);
		model.addAttribute("schedule", schedule);
		return null;
	}
	
	@RequestMapping("calendar.do")
	public String searchSchedulesByTeamCode(HttpSession session, Model model){
		String teamCode = (String) session.getAttribute("teamCode");
		List<Schedule> teamSchedules = scheduleService.findSchedulesByTeamCode(teamCode);
		model.addAttribute("teamSchedules", teamSchedules);
		return null;
	}
	
	@RequestMapping("list.do")
	public String searchSchedulesByDate(Date startDate, Model model){
		List<Schedule> dateSchedules = scheduleService.findSchedulesByDate(startDate);
		model.addAttribute("dateSchedules", dateSchedules);
		return null;
	}
	
}
