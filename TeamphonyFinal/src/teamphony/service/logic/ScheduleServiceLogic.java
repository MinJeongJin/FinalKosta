package teamphony.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamphony.domain.Schedule;
import teamphony.service.facade.ScheduleService;
import teamphony.store.facade.ScheduleStore;

@Service
public class ScheduleServiceLogic implements ScheduleService {

	@Autowired
	private ScheduleStore scheduleStore;
	
	@Override
	public void registerSchedule(Schedule schedule) {
		scheduleStore.insertSchedule(schedule);
	}

	@Override
	public void modifySchedule(Schedule schedule) {
		scheduleStore.updateSchedule(schedule);
	}

	@Override
	public void removeSchedule(int scheduleId) {
		scheduleStore.deleteSchedule(scheduleId);
	}

	@Override
	public List<Schedule> findScheduleByTeamCode(String teamCode) {
		return scheduleStore.selectScheduleByTeamCode(teamCode);
	}

	@Override
	public List<Schedule> findScheduleByDate(String startDate) {
		return scheduleStore.selectScheduleByDate(startDate);
	}

	@Override
	public Schedule findScheduleByScheduleId(int scheduleId) {
		return scheduleStore.selectScheduleByScheduleId(scheduleId);
	}

}
