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
import org.w3c.dom.ls.LSInput;

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
				System.out.println("======================");
				System.out.println("taskId= "+taskId);
				List<TaskFile> taskFileList = task.getTaskFileList();

				for (TaskFile taskFile : taskFileList) {
					taskFile.setSubmissionId(taskId);
					mapper.insertTaskFile(taskFile);
					session.commit();
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
			System.out.println("================store================");
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			
				if(task.getPoint() != 0){
					System.out.println("getPoint= "+task.getPoint());
					System.out.println("getTaskId= "+task.getTaskId());
					
					int point = task.getPoint();
					System.out.println("===========mapper Strat==============");
					mapper.updateTaskPoint(task); // taskId 이거 때문에 그래  수정 했어
					System.out.println("===========mapper End==============");
					session.commit();
					System.out.println("===========committed==============");
				}
//			mapper.updatdeTask(task);
//			List<TaskFile> taskFileList = task.getTaskFileList();
//			for (TaskFile taskFile : taskFileList) {
//				taskFile.setSubmissionId(task.getTaskId());
//				mapper.updateTaskFile(taskFile);
//			}
//			session.commit();

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
//			mapper.deleteTaskFile(taskId);
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
	public List<Task> selectAllTaskByFlag(int flag) {

		SqlSession session = getSessionFactory().openSession();
		List<Task> taskList= new ArrayList<>();
		List<TaskFile> fileList = new ArrayList<>();
		
		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			
			taskList = mapper.selectAllTaskByFlag(flag);
			
				for(Task task : taskList){
					
						fileList = mapper.selectFileListByTaskId(task.getTaskId());
						System.out.println("fileListSize= "+fileList.size());
						task.setTaskFileList(fileList);
				}
			return taskList;
		} finally {
			session.close();
		}
	}
	
	

	@Override
	public Task selectTaskByTaskId(int taskId) {
		
		SqlSession session = getSessionFactory().openSession();
		Task task = new Task();
		List<TaskFile> fileList = new ArrayList<>();
		
			try{
				TaskMapper mapper = session.getMapper(TaskMapper.class);
				task = mapper.selectTaskByTaskId(taskId);
				
				fileList = mapper.selectFileListByTaskId(task.getTaskId());
				task.setTaskFileList(fileList);
			}finally {
				session.close();
			}
		return task;
	}

	@Override
	public List<Task> selectTaskByMemberId(String memberId) {
		return null;
	}

}
