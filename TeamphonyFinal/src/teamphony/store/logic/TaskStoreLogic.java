package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import teamphony.domain.Task;
import teamphony.store.facade.TaskStore;
import teamphony.store.mapper.TaskMapper;

@Repository
public class TaskStoreLogic implements TaskStore {

	private static final String Resource = "config.xml";

	private SqlSessionFactory getSessionFactory() {

		Reader reader = null;

		try {
			reader = Resources.getResourceAsReader(Resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(reader);
	}

	@Override
	public void insertTask(Task task) {

		System.out.println(task);
		
		

		SqlSession session = getSessionFactory().openSession();

		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			System.out.println("==============================");
			System.out.println(task.getContents());
			System.out.println(task.getFilePath());
			System.out.println(task.getFlag());
			System.out.println(task.getTitle());
			System.out.println(task.getDeadline());
			
			mapper.insertTask(task);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
			System.out.println("asdfoiasjdfio end");
		}
	}

	@Override
	public void updateTask(Task task) {

	}

	@Override
	public void deleteTask(int taskId) {

	}

	@Override
	public List<Task> selectAllTask() {

		SqlSession session = getSessionFactory().openSession();

		try {

			TaskMapper mapper = session.getMapper(TaskMapper.class);
			return mapper.selectAllTask();
		} finally {
			session.close();
		}
	}

	@Override
	public Task selectTaskByTaskId(int taskId) {

		SqlSession session = getSessionFactory().openSession();

		try {

			TaskMapper mapper = session.getMapper(TaskMapper.class);
			return mapper.selectTaskByTaskId(taskId);

		} finally {
			session.close();
		}
	}

	@Override
	public List<Task> selectTaskByMemberId(String memberId) {
		return null;
	}

}
