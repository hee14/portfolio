package controller;


import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import custom.CustomBindingListener;
import custom.SessionChecker;
import dao.BindingListener;
import dao.LogonDao;
import model.LogonDataBean;
import service.MybatisLogonDaoOracle;


@Controller
@RequestMapping("/member/")
public class MemberController{
	
	HttpSession session;
	
	@Autowired
	MybatisLogonDaoOracle manager;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request) {
		session=request.getSession();
	}
	
	@RequestMapping(value = "loginPro", method = RequestMethod.POST)
	public String member_loginPro(String email, String password, Model model) throws Exception {
		
		int idx = email.indexOf("@");
		String memEmail2 = email.substring(0, idx);
		System.out.println(memEmail2);
		System.out.println(memEmail2);
		System.out.println(password);
		System.out.println(email);
		int check = manager.userCheck(email, password);
		LogonDataBean profileimg = manager.getUser(email);
		
		if (check == 1) { // 회원이 존재하면, 회원정보 세션값에 저장
			String name = manager.findName(email);
			session.setAttribute("name", name);
			session.setAttribute("memEmail", email);
			session.setAttribute("profileImg", profileimg.getProfileImg());
			session.setAttribute("listener", new CustomBindingListener());

		}
		model.addAttribute("check", check);
		
		return "member/loginPro";
	}
	
	
	@RequestMapping(value = "logoutPro", method = RequestMethod.GET)
	public String member_logoutPro() throws Exception {
		session.invalidate();
		return "member/logoutForm";
	}
	
	@RequestMapping(value = "signUpForm", method = RequestMethod.GET)
	public String member_signUpForm() throws Exception {
		return "member/signUpForm";
	}
	
	@RequestMapping(value = "signUpPro", method = RequestMethod.POST)
	public String member_signUpPro(MultipartHttpServletRequest multipart, LogonDataBean member) throws Exception {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(member + "signUpProMember--------------------------------->");
		MultipartFile multi = multipart.getFile("profileImg2");
		String filename = multi.getOriginalFilename();
		System.out.println(filename + "filename ---------------------->>>>");
		if(filename != null && !filename.equals("")) {
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
			
			member.setProfileImg(filename);
		} else {
			member.setProfileImg("");
		}
		
		System.out.println(member  + "──────────────────> memberInsert");
		manager.insertMember(member);
		session.setAttribute("name", member.getName());
		session.setAttribute("memEmail", member.getEmail());
		session.setAttribute("listener", new CustomBindingListener());
		session.setAttribute("profileImg", member.getProfileImg());
			
		return "redirect:/memberAction/memberLikeForm";
	}

}
