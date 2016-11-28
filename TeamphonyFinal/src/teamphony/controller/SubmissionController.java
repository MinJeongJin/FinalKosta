package teamphony.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import teamphony.domain.Task;
import teamphony.domain.TaskFile;
import teamphony.service.facade.TaskService;

@Controller
@RequestMapping("submission")
public class SubmissionController {

	@Autowired
	private TaskService service;

	@RequestMapping(value = "/create.do", method = RequestMethod.POST)
	public String createSubmission(@RequestParam("attchFile") MultipartFile[] attchFileList, String title, String contents, String flag) { // attchFile
		System.out.println("============================");
		System.out.println("flag= " +flag);
		
//		int taskIdNo = Integer.parseInt(taskId);
		int flagNo = Integer.parseInt(flag);
		System.out.println("flagNo= " +flagNo);
		
		
		String filePathOnly = "c:/uploadTemp";
		
		Task task = new Task();
		task.setTitle(title);
		task.setContents(contents);
		task.setFlag(flagNo);
		
		System.out.println("title = "+task.getTitle());
		System.out.println(("contens= "+task.getContents()));
		System.out.println(("flag= "+task.getFlag()));
		
		
		//첨부 파일 List파일저장 , TASKFILE_TB 저장
		List<TaskFile> taskFileList = new ArrayList<TaskFile>();
		for (MultipartFile attchFile : attchFileList) {
			int taskId = task.getTaskId();
			String filePath = filePathOnly + File.separator + attchFile.getOriginalFilename();
			TaskFile taskFile = new TaskFile(filePath);
			
			System.out.println("저장 경로 =" + filePath);
			File f = new File(filePath);
			try {
				attchFile.transferTo(f); //물리 파일 저장
				taskFileList.add(taskFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		task.setTaskFileList(taskFileList);
		service.registerTask(task); //task_tb 저장
		return "redirect:serchAll.do";
	}

	@RequestMapping("/revise.do")
	public String reviseSubmission(Task task) {

		return null;
	}

	@RequestMapping("/erase.do")
	public String eraseSubmission(Task task) {

		return null;
	}

	@RequestMapping("/searchBySubmissionId.do")
	public String searchSubmissionBySubmissionId(int taskId, Model model) {

		return null;
	}

	@RequestMapping("/searchByMemberId.do")
	public String searchSubmissionByMemberId(String memberId, Model model) {

		return null;
	}

	@RequestMapping("/searchAll.do")
	public String searchAllSubmission(Model model) {

		return null;
	}
}
