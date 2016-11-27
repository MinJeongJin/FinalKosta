package teamphony.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	
	@RequestMapping(value="create.do", method=RequestMethod.GET)
	public String createSchedule(long started, long ended, Model model){
	
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date start = new Date(started);
		Date end = new Date(ended);
		
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(start);
		
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(end);
		endCal.add(Calendar.DATE, -1);
		
		String endDate = dateFormat.format(endCal.getTime());
		String startDate = dateFormat.format(startCal.getTime());

		model.addAttribute("startDay", startDate);
		model.addAttribute("endDay", endDate);
		return "schedule/scheduleRegister";
	}
	
	@RequestMapping(value="create.do", method=RequestMethod.POST)
	public String createSchedule(Schedule schedule, String startDay, String startHour, 
			String endDay, String endHour, HttpSession session){
		Date startDate = null, endDate = null;

		String start = startDay + " " + startHour;
		String end = endDay + " " + endHour;

		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try {
			startDate = sdf.parse(start);
			endDate = sdf.parse(end);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		schedule.setStartDate(startDate);
		schedule.setEndDate(endDate);
		schedule.setTeamCode((String) session.getAttribute("teamCode"));
		scheduleService.registerSchedule(schedule);
		return "schedule/calendar2";
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
		List<Schedule> teamSchedules = scheduleService.findSchedulesByTeamCode("aa");
		model.addAttribute("teamSchedules", teamSchedules);
		return "redirect:schedule/calendar2";
	}
	
	@RequestMapping("list.do")
	public String searchSchedulesByDate(Date startDate, Model model){
		List<Schedule> dateSchedules = scheduleService.findSchedulesByDate(startDate);
		model.addAttribute("dateSchedules", dateSchedules);
		return null;
	}
	
}
