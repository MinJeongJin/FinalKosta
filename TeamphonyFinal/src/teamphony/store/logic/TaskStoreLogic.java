package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import teamphony.domain.Task;
import teamphony.store.facade.TaskStore;

public class TaskStoreLogic implements TaskStore {
	
	private static final String Resource= "teamphony/resource/config.xml";
	
	private SqlSessionFactory getSessionFactory(){
		
		Reader reader =null;
		
		try {
			reader= Resources.getResourceAsReader(Resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(reader);
	}
	

	@Override
	public void insertTask(Task task) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTask(Task task) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTask(int taskId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Task> selectAllTask() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Task selectTaskByTaskId(int taskId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Task> selectTaskByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
