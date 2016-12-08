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
	
	@Autowired
	private TaskService service;

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
			@RequestParam("attchFile") MultipartFile[] attchFileList, String taskId, String title, String contents,
			String flag) {
		
		Task task = new Task();
		
		task.setTaskId(Integer.parseInt(taskId));
		task.setTitle(title);
		task.setContents(contents);
		task.setFlag(Integer.parseInt(flag));
		
		// 첨부 파일 List파일저장 , TASKFILE_TB 저장
		List<TaskFile> taskFileList = new ArrayList<TaskFile>();
		for (MultipartFile attchFile : attchFileList) {

			
			String filePath = SubmissionController.filePathOnly + File.separator + attchFile.getOriginalFilename();
			TaskFile taskFile = new TaskFile(filePath);

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
	public String eraseSubmission(String taskId, String flag) {
		
		service.removeTask(Integer.parseInt(taskId),Integer.parseInt(flag));

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
// submissionRegister.jsp 에서 flag 값을 준다. 
//현재는 test 중이라서 임의로 flag 값을 부여 하였다
		session.setAttribute("flag", 1);
		int flag = (int)session.getAttribute("flag");
		
		
		List<Task> taskList = service.findAllTaskByFlag(flag);
		model.addAttribute("taskList", taskList);
		
		return "/task/submission/submissionList";
	}
	
	@RequestMapping("/evaluate.do")
	public String evaluateAssignment(String taskId, Model model){
		
		model.addAttribute("task", service.findTaskByTaskId(Integer.parseInt(taskId)));
		return "/task/submission/submissionEvaluate";
	}

	@RequestMapping(value="/evaluate.do", method=RequestMethod.POST)
	public String evaluateAssignment(String taskId, String point, String evaluated,String evaluationCnt ) {
		int id=Integer.parseInt(taskId);
		int poin = Integer.parseInt(point);
		int count = Integer.parseInt(evaluationCnt);
		boolean evalute = Boolean.valueOf(evaluated);
		
		System.out.println("taskId= "+ taskId);
		System.out.println("point= "+ point);
		System.out.println("evaluationCnt= "+ evaluationCnt);
		System.out.println("evaluated= "+ evaluated);
		
		Task task = new Task(id,evalute,count,poin);
		
		System.out.println(task.toString());
		
		
		
		
		
//		service.modifyTask(task);
		
		return "redirect:searchAll.do";
	}
}
