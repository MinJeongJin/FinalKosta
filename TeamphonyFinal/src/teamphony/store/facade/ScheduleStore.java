package teamphony.store.facade;

import java.util.Date;
import java.util.List;

import teamphony.domain.Schedule;

public interface ScheduleStore {

	void insertSchedule(Schedule schedule);
	void updateSchedule(Schedule schedule);
	void deleteSchedule(int scheduleId);
	List<Schedule> selectSchedulesByTeamCode(int teamCode);
	Schedule selectScheduleByScheduleId(int ScheduleId);
	
}
