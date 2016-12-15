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
	public void insertTask(Task task
						,HttpSession httpSession
						,String assignmentTitle
						,int assignmentId) {
		SqlSession session = getSessionFactory().openSession();

		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			
//flag 1==submission   flag 0==assignment
			if(task.getFlag() == 0){
				mapper.insertAssignment(task);
				
				for(String memberId: task.getMemberIdList()){
					
					mapper.insertTaskMemberForAssignment(task.getTaskId(), memberId, task.getTitle());
				}
				
			}else if (task.getFlag() == 1) {
				
				String loginedMemberId =(String) httpSession.getAttribute("loginedMember");
				System.out.println("==============insert Mapper================");
				System.out.println("loginedMemberId"+(String)httpSession.getAttribute("loginedMember") );
				mapper.insertSubmission(task);
				session.commit();
				
					
				mapper.updateTaskMemberForSubmission(assignmentId, loginedMemberId, task.getTaskId());
				
				
				
				
				session.commit();
				
				
				int taskId = task.getTaskId();
				List<TaskFile> taskFileList = task.getTaskFileList();

				for (TaskFile taskFile : taskFileList) {
					taskFile.setSubmissionId(taskId);
					
					mapper.insertTaskFile(taskFile);
				}
			}
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
	}

	@Override
	public void updateTask(Task task, String assignmentTitle) {
		SqlSession session = getSessionFactory().openSession();
			
		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			mapper.updateTask(task);
			
//ture == 1 , flase == 0 
			if(task.getEvaluated() == 1){
				mapper.updateTaskPoint(task);
//flag 1==submission   flag 0==assignment
			}else if(task.getFlag() == 0){

				mapper.deleteMemberIdByTaskId(task.getTaskId());
				
					for(String memberId : task.getMemberIdList()){
						mapper.insertTaskMemberForAssignment(task.getTaskId(), memberId, assignmentTitle);
					}
			}else if(task.getFlag() == 1){
				mapper.deleteTaskFile(task.getTaskId());
				
				List<TaskFile> taskFileList = task.getTaskFileList();
				
				for (TaskFile taskFile : taskFileList) {
					taskFile.setSubmissionId(task.getTaskId());
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
	public void deleteTask(int taskId, int flag) {

		SqlSession session = getSessionFactory().openSession();
		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
//flag 1==submission   flag 0==assignment	
			if(flag == 1){
				
				mapper.deleteTaskFile(taskId);
				mapper.deleteMemberIdByTaskId(taskId);
				mapper.deleteTask(taskId);
				
			}else if(flag == 0){
				mapper.deleteTaskMember(taskId);
				mapper.deleteTask(taskId);
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
	public List<Task> selectAllTaskByFlag(int flag, int teamCode) {

		SqlSession session = getSessionFactory().openSession();
		
		List<Task> taskList= new ArrayList<>();
		List<TaskFile> fileList = new ArrayList<>();
//flag 1==submission   flag 0==assignment
		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			taskList = mapper.selectAllTaskByFlag(flag, teamCode);
			
			if(flag == 1){
				
				for(Task task : taskList){
					fileList = mapper.selectFileListByTaskId(task.getTaskId());
					task.setTaskFileList(fileList);
					task.setMemberIdList(mapper.selectMemberIdByTaskId(task.getTaskId()));
				}
				
				
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
	
	public List<Task> selectAllAssginment() {

		SqlSession session = getSessionFactory().openSession();
		
		List<Task> taskList= new ArrayList<>();
		try {
			TaskMapper mapper = session.getMapper(TaskMapper.class);
			taskList = mapper.selectAllAssginment();
			return taskList;
		} finally {
			session.close();
		}
	}

}
