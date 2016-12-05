package teamphony.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	private static final int MAX_SIZE = 1024 * 1024 * 20;
	@Autowired
	private TaskService service;
	private File folder;

	private static final String filePathOnly = "c:/upload";

	@RequestMapping(value = "/create.do", method = RequestMethod.POST)
	public String createSubmission(HttpServletRequest request, HttpSession session,
			@RequestParam("attchFile") MultipartFile[] attchFileList, String title, String contents, String flag) { // attchFile
		
		System.out.println("flag= " + flag);
		
		Task task = new Task();
		
		task.setTitle(title);
		task.setContents(contents);
		task.setFlag(Integer.parseInt(flag));

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
		
		session.setAttribute("flag",1);
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
			@RequestParam("attchFile") MultipartFile[] attchFileList, int taskId, String title, String contents,
			String flag) {

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
		service.modifyTask(task);
		; // task_tb 저장

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
	public String searchSubmissionByTaskId(String taskId, Model model) {
		
		Task task = service.findTaskByTaskId(Integer.parseInt(taskId));
		
		model.addAttribute("task", task);
		
		return "/task/submission/submissionDetail";
	}

	@RequestMapping("/searchByMemberId.do")
	public String searchSubmissionByMemberId(String memberId, Model model) {

		return null;
	}

	@RequestMapping("/searchAll.do")
	public String searchAllSubmission(HttpSession session, Model model) {
		int flag = (int)session.getAttribute("flag");
		
		List<Task> taskList = service.findAllTaskByFlag(flag);
		model.addAttribute("taskList", taskList);
		
		return "/task/submission/submissionList";
	}

	@RequestMapping(value="/evaluate.do", method=RequestMethod.POST)
	public String evaluateAssignment(String point, String taskId) {
		
		Task task = new Task();
		
		task= service.findTaskByTaskId(Integer.parseInt(taskId));
		task.setPoint(Integer.parseInt(point));
		
		service.modifyTask(task);
		
		return "redirect:searchByTaskId.do";
	}
}
