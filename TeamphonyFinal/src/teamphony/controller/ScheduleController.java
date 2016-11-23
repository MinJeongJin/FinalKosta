package teamphony.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import teamphony.domain.Schedule;
import teamphony.service.facade.ScheduleService;

@Controller
@RequestMapping("schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="regist.do", method=RequestMethod.POST)
	public String createSchedule(Schedule schedule, HttpSession session){
		
		schedule.setTeamCode((String) session.getAttribute("teamCode"));
		scheduleService.registerSchedule(schedule);
		return "redirect:/calendar.jsp";
	}
}
