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
		Member member = new Member(loginId, loginPw);
		// boolean result = service.checkMember(member);
		if (loginId.equals("admin")) {
			session.setAttribute("loginId", loginId);
			return "/team/teamList";
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
		
		String imagePath = imgPath.substring(104,imgPath.length());
		member.setImagePath(imagePath);
		
		service.registerMember(member);

		return "/common/login";
	}
}
