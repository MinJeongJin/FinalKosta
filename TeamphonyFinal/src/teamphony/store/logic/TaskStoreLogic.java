package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;
import org.w3c.dom.ls.LSInput;

import teamphony.domain.Member;
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
	public void insertTask(Task task, HttpSession httpSession) {
		SqlSession session = getSessionFactory().openSession();

		try {
//flag 1==submission   flag 0==assignment
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			
			if(task.getFlag() == 0){
				mapper.insertAssignment(task);
				
				for(String memberId: task.getMemberIdList()){
					mapper.insertTaskMember(task.getTaskId(), memberId);
				}
				session.commit();
				
			}else if (task.getFlag() == 1) {
				
					Member loginedMember = (Member)httpSession.getAttribute("loginedMember");
					mapper.insertSubmission(task);
					mapper.insertTaskMember(task.getTaskId(), loginedMember.getMemberId());
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
				}else if(task.getFlag() == 0){
					mapper.deleteMemberIdByTaskId(task.getTaskId());
					session.commit();
					
						for(String memberId : task.getMemberIdList()){
							mapper.insertTaskMember(task.getTaskId(), memberId);
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
//flag 1==submission   flag 0==assignment	
			TaskMapper mapper = session.getMapper(TaskMapper.class);
				if(flag == 1){
					mapper.deleteTaskFile(taskId);
					mapper.deleteTask(taskId);
					
				}else if(flag == 0){
					mapper.deleteTaskMember(taskId);
					session.commit();
					mapper.deleteTask(taskId);
					
				}session.commit();
				
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
					task.setMemberIdList(mapper.selectMemberIdByTaskId(task.getTaskId()));
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
				task.setMemberIdList(mapper.selectMemberIdByTaskId(taskId));
//flag 1==submission   flag 0==assignment		
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
		SqlSession session = getSessionFactory().openSession();
		List<Integer> taskIdList= new ArrayList<>();
		List<Task> taskList = new ArrayList<>();
		
			try{
				TaskMapper mapper= session.getMapper(TaskMapper.class);
				
				taskIdList = mapper.selectTaskIdByMemberId(memberId);
					for(int taskId : taskIdList){
						taskList.add(mapper.selectTaskByTaskId(taskId));
					}
			}finally{
				session.close();
			}
		return taskList;
	}

}
