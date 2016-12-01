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

import teamphony.domain.Task;
import teamphony.domain.TaskFile;
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
		SqlSession session = getSessionFactory().openSession();

		try {

			TaskMapper mapper = session.getMapper(TaskMapper.class);
			mapper.insertTask(task);

			if (task.getFlag() == 1) {
				int taskId = task.getTaskId();
				List<TaskFile> taskFileList = task.getTaskFileList();

				for (TaskFile taskFile : taskFileList) {
					taskFile.setSubmissionId(taskId);
					mapper.insertTaskFile(taskFile);
				}

			}
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

	}

	@Override
	public void updateTask(Task task) {
		SqlSession session = getSessionFactory().openSession();

		try {

			TaskMapper mapper = session.getMapper(TaskMapper.class);
			mapper.updateTask(task);
			List<TaskFile> taskFileList = task.getTaskFileList();

			for (TaskFile taskFile : taskFileList) {
				taskFile.setSubmissionId(task.getTaskId());
				mapper.updateTaskFile(taskFile);
			}

			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteTask(int taskId) {

		SqlSession session = getSessionFactory().openSession();

		try {

			TaskMapper mapper = session.getMapper(TaskMapper.class);
			mapper.deleteTaskFile(taskId);
			mapper.deleteTask(taskId);

			session.commit();

		} catch (Exception e) {
			e.printStackTrace();

			session.rollback();
		} finally {
			session.close();
		}

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
		System.out.println("=====스토어 시작======================");
		SqlSession session = getSessionFactory().openSession();
		Task task = null;
		try {
			System.out.println("=====try 시작======================");
			TaskMapper mapper = session.getMapper(TaskMapper.class);

			System.out.println("===========매퍼 시작=========");
			task = mapper.selectTaskDetail(taskId);

			// List<TaskFile> fileList = new ArrayList<>();
			String filePath = mapper.selectFileList(taskId).getFilePath();

			System.out.println("filePath = " + filePath);

			System.out.println("===========매퍼 끝=========");

			System.out.println(task.toString());
			return task;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return task;
	}

	@Override
	public List<Task> selectTaskByMemberId(String memberId) {
		return null;
	}

}
