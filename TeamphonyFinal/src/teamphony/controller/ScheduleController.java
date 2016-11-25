package teamphony.controller;

import java.sql.Date;

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
	
	@RequestMapping(value="create.do", method=RequestMethod.POST)
	public String createSchedule(Schedule schedule, HttpSession session){
		
		schedule.setTeamCode((String) session.getAttribute("teamCode"));
		scheduleService.registerSchedule(schedule);
		return "redirect:/calendar2";
	}
	
	@RequestMapping("revise.do")
	public String modifySchedule(Schedule schedule){
		
		return null;
	}
	
	@RequestMapping("erase.do")
	public String eraseSchedule(int scheduleId){
		
		return null;
	}
	
	@RequestMapping("detail.do")
	public String searchScheduleByScheduleId(int scheduleId, Model model){
		
		return null;
	}
	
	@RequestMapping("calendar.do")
	public String searchSchedulesByTeamCode(HttpSession session, Model model){
		
		return null;
	}
	
	@RequestMapping("list.do")
	public String searchSchedulesByDate(Date startDate, Model model){
		
		return null;
	}
	
}
