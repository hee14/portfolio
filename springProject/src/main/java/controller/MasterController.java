package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Agetotalcount;
import model.BannerDataBean;
import model.CountDataBean;
import model.NoticeDataBean;
import model.RoomDataBean;
import service.MasterDaoOracle;
import service.RoomDaoMybatis;

@Controller
@RequestMapping("/ms/")
public class MasterController {

	private HttpSession session;
	
	@Autowired
	MasterDaoOracle open;
	@Autowired
	RoomDaoMybatis service;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		session = request.getSession();

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String name = (String) session.getAttribute("name");
		if(name == "null" || name.equals("")){
			
			
		}
		System.out.println(name);
	}
	
	@RequestMapping(value="super", method=RequestMethod.GET)
	public String ms_super(Model m){
		if(session.getAttribute("name").equals("admin")){
			List classbook = open.classbook();
			List classjoin = open.classjoin();
			List hobbyclass = open.hobbyclass();
			List member = open.member();

			m.addAttribute("classbook",classbook);
			m.addAttribute("classjoin",classjoin);
			m.addAttribute("hobbyclass",hobbyclass);
			m.addAttribute("member",member);
			
			return "ms/super";
		}
		
		return "ms/superexception";
	}
	
	@RequestMapping(value="member", method=RequestMethod.GET)
	public String ms_member(Model m){
		if(session.getAttribute("name").equals("admin")){
			List member = open.member();

			m.addAttribute("member",member);
			
			return "ms/member";
		}
		
		return "ms/superexception";
	}
	
	@RequestMapping(value="class", method=RequestMethod.GET)
	public String ms_class(Model m){
		if(session.getAttribute("name").equals("admin")){
		
			List classlist = open.classlist();

			m.addAttribute("classlist",classlist);
			
			return "ms/class";
		}
		
		return "ms/superexception";
	}
	
	@RequestMapping(value="adminmain", method=RequestMethod.GET)
	public String ms_adminmain(Model m){
		
		if(session.getAttribute("name").equals("admin")){
			List<CountDataBean> counting = open.counting();
			List<Agetotalcount> agecnt = open.agetotal();
			List<RoomDataBean> article = service.getArticles(1, 5);
			
			m.addAttribute("article",article);
			m.addAttribute("list", counting);
			m.addAttribute("agecnt",agecnt);
			
			return "ms/adminmain";
		}
		
		return "ms/superexception";
	}
	
	
	@ResponseBody
	@RequestMapping(value="insertbanner", method=RequestMethod.POST)
	public String ms_insertbanner(Model m,MultipartHttpServletRequest mutipart) throws FileNotFoundException, IOException{
		
		
		BannerDataBean banner = new BannerDataBean();
		
		if(session.getAttribute("name").equals("admin")){
			
			MultipartFile multi = mutipart.getFile("uploadfile");
			String filename = multi.getOriginalFilename();

			if (filename != null && !filename.equals("")) {
				String uploadPath = mutipart.getRealPath("/") + "/uploadFile";
				System.out.println(uploadPath);

				FileCopyUtils.copy(multi.getInputStream(),
						new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));

				banner.setBannerImg(filename);

			} else {
				banner.setBannerImg("");
			}
			
			System.out.println("에라몰겠다");
			banner.setBannerStatus("1");
			open.insertBanner(banner);
			System.out.println("에라몰겠다");
			return "ok";
		}
		
		return "no";
	}
	
	
	@RequestMapping(value="banner", method=RequestMethod.GET)
	public String ms_banner(Model m){
		
		
		
		if(session.getAttribute("name").equals("admin")){
			
			List<BannerDataBean> banner = open.getBanner();
			m.addAttribute("bannerlist",banner);
			
			return "ms/banner";
		}
		
		return "ms/superexception";
	}
	
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String ms_notice(Model m){
		
		
		
		if(session.getAttribute("name").equals("admin")){
			
			List<NoticeDataBean> notice = open.getNotice();
			m.addAttribute("noticelist",notice);
			
			return "ms/notice";
		}
		
		return "ms/superexception";
	}
	
	@RequestMapping(value="notice", method=RequestMethod.POST)
	public String ms_noticepro(Model m,NoticeDataBean notice){
		
		System.out.println(notice.getTitle()+"@title");
		System.out.println(notice.getContent()+"@content");
		notice.setReadcount(0);
		open.insertNotice(notice);
		
		
		return "redirect:/ms/notice";
	}
	
	@ResponseBody
	@RequestMapping(value="memberDeleteAjax", method=RequestMethod.POST)
	public String memberDeleteAjax(int memno){
		
		System.out.println(memno);
		open.memberdelete(memno);
		
		return "OK";
	}
	

	@ResponseBody
	@RequestMapping(value="classDeleteAjax", method=RequestMethod.POST)
	public String classDeleteAjax(int memno){
		
		System.out.println(memno);
		open.classdelete(memno);
		
		
		
		return "OK";
	}
	

	@ResponseBody
	@RequestMapping(value="bannerDeleteAjax", method=RequestMethod.POST)
	public String bannerDeleteAjax(int memno){
		
		System.out.println(memno);
		open.bannerdelete(memno);
		
		return "OK";
	}
	
	@ResponseBody
	@RequestMapping(value="noticeDeleteAjax", method=RequestMethod.POST)
	public String noticeDeleteAjax(int notice_id){
		
		System.out.println(notice_id);
		open.noticedelete(notice_id);
		
		return "OK";
	}
	
}
