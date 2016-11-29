package teamphony.store.mapper;

import java.util.Date;
import java.util.List;

import teamphony.domain.Schedule;

public interface ScheduleMapper {

	void insertSchedule(Schedule schedule);
	void updateSchedule(Schedule schedule);
	void deleteSchedule(int scheduleId);
	List<Schedule> selectSchedulesByTeamCode(int teamCode);
	List<Schedule> selectSchedulesByDate(Date startDate);
	Schedule selectScheduleByScheduleId(int ScheduleId);
}
