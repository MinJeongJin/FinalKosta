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
//flag 1==submission   flag 0==assignment
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			if(task.getFlag() == 0){
				mapper.insertAssignment(task);
				session.commit();
				
			}else if (task.getFlag() == 1) {
					System.out.println("flagElseIf(1)=" + task.getFlag());
					mapper.insertSubmission(task);
					session.commit();
					
					int taskId = task.getTaskId();
					List<TaskFile> taskFileList = task.getTaskFileList();
	
					for (TaskFile taskFile : taskFileList) {
						taskFile.setSubmissionId(taskId);
						
						mapper.insertTaskFile(taskFile);
						session.commit();
					}
			}
		}catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
				session.close();
		}
	}

	@Override
	public void updateTask(Task task) {
		SqlSession session = getSessionFactory().openSession();
			
		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			System.out.println("===================update Store===================");
			System.out.println(task.toString());
			mapper.updateTask(task);
			
//flag 1==submission   flag 0==assignment
			
				if(task.getFlag() == 1){
					
					session.commit();
					
					mapper.deleteTaskFile(task.getTaskId());
					session.commit();
					
					List<TaskFile> taskFileList = task.getTaskFileList();
					for (TaskFile taskFile : taskFileList) {
						
						taskFile.setSubmissionId(task.getTaskId());
						mapper.insertTaskFile(taskFile);
						session.commit();
					}
				}else if(task.isEvaluated()){
					// ture == 1 , flase == 0 
					mapper.updateTaskPoint(task.getPoint());
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
	public void deleteTask(int taskId, int flag) {

		SqlSession session = getSessionFactory().openSession();
		try {
				if(flag == 1){
					TaskMapper mapper = session.getMapper(TaskMapper.class);
					mapper.deleteTaskFile(taskId);
					mapper.deleteTask(taskId);
					session.commit();
				}
					TaskMapper mapper = session.getMapper(TaskMapper.class);
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
		
			try{
				TaskMapper mapper = session.getMapper(TaskMapper.class);
				task = mapper.selectTaskByTaskId(taskId);
				
				if(task.getFlag() == 1){
					List<TaskFile> fileList = new ArrayList<>();
					fileList = mapper.selectFileListByTaskId(task.getTaskId());
					task.setTaskFileList(fileList);
				}
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
