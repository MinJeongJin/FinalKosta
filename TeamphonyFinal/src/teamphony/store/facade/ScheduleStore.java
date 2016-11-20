package teamphony.store.facade;

import java.util.List;

import teamphony.domain.Schedule;

public interface ScheduleStore {

	void insertSchedule(Schedule schedule);
	void updateSchedule(Schedule schedule);
	void deleteSchedule(int scheduleId);
	List<Schedule> selectScheduleByTeamCode(String teamCode);
	List<Schedule> selectScheduleByDate(String startDate);
	Schedule selectScheduleByScheduleId(int ScheduleId);
	
}
