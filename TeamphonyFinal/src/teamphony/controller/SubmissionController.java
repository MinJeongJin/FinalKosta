package teamphony.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sun.security.action.GetBooleanAction;
import teamphony.domain.Member;
import teamphony.domain.Task;
import teamphony.domain.TaskFile;
import teamphony.service.facade.TaskService;
import teamphony.util.MediaUtils;
import teamphony.util.UploadFileUtils;

@Controller
@RequestMapping("submission")
public class SubmissionController {
	
	@Autowired
	private TaskService service;
	private static final Logger logger = LoggerFactory.getLogger(SubmissionController.class);

//	private static final String filePathOnly = "c:/upload";

	
	@RequestMapping("/create.do")
	public String createSubmission(String assignmentTitle, String assignmentId, Model model) {
		
		Task task = service.findTaskByTaskId(Integer.parseInt(assignmentId));
		
		model.addAttribute("task",task);
		
		return "/task/submission/submissionRegister";
	}
	
	@RequestMapping(value = "/create.do", method = RequestMethod.POST)
	public String createSubmission(HttpServletRequest request
									,HttpSession httpSession,
									@RequestParam("attchFile") MultipartFile[] attchFileList
									,String title
									,String contents
									,String flag
									,String assignmentTitle
									,String assignmentId
									,Model model) { 
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		
		System.out.println("filePathOnly1= " +  uploadPath);
		
		httpSession.setAttribute("loginedMember", "aaaa");
		httpSession.setAttribute("teamCode", 9642);
		
		
		Task task = new Task();
		
		task.setTitle(title);
		task.setContents(contents);
		task.setFlag(Integer.parseInt(flag));
		task.setTeamCode((int)httpSession.getAttribute("teamCode"));
		System.out.println("=========submissionController// create.do==============");

		// 첨부 파일 List파일저장 , TASKFILE_TB 저장
		List<TaskFile> taskFileList = new ArrayList<TaskFile>();
		TaskFile taskFile = new TaskFile();
		
		for (MultipartFile file : attchFileList) {
			
			try {
				
				String saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), request);
				System.out.println("===========================================");
				System.out.println("saveName= "+ saveName);
				
				
				taskFile.setFilePath(saveName);
				
				System.out.println("getFilePath= "+ taskFile.getFilePath());
				System.out.println("=========================================");
			
				taskFileList.add(taskFile);
				
				
				task.setTaskFileList(taskFileList);
				
//				System.out.println(task.toString());
				model.addAttribute("saveName",saveName);
				
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
		
		
		
		service.registerTask(task, httpSession, assignmentTitle, Integer.parseInt(assignmentId)); // task_tb 저장
		
		return "redirect:searchAll.do";
	}
	
	private static String uploadFile(String originalName
							,byte[] fileData
							,HttpServletRequest request) throws Exception{
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		
		UUID uid = UUID.randomUUID();
		
		String uploadedFileName = null;
		
		if ( originalName != null ){
			
			String savedName  = uid.toString() + "_" + originalName;
			
			String savedPath = calcPath(uploadPath);
			
			File target = new File(uploadPath+ savedPath, savedName);
			
			FileCopyUtils.copy(fileData, target);
			
			String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
			
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
			
		}
		
		System.out.println("uploadedFileName= "+ uploadedFileName);
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
		
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');		
	}
	
	
	@RequestMapping(value = "uploadAjax.do", method = RequestMethod.GET)
	public void uploadAjax(){
	}
	
	@RequestMapping(value = "uploadAjax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, HttpServletRequest request) throws Exception {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		
		return new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping("displayFile.do")
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception{
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		
		InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    try{
	      
	      String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	      
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      in = new FileInputStream(uploadPath+fileName);
	      
	      if(mType != null){
	        headers.setContentType(mType);
	      }else{
	        
	        fileName = fileName.substring(fileName.indexOf("_")+1);       
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition", "attachment; filename=\""+ 
	          new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	      }

	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
	          headers, 
	          HttpStatus.CREATED);
	    }catch(Exception e){
	      e.printStackTrace();
	      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally{
	      in.close();
	    }
	      return entity;    
	}
	
	
	private static String calcPath(String uploadPath){
		Calendar cal= Calendar.getInstance();
		
		String yearPath =File.separator+ cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath );
		
		logger.info(datePath);
		
		return datePath;
	}
	
	private static void makeDir (String uploadPath, String... paths){
		
		if(new File(paths[paths.length-1]).exists()){
			return;
		}
		
		for(String path : paths){
			File dirPath = new File(uploadPath + path);
			
			if(! dirPath.exists() ){
				dirPath.mkdir();
			}
		}
	}
	

	@RequestMapping("/revise.do")
	public String reviseSubmission(int taskId, Model model) {

		
		
		Task task = service.findTaskByTaskId(taskId);
		model.addAttribute("task", task);

		return "task/submission/submissionModify";
	}

	@RequestMapping(value = "/revise.do", method = RequestMethod.POST)
	public String reviseSubmission(HttpServletRequest request
									,HttpSession session,
									@RequestParam("attchFile") MultipartFile[] attchFileList
									,String taskId
									,String title
									,String contents
									,String flag
									,String assignmentTitle) {
		
		String filePathOnly1 = request.getSession().getServletContext().getRealPath("/");
		
		Task task = new Task();
		
		task.setTaskId(Integer.parseInt(taskId));
		task.setTitle(title);
		task.setContents(contents);
		task.setFlag(Integer.parseInt(flag));
		
		// 첨부 파일 List파일저장 , TASKFILE_TB 저장
		List<TaskFile> taskFileList = new ArrayList<TaskFile>();
		for (MultipartFile attchFile : attchFileList) {

			
			String filePath = filePathOnly1  + attchFile.getOriginalFilename();
			
			if(filePath != filePathOnly1 ){
				
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
			}
		task.setTaskFileList(taskFileList);
		
		service.modifyTask(task,assignmentTitle);
		; // task_tb 저장
		return "redirect:searchAll.do";
	}

	@RequestMapping("/erase.do")
	public String eraseSubmission(String taskId, String flag) {
		
		System.out.println("taskId= "+ Integer.parseInt(taskId)+ "\n" + "flag= "+ Integer.parseInt(flag));
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
		int flag = (int)session.getAttribute("flag");
		
		List<Task> taskList = service.findAllTaskByFlag(flag, (int)session.getAttribute("teamCode"));
		
		model.addAttribute("taskList", taskList);
		
		return "/task/submission/submissionList";
	}
	
	@RequestMapping("/evaluate.do")
	public String evaluateAssignment(String taskId, Model model){
		
		model.addAttribute("task", service.findTaskByTaskId(Integer.parseInt(taskId)));
		return "/task/submission/submissionEvaluate";
	}

	@RequestMapping(value="/evaluate.do", method=RequestMethod.POST)
	public String evaluateAssignment(String taskId
									,String point
									,String evaluated
									,String evaluationCnt
									,String assignmentTitle) {
		
		Task task = service.findTaskByTaskId(Integer.parseInt(taskId));
		
		task.setPoint(Integer.parseInt(point));
		task.setEvaluationCnt(Integer.parseInt(evaluationCnt));
		
		System.out.println("parse = "+Integer.parseInt(evaluated));
		task.setEvaluated(Integer.parseInt(evaluated));
		
		
		System.out.println("===========evaluate===========");
		System.out.println("getEvaluated"+task.getEvaluated());
		System.out.println("=============================");
		service.modifyTask(task, assignmentTitle);
		
		return "redirect:searchAll.do";
	}
}
