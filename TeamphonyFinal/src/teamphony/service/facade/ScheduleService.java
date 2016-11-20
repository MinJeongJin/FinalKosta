package teamphony.service.facade;

import java.util.List;

import teamphony.domain.Schedule;

public interface ScheduleService {

	void registerSchedule(Schedule schedule);
	void modifySchedule(Schedule schedule);
	void removeSchedule(int scheduleId);
	List<Schedule> findScheduleByTeamCode(String teamCode);
	List<Schedule> findScheduleByDate(String startDate);
	Schedule findScheduleByScheduleId(int scheduleId);
}
