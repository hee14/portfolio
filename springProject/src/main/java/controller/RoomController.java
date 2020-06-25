package controller;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.BoardDataBean;
import model.BookmemberDataBean;
import model.InterestDataBean;
import model.LogonDataBean;
import model.MessageDataBean;
import model.MyPageDataBean;
import model.RoomBookDataBean;
import model.RoomDataBean;
import service.MybatisBoardDaoOracle;
import service.MybatisChatDao;
import service.MybatisInterestDaoOracle;
import service.MybatisLogonDaoOracle;
import service.MybatisPhotoDaoOracle;
import service.RoomDaoMybatis;

@Controller
@RequestMapping("/room/")
public class RoomController {

	private String email;
	private HttpSession session;
	private String boardid;
	private String ip;
	private String name;

	@Autowired
	RoomDaoMybatis service;
	@Autowired
	MybatisInterestDaoOracle Interservice;
	@Autowired
	MybatisLogonDaoOracle Logonservice;
	@Autowired
	MybatisBoardDaoOracle Boardservice;
	@Autowired
	MybatisChatDao chatservice;
	@Autowired
	MybatisPhotoDaoOracle photoService;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {
		this.session = request.getSession();

		this.email = (String) session.getAttribute("memEmail");
		this.name = (String) session.getAttribute("name");

		ip = request.getRemoteAddr();
		if (request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", 0);

		}
		boardid = (String) session.getAttribute("boardid");

		if (boardid == null) {
			boardid = "1";
			session.setAttribute("boardid", "1");

		}
	}

	@RequestMapping(value = "roomWriteForm", method = RequestMethod.GET)
	public String Room_writeFrom(Model m, @ModelAttribute("rm") RoomDataBean rm) {

		if (email == null || email.equals("null")) {
			return "redirect:/memberAction/loginForm";
		}
		LogonDataBean member = Logonservice.getUser(email);
		List<InterestDataBean> li = Interservice.allgetTit();
		List<InterestDataBean> lli = Interservice.allsubgetTit();

		m.addAttribute("member", member);
		m.addAttribute("li", li);
		m.addAttribute("size", li.size());
		m.addAttribute("lli", lli);

		return "content/room/roomWriteForm";
	}

	@RequestMapping(value = "roomWritePro", method = RequestMethod.POST)
	public String Room_writePro(MultipartHttpServletRequest mutipart, RoomDataBean room) throws Exception {

		MultipartFile multi = mutipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();

		if (filename != null && !filename.equals("")) {
			String uploadPath = mutipart.getRealPath("/") + "/uploadFile";
			System.out.println(uploadPath);

			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));

