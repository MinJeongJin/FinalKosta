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
import teamphony.domain.TaskMember;
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
						,HttpSession session
						,String assignmentTitle
						,int assignmentId) {
		SqlSession sqlsession = getSessionFactory().openSession();

		try {
			TaskMapper mapper = sqlsession.getMapper(TaskMapper.class);
			
//flag 1==submission   flag 0==assignment
			if(task.getFlag() == 0){
				mapper.insertAssignment(task);
				
				for(String memberId: task.getMemberIdList()){
					
					mapper.insertTaskMemberForAssignment(task.getTaskId(), memberId, task.getTitle());
				}
				
			}else if (task.getFlag() == 1) {
				
				Member member = (Member)session.getAttribute("member");
				String loginedMemberId = member.getMemberId();
				mapper.insertSubmission(task);
				
				
				sqlsession.commit();
				
					
				mapper.updateTaskMemberForSubmission(assignmentId, loginedMemberId, task.getTaskId());
				
				
				
				
				sqlsession.commit();
				
				
				int taskId = task.getTaskId();
				List<TaskFile> taskFileList = task.getTaskFileList();

				for (TaskFile taskFile : taskFileList) {
					taskFile.setSubmissionId(taskId);
					
					mapper.insertTaskFile(taskFile);
				}
			}
			sqlsession.commit();
		}catch (Exception e) {
			e.printStackTrace();
			sqlsession.rollback();
		}finally{
			sqlsession.close();
		}
	}

	@Override
	public void updateTask(Task task, String assignmentTitle) {
		SqlSession sqlsession = getSessionFactory().openSession();
			
		try {
			TaskMapper mapper = sqlsession.getMapper(TaskMapper.class);
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
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			sqlsession.rollback();
		} finally {
			sqlsession.close();
		}
	}

	@Override
	public void deleteTask(int taskId, int flag) {

		SqlSession sqlsession = getSessionFactory().openSession();
		try {
			TaskMapper mapper = sqlsession.getMapper(TaskMapper.class);
//flag 1==submission   flag 0==assignment	
			if(flag == 1){
				
				mapper.deleteTaskFile(taskId);
				mapper.deleteMemberIdByTaskId(taskId);
				mapper.deleteTask(taskId);
				
			}else if(flag == 0){
				mapper.deleteTaskMember(taskId);
				mapper.deleteTask(taskId);
			}
			sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			sqlsession.rollback();
		} finally {
			sqlsession.close();
		}
	}

	@Override
	public List<Task> selectAllTaskByFlag(int flag, int teamCode) {

		SqlSession sqlsession = getSessionFactory().openSession();
		
		List<Task> taskList= new ArrayList<>();
//flag 1==submission   flag 0==assignment
		try {
			TaskMapper mapper = sqlsession.getMapper(TaskMapper.class);
			taskList = mapper.selectAllTaskByFlag(flag, teamCode);
			
			if(flag == 0){
				
				for(Task task : taskList){
					task.setMemberIdList(mapper.selectMemberIdByAssignmentId(task.getTaskId()));
					task.setTaskMember(mapper.selectTaskMemberByAssignmentId(task.getTaskId()));
//					System.out.println("==========mapper/selectAlltask//assignment========");
//					System.out.println("getTaskMember().size= "+task.getTaskMember().size());
//					
				
				}
			
				}else if(flag == 1){
				
				for(Task task : taskList){
					
					task.setTaskFileList(mapper.selectFileListByTaskId(task.getTaskId()));
					task.setMemberIdList(mapper.selectMemberIdBySubmissionId(task.getTaskId()));
					task.setAssignmentTitleList(mapper.selectAssignmentTitleBySubmissionId(task.getTaskId()));
					
					System.out.println("=======mapper===============");
					System.out.println(task.toString());
					System.out.println("=====================================");
					
				}
				
			}
			return taskList;
		} finally {
			sqlsession.close();
		}
	}
	

	@Override
	public Task selectTaskByTaskId(int taskId) {
		SqlSession sqlsession = getSessionFactory().openSession();
		Task task = new Task();
	
		try{
			TaskMapper mapper = sqlsession.getMapper(TaskMapper.class);
			
			task = mapper.selectTaskByTaskId(taskId);
			task.setMemberIdList(mapper.selectMemberIdByAssignmentId(taskId));
//flag 1==submission   flag 0==assignment		
			
			if(task.getFlag() == 1){
				
				task.setTaskFileList(mapper.selectFileListByTaskId(task.getTaskId()));
				task.setMemberIdList(mapper.selectMemberIdBySubmissionId(task.getTaskId()));
				task.setAssignmentTitleList(mapper.selectAssignmentTitleBySubmissionId(task.getTaskId()));
			}
			}finally {
				sqlsession.close();
			}
		return task;
	}

	@Override
	public List<Task> selectTaskByMemberId(String memberId, int teamCode) {
		
		SqlSession sqlsession = getSessionFactory().openSession();
		List<Task> taskList = new ArrayList<>();
		List<TaskMember> taskMemberList = new ArrayList<>();
		List<TaskFile> taskFileList = new ArrayList<>();
		
		try{
			TaskMapper mapper= sqlsession.getMapper(TaskMapper.class);
			taskList = mapper.selectMembersTaskByMemberId(memberId, teamCode);
			
			for(Task task : taskList){
//flag 1==submission   flag 0==assignment				
				if(task.getFlag() == 1){
					taskMemberList = mapper.selectTaskMemberBySubmissionId(task.getTaskId());
					taskFileList = mapper.selectFileListByTaskId(task.getTaskId());
					
					task.setTaskMember(taskMemberList);
					task.setTaskFileList(taskFileList);
					
				}else if (task.getFlag() == 0){
					
				taskMemberList = mapper.selectTaskMemberByAssignmentId(task.getTaskId());
				task.setTaskMember(taskMemberList);
				}
				
			}
			
		}finally{
			sqlsession.close();
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
