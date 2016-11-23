package teamphony.service.facade;

import java.sql.Date;
import java.util.List;

import teamphony.domain.Schedule;

public interface ScheduleService {

	void registerSchedule(Schedule schedule);
	void modifySchedule(Schedule schedule);
	void removeSchedule(int scheduleId);
	List<Schedule> findSchedulesByTeamCode(String teamCode);
	List<Schedule> findSchedulesByDate(Date startDate);
	Schedule findScheduleByScheduleId(int scheduleId);
}