			room.setPhoto(filename);

		} else {
			room.setPhoto("");
		}
		int num = service.RoomInsert(room);
		service.RoomJoin(room, email, 1);

		return "redirect:/room/roomcontent?num=" + num;
	}

	@RequestMapping(value = "roomList", method = RequestMethod.GET)
	public String Room_List(Model m) {

		List<RoomDataBean> member = service.getRoomList();
		// InterestDao Inservice = InterestDao.getInstance();
		// List<InterestDataBean> li = Inservice.allgetTit();

		m.addAttribute("li", member);

		return "content/room/roomlist";
	}

	@RequestMapping(value = "roomcontent", method = RequestMethod.GET)
	public String Room_Content(int num, Model model, HttpServletRequest request) {

		RoomDataBean room = service.getRoom(num);
		System.out.println("check@@@@@@@@@@@@@@@@@");

		// InterestDao Inservice = InterestDao.getInstance();
		// List<InterestDataBean> li = Inservice.allgetTit();
		List<RoomBookDataBean> li = service.getBookList(num);
		List<MyPageDataBean> memberList = service.getMemberList(num);
		int check = service.check(num, email);
		int joincheck = service.joincheck(num, email);
		int nowcnt = service.checkmem(num);
		System.out.println("check@@@@@@@@@@@@@@@@@");

		if (joincheck == 1 || joincheck == 2) {
			model.addAttribute("joincheck", joincheck);
		}

		List<Integer> bookmemlich = new ArrayList<>();
		;
		
		SimpleDateFormat set = new SimpleDateFormat("yyyy-MM-dd");
		Date inDate   = new Date();
		System.out.println(set.format(inDate)+"오늘날=");
		
		model.addAttribute("set",set);
		model.addAttribute("now", set.format(inDate));
		model.addAttribute("check", check);
		model.addAttribute("room", room);
		model.addAttribute("nowcnt", nowcnt);
		model.addAttribute("li", li);
		List<Integer> bookmemli = new ArrayList<>();
		System.out.println("check@@@@@@@@@@@@@@@@@");

		for (RoomBookDataBean roombook : li) {
			int i = roombook.getBook_id();
			int j = roombook.getNum();
			bookmemli.add(service.countbook(i, j));

			bookmemlich.add(service.bookmemcheck(i, j, name));

		}

		model.addAttribute("bookmemcheck", bookmemlich);
		model.addAttribute("bookmemli", bookmemli);
		model.addAttribute("joinMemberCnt", room.getMembercnt());
		model.addAttribute("memberList", memberList);

		List<BookmemberDataBean> bookmemberlist = service.getbookmembers();

		model.addAttribute("bookmemberlist", bookmemberlist);

		int jangCheck = service.jangCheck(name, num);
		int bookCheck = service.bookCheck(num);

		model.addAttribute("bookCheck", bookCheck);
		model.addAttribute("jangCheck", jangCheck);
		String roomCateImg = service.getRoomCateImg(num);
		model.addAttribute("roomCateImg", roomCateImg);

		int pageSize = 5;
		int currentPage = 1;

		System.out.println("session의 페이지넘==>" + session.getAttribute("pageNum"));

		if (session.getAttribute("pageNum") == null) {
			session.setAttribute("pageNum", 1);

		}
		try {

			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {
		}
		currentPage = (int) session.getAttribute("pageNum");
		String boardid = (String) session.getAttribute("boardid");

		int count = Boardservice.getArticleCount(num);

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		if (currentPage > pageCount) {
			currentPage = pageCount;
			session.setAttribute("pageNum", currentPage);

		}

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		List<BoardDataBean> articleli = Boardservice.getArticles(startRow, endRow, num);

		System.out.println(articleli.size() + "사이즈 확인@@@@@@@@@@@");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int number = count - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		String chch = "0";
		String boardCheck = request.getParameter("pageNum");
		System.out.println(boardCheck + "boardCheck");
		if (boardCheck == null) {
			boardCheck = "0";
			System.out.println(boardCheck + "boardCheck가 null일 경우 '0'저장");
		}

		List<Integer> checknum = new ArrayList<Integer>();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		for (int z = 0; z < articleli.size(); z++) {
			int nums = articleli.get(z).getArticlenum();
			hashMap.put("articlenum", nums);
			hashMap.put("email", email);
			int checkehck = Boardservice.getLikeCheck(hashMap);
			checknum.add(checkehck);
		}

		model.addAttribute("checknum", checknum);
		model.addAttribute("chch", chch);
		model.addAttribute("boardCheck", boardCheck);
		model.addAttribute("pageNum", request.getParameter("pageNum"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("bottomLine", bottomLine);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("articleli", articleli);
		model.addAttribute("email", email);

		System.out.println(currentPage + "/" + startRow + "/" + endRow + "/" + pageSize + "/" + number + "/"
				+ bottomLine + "/" + startPage + "/" + endPage + "/" + pageCount);
		for (int i = 0; i < articleli.size(); i++) {
			System.out.println(articleli.get(i));
		}

		int class_id = num;
		List<MessageDataBean> msli = chatservice.isRoom(class_id);
		for (MessageDataBean messageDataBean : msli) {
			System.out.println(messageDataBean.getMessage_content());
		}

		model.addAttribute("msli", msli);

		List<BoardDataBean> photoList = photoService.getPhotos(num);
		model.addAttribute("photoList", photoList);

		List<Integer> commentCountList = new ArrayList<Integer>();
		for (int z = 0; z < articleli.size(); z++) {
			int articlenum1 = articleli.get(z).getArticlenum();
			System.out.println("articlenum1::::" + articlenum1);
			int commentCount = Boardservice.getCommentCount(articlenum1);
			System.out.println("commentCount:::::" + commentCount);
			commentCountList.add(commentCount);
		}

		model.addAttribute("commentCountList", commentCountList);

		return "content/room/roomcontent";
	}

	@RequestMapping(value = "roomcontent", method = RequestMethod.POST)
	public String Room_Content1(int num, Model m) {

		RoomDataBean room = service.getRoom(num);
		// InterestDao Inservice = InterestDao.getInstance();
		// List<InterestDataBean> li = Inservice.allgetTit();

		int check = service.check(num, email);

		m.addAttribute("room", room);
		m.addAttribute("check", check);

		return "content/room/roomcontent";
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String regi(HttpServletRequest request) {
		HttpSession session = request.getSession();

		RoomDataBean room = new RoomDataBean();
		System.out.println(email + "@@@@@email@@@@@@@@@@@@@");
		if (email == null || email.equals("null") || email == "null") {
			return "redirect:/memberAction/loginForm";
		}

		int num = Integer.parseInt(request.getParameter("num"));
		// boolean countmax = service.checkcnt(num);
		// if(!countmax){
		//
		//
		// return "redirect:/room/fullmem?num=" + num;
		//
		// }

		room.setNum(Integer.parseInt(request.getParameter("num")));
		room.setLike_ca(Integer.parseInt(request.getParameter("like_ca")));
		room.setMembercnt(Integer.parseInt(request.getParameter("membercnt")));
		room.setMeet_title(request.getParameter("meet_title"));
		int check = Integer.parseInt(request.getParameter("check"));

		if (check == 0) {
			service.RoomJoin(room, email, 3);
		} else {
			service.RoomOut(email, num);
			service.bookmemberout(name,num);
		}

		return "redirect:/room/roomcontent?num=" + num;
	}

	@RequestMapping(value = "fullmem", method = RequestMethod.GET)
	public String fullmem(Model m, int num) {

		m.addAttribute("num", num);
		return "content/room/fullcnt";
	}

	@ResponseBody
	@RequestMapping(value = "checkmem", method = RequestMethod.GET)
	public String checkmem(int num) {
		System.out.println(num + "숫자 뭐니 ?");
		boolean countmax = service.checkcnt(num);
		if (!countmax) {

			return "max";

		}
		return "empty";

	}

	@RequestMapping(value = "roombook", method = RequestMethod.GET)
	public String Room_roomjoin(Model m, @ModelAttribute("num") int num) {

		List mynum = service.getmynum(email);

		m.addAttribute("mynum", mynum);

		return "content/room/roombook";
	}

	@RequestMapping(value = "roombookPro", method = RequestMethod.POST)
	public String Room_roombookPro(RoomBookDataBean Book) {

		service.InsertJoin(Book);

		return "redirect:/room/roomcontent?num=" + Book.getNum();
	}

	@RequestMapping(value = "management", method = RequestMethod.GET)
	public String Room_management(int num, Model m) {

		List<MyPageDataBean> memberList = service.getMemberList(num);

		m.addAttribute("memberList", memberList);

		return "content/room/roommanagement";
	}

	@RequestMapping(value = "getout", method = RequestMethod.POST)
	public String Room_getout(int num, String email) {

		int check = service.check(num, email);

		return "content/room/roomcontent";
	}

	@ResponseBody
	@RequestMapping(value = "/roomcontent/like", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String like(int articlenum, HttpSession session) {

		JSONObject obj = new JSONObject();

		ArrayList<String> msgs = new ArrayList<String>();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("articlenum", articlenum);
		hashMap.put("email", email);

		BoardDataBean article = Boardservice.getArticle(articlenum);
		int likeCnt = article.getLike1(); // 게시판의 좋아요 카운트
		int likeCheck = 0;

		if (Boardservice.countbyLike(hashMap) == 0) { // email과 articlenum에 해당하는
														// 행이 없을 경우

			Boardservice.create(hashMap); // insert
			msgs.add("좋아요!"); // 메시지에 좋아요 추가
			likeCheck++;
			likeCnt++; // 게시판의 좋아요 ++
			Boardservice.likeCntUp(articlenum); // 게시물의 좋아요 갯수 증가

		} else { // 행이 이미 만들어져 있는 경우 -> 1. 0일 때 -> 다시 like하는 경우 2. 1일 때 ->
					// dislike 하는 경우

			likeCheck = Boardservice.getLikeCheck(hashMap); // 좋아요 likecheck 값
															// 가져옴
			if (likeCheck == 0) { // 좋아요 체크 값이 0일 경우
				msgs.add("좋아요!"); // 메시지에 좋아요 추가
				Boardservice.likeCheck(hashMap); // likecheck값을 1로 바꿈
				likeCheck++;
				likeCnt++; // 게시판의 좋아요 ++
				Boardservice.likeCntUp(articlenum); // 게시물의 좋아요 갯수 증가
			} else {
				msgs.add("좋아요 취소");
				Boardservice.likeCheckCancel(hashMap); // 0으로 바꿈
				likeCheck--;
				likeCnt--;
				Boardservice.likeCntDown(articlenum); // 게시물의 좋아요 갯수 감소
			}

		}

		obj.put("articlenum", article.getArticlenum());
		obj.put("likeCheck", likeCheck); // 좋아요 체크 여부 (0 또는 1)
		obj.put("likeCnt", likeCnt); // 게시물의 누적 좋아요 수
		obj.put("msg", msgs);

		return obj.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "insertbook", method = RequestMethod.GET)
	public String insertbook(BookmemberDataBean bookmem) {
		boolean check = service.checkbookcnt(bookmem);
		if (check) {
			return "ok";
		} else {
			return "no";
		}

	}

	@ResponseBody
	@RequestMapping(value = "deletebook", method = RequestMethod.GET)
	public String deletebook(BookmemberDataBean bookmem) {

		service.deletebookmem(bookmem);

		return "ok";
	}

	@ResponseBody
	@RequestMapping(value = "memberkick", method = RequestMethod.POST)
	public void memberkick(@RequestParam(value = "kicklist[]") List<String> kicklist) {
		for (String memkk : kicklist) {
			String[] list = memkk.split(":");
			System.out.println(list[0] + "+" + list[1]);
			service.memberkick(list[0], list[1]);
		}
		System.out.println("멤버퀵");

	}

	@ResponseBody
	@RequestMapping(value = "memberstat", method = RequestMethod.POST)
	public void memberstat(@RequestParam(value = "statlist[]") List<String> statlist,
			@RequestParam(value = "statu") int statu) {
		for (String memkk : statlist) {
			String[] list = memkk.split(":");
			System.out.println(list[0] + "+" + list[1] + "@@+" + (statu == 2 ? "운영진" : "일반회원"));
			service.memberstat(list[0], list[1], statu);
		}
		System.out.println("memberstat");

	}

}
