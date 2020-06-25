package controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.BannerDataBean;
import model.BoardDataBean;
import model.InterestDataBean;
import model.LogonDataBean;
import model.MessageDataBean;
import model.NoticeDataBean;
import model.RoomDataBean;
import service.MasterDaoOracle;
import service.MybatisInterestDaoOracle;
import service.MybatisLogonDaoOracle;
import service.MybatisMypageDaoOracle;
import service.RoomDaoMybatis;

@Controller
@RequestMapping("/content/")
public class MainController {

	private String name;

	@Autowired
	RoomDaoMybatis service;

	@Autowired
	MasterDaoOracle open;

	@Autowired
	MybatisInterestDaoOracle sv;

	@Autowired
	MybatisMypageDaoOracle dbPro;

	@Autowired
	MybatisLogonDaoOracle Logonservice;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		HttpSession session = request.getSession();

		this.name = (String) session.getAttribute("name");
		System.out.println("회원 닉네임: " + name);
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	   public String content_main(HttpServletRequest request, Model m) throws Exception {
	      HttpSession session = request.getSession();
	      List<RoomDataBean> member = service.getRoomList();
	      m.addAttribute("li", member);
	      
	      System.out.println("카테고리값: " + request.getParameter("categorie"));
	      
	      int pageSize = 9;
	      String pageNum = request.getParameter("pageNum");
	      if (pageNum == null || pageNum.equals("")) {
	         pageNum = "1";
	      }
	      int currentPage = 0;

	      try {
	         currentPage = Integer.parseInt(request.getParameter("pageNum"));
	         session.setAttribute("pageNum", currentPage);
	      } catch (Exception e) {
	         if (session.getAttribute("pageNum") == null) {
	            session.setAttribute("pageNum", 1);
	         }
	      }

	      currentPage = (int) session.getAttribute("pageNum");
	      int startRow = (currentPage - 1) * pageSize + 1;
	      int endRow = (startRow + pageSize) - 1;
	      int count;
	 
	      List<RoomDataBean> articleli;
	      List<InterestDataBean> cateli = sv.getTit();	      
	      if(request.getParameter("categorie")==null) {
	         articleli = service.getArticles(startRow, endRow);
	        count = service.getArticleCount();
	      } else {
	         articleli = service.getCateArticles(startRow, endRow,Integer.parseInt(request.getParameter("categorie")));
	         count = service.getCateArticleCount(Integer.parseInt(request.getParameter("categorie")));
	      }
	         
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      int number = count - (currentPage - 1) * pageSize;
	      int bottomLine = 3;
	      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	      int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
	      int endPage = startPage + bottomLine - 1;
	      if (endPage > pageCount)
	         endPage = pageCount;   
	      
	      request.setAttribute("pageNum", request.getParameter("pageNum"));
	      request.setAttribute("categorie", request.getParameter("categorie"));
	      request.setAttribute("currentPage", currentPage);
	      request.setAttribute("startRow", startRow);
	      request.setAttribute("endRow", endRow);
	      request.setAttribute("count", count);
	      request.setAttribute("pageSize", pageSize);
	      request.setAttribute("number", number);
	      request.setAttribute("bottomLine", bottomLine);
	      request.setAttribute("startPage", startPage);
	      request.setAttribute("endPage", endPage);
	      request.setAttribute("pageCount", pageCount);
	      request.setAttribute("articleli", articleli);
	      request.setAttribute("cateli", cateli);
	   
	      List<BannerDataBean> banner = open.getBanner();
	      m.addAttribute("bannerlist",banner);
	      
	      return "content/main";
	   } 

	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String content_search(@RequestParam("keyword") String keyword, HttpServletRequest request, Model m)
			throws Exception {
		
		HttpSession session = request.getSession();
		List<RoomDataBean> member = service.getRoomList();
		m.addAttribute("li", member);

		System.out.println("카테고리값: " + request.getParameter("categorie"));

		int pageSize = 9;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		int currentPage = 0;

		try {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {
			if (session.getAttribute("pageNum") == null) {
				session.setAttribute("pageNum", 1);
			}
		}

		currentPage = (int) session.getAttribute("pageNum");
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = (startRow + pageSize) - 1;

		// 검색 기능
		String keyword2 = keyword.trim();
		int searchListCheck = 0;

		if (keyword2 == null || keyword2.equals("")) {
			searchListCheck = 0;
			m.addAttribute("searchListCheck", searchListCheck);
		} else {
			List<RoomDataBean> searchList = service.getSearchList(startRow, endRow, keyword2);
			m.addAttribute("searchList", searchList);
			searchListCheck = service.getSearchListCheck(keyword2);
			m.addAttribute("searchListCheck", searchListCheck);
		}
		
		// 추천 기능
		int memberLikecheck = dbPro.getMemberLikeCheck(name);
		List<InterestDataBean> setMemInter = dbPro.getMemLike(name);
		m.addAttribute("keyword", keyword);
		m.addAttribute("setMemInter", setMemInter);
		m.addAttribute("memberLikecheck", memberLikecheck);
		int count = service.getSearchListCheck(keyword2);
		List<RoomDataBean> articleli;
		List<InterestDataBean> cateli = sv.getTit();
		articleli = service.getCateArticleOne();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int number = count - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		request.setAttribute("pageNum", request.getParameter("pageNum"));
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("articleli", articleli);
		request.setAttribute("cateli", cateli);
		
		return "content/search";
		
	}

	@RequestMapping(value = "noticeli", method = RequestMethod.GET)
	public String noticeli(Model m){
		
		List<NoticeDataBean> noticlist = service.getnoticeli();
		m.addAttribute("noticeli",noticlist);
		
		return "content/noticelist";
	}
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(Model m,int notice_id){
		
		NoticeDataBean notice = service.getnotice(notice_id);
		m.addAttribute("notice",notice);
		
		return "content/noticecontent";
	}
}