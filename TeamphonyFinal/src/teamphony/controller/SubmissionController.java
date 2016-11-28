package teamphony.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

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
import teamphony.service.facade.TaskService;

@Controller
@RequestMapping("submission")
public class SubmissionController {

	@Autowired
	private TaskService service;

	@RequestMapping(value = "/create.do", method = RequestMethod.POST)
	public String createSubmission(@RequestParam("attchFile") MultipartFile[] attchFileList, Task task) { // attchFile
		
		
		System.out.println("=======================");
		String path = "c:/uploadTemp";
		
		for(MultipartFile attchFile : attchFileList){
			System.out.println(attchFile.getName()); //input name 
			System.out.println(attchFile.getOriginalFilename()); //파일명
			String saveFileName = path + File.separator + attchFile.getOriginalFilename();
			System.out.println("저장 경로 : " + saveFileName);
			
			File f = new File(saveFileName);
			try {
				attchFile.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		return "";
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
