package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import teamphony.domain.Schedule;
import teamphony.store.facade.ScheduleStore;
import teamphony.store.mapper.ScheduleMapper;

@Repository
public class ScheduleStoreLogic implements ScheduleStore {

	private static final String resource = "config.xml";
	
	private SqlSessionFactory getSessionFactory() {
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(reader);
	}
	
	@Override
	public void insertSchedule(Schedule schedule) {
		SqlSession session = getSessionFactory().openSession();
		
		try {
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		mapper.insertSchedule(schedule);
		session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public void updateSchedule(Schedule schedule) {
		SqlSession session = getSessionFactory().openSession();
		
		try {
			ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
			mapper.updateSchedule(schedule);
			session.commit();
			} finally {
				session.close();
			}
	}

	@Override
	public void deleteSchedule(int scheduleId) {
		SqlSession session = getSessionFactory().openSession();
		
		try {
			ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
			mapper.deleteSchedule(scheduleId);
			session.commit();
			} finally {
				session.close();
			}
	}

	@Override
	public List<Schedule> selectSchedulesByTeamCode(String teamCode) {
		SqlSession session = getSessionFactory().openSession();
		List<Schedule> list = new ArrayList<>();
		
	try {
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
		list = mapper.selectSchedulesByTeamCode(teamCode);
		} finally {
			session.close();
		}
	return list;
	}

	@Override
	public List<Schedule> selectSchedulesByDate(Date startDate) {
		SqlSession session = getSessionFactory().openSession();
		List<Schedule> list = new ArrayList<>();
		
		try {
			ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
			list = mapper.selectSchedulesByDate(startDate);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Schedule selectScheduleByScheduleId(int scheduleId) {
		SqlSession session = getSessionFactory().openSession();
		
		try{
			ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
			return mapper.selectScheduleByScheduleId(scheduleId);
		} finally {
			session.close();
		}
	}

}
