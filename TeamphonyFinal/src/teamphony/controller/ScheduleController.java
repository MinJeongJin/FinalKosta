package teamphony.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import teamphony.domain.Member;
import teamphony.domain.Members;
import teamphony.domain.Schedule;
import teamphony.domain.Schedules;
import teamphony.service.facade.ScheduleService;
/**
 * 팀코드를 2로 전체적으로 set해준 상황.
 * 제약조건이 걸린 DB로 schedule_tb를 재생성해야 하며 
 * 코드 다시 살펴봐야함
 * */
@Controller
@RequestMapping("schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value="create.do", method=RequestMethod.GET)
	public String createSchedule(long started, long ended, Model model){
//	사용자가 선택한 날짜(들)의 시작과 끝을 받아와서 registerForm에 set해주는 작업
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
		
		String start = startDay + " " + startHour;
		String end = endDay + " " + endHour;
		
//		위의 " "속에 T를 넣어도 Event로 인식
//		String start = startDay + "T" + startHour;
//		String end = endDay + "T" + endHour;

		schedule.setStartDate(start);
		schedule.setEndDate(end);
		
		schedule.setTeamCode((int) session.getAttribute("teamCode"));
		
		scheduleService.registerSchedule(schedule);
		return "redirect:/schedule/calendar.do";
	}
	
	@RequestMapping(value="revise.do", method=RequestMethod.POST)
	public String reviseSchedule(Schedule schedule, String startDay, String startHour, 
			String endDay, String endHour){
		String start = startDay + " " + startHour;
		String end = endDay + " " + endHour;
		
		schedule.setStartDate(start);
		schedule.setEndDate(end);
		
		scheduleService.modifySchedule(schedule);
		return "redirect:/schedule/detail.do?scheduleId="+ schedule.getScheduleId();
	}
	
	@RequestMapping("erase.do")
	public String eraseSchedule(int scheduleId){
		scheduleService.removeSchedule(scheduleId);
		return "redirect:/schedule/calendar.do";
	}
	
	@RequestMapping("detail.do")
	public String searchScheduleByScheduleId(int scheduleId, Model model){
		Schedule schedule = scheduleService.findScheduleByScheduleId(scheduleId);
		
//		schedule의 date가 "yyyy-MM-dd HH:mm"형태
		String [] startArray = schedule.getStartDate().split(" "); 
		String [] endArray = schedule.getEndDate().split(" ");
		
		model.addAttribute("startDay", startArray[0]);
		model.addAttribute("startHour", startArray[1]);
		model.addAttribute("endDay", endArray[0]);
		model.addAttribute("endHour", endArray[1]);
		
		model.addAttribute("schedule", schedule);
		return "schedule/scheduleDetail";
	}
	
	@RequestMapping("calendar.do")
	public String searchSchedulesByTeamCode(HttpSession session, Model model){
		int teamCode = (int) session.getAttribute("teamCode");
		List<Schedule> teamSchedules = scheduleService.findSchedulesByTeamCode(teamCode);
		
		model.addAttribute("teamSchedules", teamSchedules);
		return "schedule/calendar2";
	}
	
	@RequestMapping(value = "xml.do", produces = "application/xml")
	public @ResponseBody Schedules getSchedulesToXml(int teamCode) {

		List<Schedule> list = new ArrayList<>();
		Schedules schedules = new Schedules();

		list = scheduleService.findSchedulesByTeamCode(teamCode);

		schedules.setSchedules(list);

		return schedules;
	}
	
}
