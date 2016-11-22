package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
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
//		mapper.create(schedule);
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
//			mapper.update(schedule);
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
//			mapper.delete(scheduleId);
			session.commit();
			} finally {
				session.close();
			}
	}

	@Override
	public List<Schedule> selectScheduleByTeamCode(String teamCode) {
		SqlSession session = getSessionFactory().openSession();
		List<Schedule> list = new ArrayList<>();
		list = null;
		
	try {
		ScheduleMapper mapper = session.getMapper(ScheduleMapper.class);
//		list = mapper.readByTeamCode(teamCode);
		} finally {
			session.close();
		}
	return list;
	}

	@Override
	public List<Schedule> selectScheduleByDate(String startDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Schedule selectScheduleByScheduleId(int scheduleId) {
		// TODO Auto-generated method stub
		return null;
	}

}
