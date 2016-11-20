package teamphony.service.logic;

import java.util.List;

import org.springframework.stereotype.Service;

import teamphony.domain.Schedule;
import teamphony.service.facade.ScheduleService;

@Service
public class ScheduleServiceLogic implements ScheduleService {

	@Override
	public void registerSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifySchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeSchedule(int scheduleId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Schedule> findScheduleByTeamCode(String teamCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Schedule> findScheduleByDate(String startDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Schedule findScheduleByScheduleId(int scheduleId) {
		// TODO Auto-generated method stub
		return null;
	}

}
