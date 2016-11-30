package teamphony.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import teamphony.domain.Member;
import teamphony.domain.Task;
import teamphony.domain.TaskFile;
import teamphony.service.facade.TaskService;

@Controller
@RequestMapping("submission")
public class SubmissionController {
	private static final int MAX_SIZE = 1024 * 1024 * 20;
	@Autowired
	private TaskService service;
	private File folder;

	private static final String filePathOnly = "c:/uploadTemp";

	@RequestMapping(value = "/create.do", method = RequestMethod.POST)
	public String createSubmission(HttpServletRequest request, HttpSession session,
			@RequestParam("attchFile") MultipartFile[] attchFileList, String title, String contents, String flag) { // attchFile

		int flagNo = Integer.parseInt(flag);
		System.out.println("flagNo= " + flagNo);

		Task task = new Task();
		task.setTitle(title);
		task.setContents(contents);
		task.setFlag(flagNo);

		System.out.println("title = " + task.getTitle());
		System.out.println(("contens= " + task.getContents()));
		System.out.println(("flag= " + task.getFlag()));

		// 첨부 파일 List파일저장 , TASKFILE_TB 저장
		List<TaskFile> taskFileList = new ArrayList<TaskFile>();
		for (MultipartFile attchFile : attchFileList) {
			int taskId = task.getTaskId();
			String filePath = SubmissionController.filePathOnly + File.separator + attchFile.getOriginalFilename();
			TaskFile taskFile = new TaskFile(filePath);

			System.out.println("저장 경로 =" + filePath);
			File f = new File(filePath);
			try {
				attchFile.transferTo(f);
				taskFileList.add(taskFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		task.setTaskFileList(taskFileList);
		service.registerTask(task); // task_tb 저장

		return "redirect:searchAll.do";

	}

	@RequestMapping("/revise.do")
	public String reviseSubmission(int taskId, Model model) {

		Task task = service.findTaskByTaskId(taskId);
		model.addAttribute("task", task);

		return "task/submission/submissionModify";
	}

	@RequestMapping(value = "/revise.do", method = RequestMethod.POST)
	public String reviseSubmission(HttpServletRequest request, HttpSession session,
			@RequestParam("attchFile") MultipartFile[] attchFileList,int taskId ,String title, String contents, String flag) {

		int flagNo = Integer.parseInt(flag);
		System.out.println("flagNo= " + flagNo);

		Task task = new Task();
		task.setTaskId(taskId);
		task.setTitle(title);
		task.setContents(contents);
		task.setFlag(flagNo);
		System.out.println("taskId = " + task.getTaskId());
		System.out.println("title = " + task.getTitle());
		System.out.println(("contens= " + task.getContents()));
		System.out.println(("flag= " + task.getFlag()));

		// 첨부 파일 List파일저장 , TASKFILE_TB 저장
		List<TaskFile> taskFileList = new ArrayList<TaskFile>();
		for (MultipartFile attchFile : attchFileList) {
			
			//int taskId = task.getTaskId();
			String filePath = SubmissionController.filePathOnly + File.separator + attchFile.getOriginalFilename();
			TaskFile taskFile = new TaskFile(filePath);

			System.out.println("저장 경로 =" + filePath);
			File f = new File(filePath);
			
			
			//방금 파일 업로드 안했잖아.. 그래서 그런거 아이야?
			//설길이 컨트롤러 저장 안했어
			try {
				attchFile.transferTo(f);
				taskFileList.add(taskFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		task.setTaskFileList(taskFileList);
		service.modifyTask(task);; // task_tb 저장

		return "redirect:searchAll.do";
	}

	@RequestMapping("/erase.do")
	public String eraseSubmission(String taskId) {
		int taskIdNo = Integer.parseInt(taskId);
		taskIdNo = 62;
		service.removeTask(taskIdNo);

		return "redirect:searchAll.do";
	}

	@RequestMapping("/searchByTaskId.do")
	public String searchSubmissionByTaskId(int taskId, Model model) {

		Task task = service.findTaskByTaskId(taskId);

		model.addAttribute("task", task);

		return "/task/submission/submissionDetail";
	}

	@RequestMapping("/searchByMemberId.do")
	public String searchSubmissionByMemberId(String memberId, Model model) {

		return null;
	}

	@RequestMapping("/searchAll.do")
	public String searchAllSubmission(Model model) {
		List<Task> taskList = service.findAllTask();

		model.addAttribute("taskList", taskList);
		return "/task/submission/submissionList";
	}
}
