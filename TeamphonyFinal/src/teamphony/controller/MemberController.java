package teamphony.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import teamphony.domain.Member;
import teamphony.service.facade.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	private static final int MAX_SIZE = 1024 * 1024 * 20;

	@Autowired
	private MemberService service;

	@RequestMapping(value = "login.do")
	public String login(HttpSession session, String loginId, String loginPw, Model model) {
		Member result = service.findMemberByMemberId(loginId);
		if (!result.getMemberId().isEmpty() && result.getPassword().equals(loginPw)) {
			session.setAttribute("member", result);
			return "redirect:../views/team/teamList.jsp";
		} else {
			model.addAttribute("result", "true");
			return "/common/login";
		}
	}

	@RequestMapping(value = "create.do", method = RequestMethod.POST)
	public String createMember(HttpServletRequest request) {
		Member member = new Member();
		String id = null, alias = null, pw = null, imgPath = null;

		// file data
		String root, savePath;
		root = request.getSession().getServletContext().getRealPath("/");
		savePath = root + "MemberContainer\\";
		File folder;

		// for read file
		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;

		try {

			// multipart form request receive
			// file is generated in directory you mentioned
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, MAX_SIZE, "UTF-8",
					new DefaultFileRenamePolicy());

			// value setting
			id = multipartRequest.getParameter("memberId");
			alias = multipartRequest.getParameter("alias");
			pw = multipartRequest.getParameter("password");
			imgPath = multipartRequest.getFilesystemName("imagePath");

			// folder generate
			folder = new File(savePath + id);
			folder.mkdirs();

			// default image copy
			fin = new FileInputStream(new File(savePath + "default.png"));
			fout = new FileOutputStream(new File(folder.getAbsolutePath() + "\\default.png"));

			while ((read = fin.read(buf, 0, buf.length)) != -1) {
				fout.write(buf, 0, read);
			}
			fin.close();
			fout.close();

			// if imagePath null
			if (imgPath == null) {

				imgPath = folder.getAbsolutePath() + "\\default.png";
				// else
			} else {

				String fileName = imgPath;

				imgPath = savePath + fileName;

				File oldFile = new File(imgPath);
				fin = new FileInputStream(oldFile);
				fout = new FileOutputStream(new File(folder.getAbsolutePath() + "\\" + fileName));

				imgPath = folder.getAbsolutePath() + "\\" + fileName;
				while ((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}

				fin.close();
				fout.close();
				oldFile.delete();
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		// member generate

		member.setMemberId(id);
		member.setPassword(pw);
		member.setAlias(alias);
		member.setImagePath(imgPath);

		service.registerMember(member);

		return "/common/login";
	}

	@RequestMapping("check.do")
	public String checkMember(HttpSession session, String password, String flag) {

		Member member = (Member) session.getAttribute("member");
		System.out.println(password);
		System.out.println(member.getPassword());
		System.out.println(flag);
		if (member.getPassword().equals(password)) {
			return "/member/myPage";
		}
		return null;
	}

	@RequestMapping(value = "revise", method = RequestMethod.POST)
	public String reviseMember(HttpSession session, HttpServletRequest request) {

		Member member = new Member();
		String id = null, alias = null, pw = null, imgPath = null;

		// file data
		String root, savePath;
		root = request.getSession().getServletContext().getRealPath("/");
		savePath = root + "MemberContainer\\";
		File folder;

		// for read file
		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;

		try {

			// multipart form request receive
			// file is generated in directory you mentioned
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, MAX_SIZE, "UTF-8",
					new DefaultFileRenamePolicy());

			// value setting
			alias = multipartRequest.getParameter("alias");
			pw = multipartRequest.getParameter("password");
			imgPath = multipartRequest.getFilesystemName("imagePath");

			// folder generate
			folder = new File(savePath + id);
			folder.mkdirs();

			// default image copy
			fin = new FileInputStream(new File(savePath + "default.png"));
			fout = new FileOutputStream(new File(folder.getAbsolutePath() + "\\default.png"));

			while ((read = fin.read(buf, 0, buf.length)) != -1) {
				fout.write(buf, 0, read);
			}
			fin.close();
			fout.close();

			// if imagePath null
			if (imgPath == null) {

				imgPath = folder.getAbsolutePath() + "\\default.png";
				// else
			} else {

				String fileName = imgPath;

				imgPath = savePath + fileName;

				File oldFile = new File(imgPath);
				fin = new FileInputStream(oldFile);
				fout = new FileOutputStream(new File(folder.getAbsolutePath() + "\\" + fileName));

				imgPath = folder.getAbsolutePath() + "\\" + fileName;
				while ((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}

				fin.close();
				fout.close();
				oldFile.delete();
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		// member generate
		Member login = (Member) session.getAttribute("member");

		System.out.println(pw + " " + alias);
		member.setMemberId(login.getMemberId());
		if (pw.equals("null")) {
			member.setPassword(login.getPassword());
		} else {
			member.setPassword(pw);
		}
		if (pw.equals("null")) {
			member.setPassword(login.getAlias());
		} else {
			member.setAlias(alias);
		}
		if (pw.equals("null")) {
			member.setPassword(login.getPassword());
		} else {
			member.setMemberId(login.getMemberId());
		}

		
		
		member.setImagePath(imgPath);

		service.modifyMember(member);

		return null;
	}

	@RequestMapping(value = "revise.do", method = RequestMethod.GET)
	public String revise(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");

		System.out.println(member.getMemberId());

		Member reviseMember = service.findMemberByMemberId(member.getMemberId());

		model.addAttribute("member", reviseMember);
		System.out.println("ok");
		return "/member/reviseMember";
	}

}
