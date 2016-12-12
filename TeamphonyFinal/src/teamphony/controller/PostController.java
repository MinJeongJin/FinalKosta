package teamphony.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import teamphony.domain.Member;
import teamphony.domain.Post;
import teamphony.service.facade.MemberService;
import teamphony.service.facade.PostService;

@Controller
@RequestMapping("post")
public class PostController {

	@Autowired
	private PostService postService;
	@Autowired
	private MemberService memberService;

	private static final String filePath = "C:\\fileUploadTest\\";

	@RequestMapping(value = "create.do", method = RequestMethod.POST)
	public String createPost(HttpSession session, HttpServletRequest request, String contents, String videoLink) {

		Post post = new Post(contents,memberService.findMemberByMemberId(((Member) session.getAttribute("member")).getMemberId()),(int) session.getAttribute("teamCode"));

		if (videoLink == null || videoLink.isEmpty()) {
			post.setVideoLink("pass");
		} else {
			videoLink= videoLink.substring(17);
			System.out.println(videoLink);
			post.setVideoLink(videoLink);
		}

		// Request에서 첨부파일을 받기위해 캐스팅을 함
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		// 첨부 파일을 꺼내는 작업
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		// 필요한 변수 선언
		MultipartFile multipartFile = null;
		String originalFileName = null;

		// 파일을 저장할 폴더 설정
		File file = new File(filePath + post.getMember().getMemberId() + "\\");
		// 폴더가 없으면 폴더 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		// 첨부 파일 찾기
		if (iterator.hasNext()) {
			// 첨부파일 불러오기
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			// 첨부파일 존재 여부 확인
			if (multipartFile.isEmpty() == false) {
				// 파일이름 저장
				originalFileName = multipartFile.getOriginalFilename();

				// 폴더구조를 폴더안에 아이디로 구분 해야하기 때문에 폴더구조 생성
				file = new File(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				post.setFilePath(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				System.out.println(post.getFilePath());
				try {
					// 파일 전송
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {

			}
		}else{
			post.setFilePath("pass");
		}
		// 첨부 파일 찾기
		if (iterator.hasNext()) {
			// 첨부파일 불러오기
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			// 첨부파일 존재 여부 확인
			if (multipartFile.isEmpty() == false) {
				// 파일이름 저장
				originalFileName = multipartFile.getOriginalFilename();

				// 폴더구조를 폴더안에 아이디로 구분 해야하기 때문에 폴더구조 생성
				file = new File(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				post.setImagePath(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				System.out.println(post.getImagePath());
				try {
					// 파일 전송
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {

			}
		}
		if(post.getFilePath()==null||post.getFilePath().isEmpty()){
			post.setFilePath("pass");
		}
		if(post.getImagePath()==null||post.getImagePath().isEmpty()){
			post.setImagePath("pass");
		}
		postService.registerPost(post);

		return "redirect:/post/list.do";
	}

	@RequestMapping("list.do")
	public String searchAllPost(HttpSession session, Model model) {
		int teamCode = (int) session.getAttribute("teamCode");
		List<Post> listPost = postService.findAllPost(teamCode);

		model.addAttribute("listPost", listPost);
		return "post/postList2";
	}
	
	@RequestMapping("detail.do")
	public String searchPostByPostId(Model model, int postId){
		
		Post post = postService.findPostByPostId(postId);
		
		model.addAttribute("post", post);
		
		return "post/postDetail2";
	}
	
	@RequestMapping("revise.do")
	public String revisePost(HttpSession session, HttpServletRequest request, String contents, String videoLink, int postId){
		
		Post post = new Post(contents,memberService.findMemberByMemberId(((Member) session.getAttribute("member")).getMemberId()),(int) session.getAttribute("teamCode"), postId);

		System.out.println(videoLink);
		
		if (videoLink == null || videoLink.length()==0) {
			post.setVideoLink("pass");
		} else {
			videoLink= videoLink.substring(17);
			System.out.println(videoLink);
			post.setVideoLink(videoLink);
		}

		// Request에서 첨부파일을 받기위해 캐스팅을 함
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		// 첨부 파일을 꺼내는 작업
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		// 필요한 변수 선언
		MultipartFile multipartFile = null;
		String originalFileName = null;

		// 파일을 저장할 폴더 설정
		File file = new File(filePath + post.getMember().getMemberId() + "\\");
		// 폴더가 없으면 폴더 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		// 첨부 파일 찾기
		if (iterator.hasNext()) {
			// 첨부파일 불러오기
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			// 첨부파일 존재 여부 확인
			if (multipartFile.isEmpty() == false) {
				// 파일이름 저장
				originalFileName = multipartFile.getOriginalFilename();

				// 폴더구조를 폴더안에 아이디로 구분 해야하기 때문에 폴더구조 생성
				file = new File(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				post.setFilePath(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				System.out.println(post.getFilePath());
				try {
					// 파일 전송
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {

			}
		}else{
			post.setFilePath("pass");
		}
		// 첨부 파일 찾기
		if (iterator.hasNext()) {
			// 첨부파일 불러오기
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			// 첨부파일 존재 여부 확인
			if (multipartFile.isEmpty() == false) {
				// 파일이름 저장
				originalFileName = multipartFile.getOriginalFilename();

				// 폴더구조를 폴더안에 아이디로 구분 해야하기 때문에 폴더구조 생성
				file = new File(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				post.setImagePath(filePath + post.getMember().getMemberId() + "\\" + originalFileName);
				System.out.println(post.getImagePath());
				try {
					// 파일 전송
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {

			}
		}
		if(post.getFilePath()==null||post.getFilePath().isEmpty()){
			post.setFilePath("pass");
		}
		if(post.getImagePath()==null||post.getImagePath().isEmpty()){
			post.setImagePath("pass");
		}
		postService.modifyPost(post);
		
		return "redirect:/post/detail.do?postId="+postId;
	}
	
	@RequestMapping("delete.do")
	public String erasePost(int postId, HttpSession session){
		postService.removePost(postId);
		int teamCode = (int)session.getAttribute("teamCode");
		return "redirect:/post/list.do?teamId="+teamCode;
	}
	
	@RequestMapping("searchBycontents.do")
	public String searchPostByContents(String search, Model model){
		List<Post> list = postService.findPostByContents(search);
		model.addAttribute("listPost", list);
		return "/post/postList2"; 
	}

}