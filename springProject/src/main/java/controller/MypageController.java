package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MypageDao;
import model.BookmemberDataBean;
import model.InterestDataBean;
import model.LogonDataBean;
import model.MyPageDataBean;
import model.NoteDataBean;
import model.RoomBookDataBean;
import model.RoomDataBean;
import service.MybatisInterestDaoOracle;
import service.MybatisLogonDaoOracle;
import service.MybatisMypageDaoOracle;
import service.MybatisNoteDaoOracle;
import service.RoomDaoMybatis;


@Controller
@RequestMapping("/mypage/")
public class MypageController{

	private String email;
	private String name;
	
	@Autowired
	MybatisMypageDaoOracle dbPro;
	
	@Autowired
	RoomDaoMybatis Roomservice;
	
	@Autowired
	MybatisLogonDaoOracle Logonservice;
	
	@Autowired
	MybatisInterestDaoOracle Interservice;
	
	@Autowired
	MybatisNoteDaoOracle noteservice;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request) {
		HttpSession session = request.getSession();
			
			this.email = (String) session.getAttribute("memEmail");
			this.name = (String) session.getAttribute("name");
		
		
	}
	
	@RequestMapping(value="mypage2", method = RequestMethod.GET)
	public String Room_myPages(@ModelAttribute("member") LogonDataBean member, Model model) throws Exception {
		System.out.println(member + "--> member");
		System.out.println(name + "--> name");
		System.out.println(email + "--> email");
		member.setName(name);
		int memberLikecheck = dbPro.getMemberLikeCheck(name);
		System.out.println(memberLikecheck + " ---> 마이페이지 memberLike개수체크");
		LogonDataBean setmember = Logonservice.getUser(email);
		System.out.println(setmember + "--> setmember");
		List<InterestDataBean> setMemInter = dbPro.getMemLike(name);
		System.out.println(setMemInter + "--> setMemInter");
		
		String address = setmember.getAddress(); // 주소
		String[] arr = address.split(" ");
		String setAddress = arr[0];
		System.out.println(setmember.getBirthday());
		
		model.addAttribute("setAddress", setAddress);
		model.addAttribute("setMemInter", setMemInter);
		model.addAttribute("setmember", setmember);
		model.addAttribute("memberLikecheck", memberLikecheck);
		
		return "content/mypage/mypage2";
	}
	
	@RequestMapping(value = "myRoomList", method = RequestMethod.GET)
	public String Room_myRoomList(Model model) throws ServletException, IOException {
		
		List<MyPageDataBean> myinfo = dbPro.getMyRoomList(email);
		System.out.println(myinfo + "내가 가입한 모임");
		model.addAttribute("myinfo", myinfo);
		return "content/mypage/myRoomList";
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET, produces="application/text; charset=utf8")
	public String Room_myPage(HttpServletRequest request,Model m) throws ServletException, IOException{
		HttpSession session = request.getSession();
		MypageDao service = MypageDao.getInstance();
		String email = (String) session.getAttribute("memEmail");
		System.out.println(email);
		
		List<MyPageDataBean> li = dbPro.getMyRoomList(email);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@"+li.size());
		List<Integer> nowcnt = service.getCount(email);
		List<RoomDataBean> roomli = new ArrayList<RoomDataBean>();
		
//		for(int i=0; i<li.size(); i++) {
//			System.out.println( li.get(i).getClassnum() +" : roomli.get(i).getNum() ");
//			roomli.add(dbPro.getHobbyclassNum(li.get(i).getClassnum())); //객체 받아서 roomli에 저장
//		
//		}
//		List<RoomBookDataBean> roombookli = new ArrayList<RoomBookDataBean>();
		List<List> rooaa = new ArrayList<List>();
		System.out.println(name+"@@@@name 확인");
		List<BookmemberDataBean> bookli = dbPro.getbookmem(name);
		
		
		
		for(int i=0; i<li.size(); i++) {
			System.out.println( li.get(i).getClassnum() +" : roomli.get(i).getNum() ");
			rooaa.add(dbPro.getClassBook(li.get(i).getClassnum() )) ;
		}
		m.addAttribute("nowcnt", nowcnt);
		m.addAttribute("roaa",rooaa);
		m.addAttribute("bookli",bookli);
		System.out.println(bookli+"@@@@@ bookilid");
		
		return "content/mypage/mypage";
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.POST, produces="application/text; charset=utf8")
	public String Room_myPagepost(HttpServletRequest request,Model m) throws ServletException, IOException{
		HttpSession session = request.getSession();
		MypageDao service = MypageDao.getInstance();
		String email = (String) session.getAttribute("memEmail");
		System.out.println(email);
		
		List<MyPageDataBean> li = dbPro.getMyRoomList(email);
		List<Integer> nowcnt = service.getCount(email);
		List<RoomDataBean> roomli = new ArrayList<RoomDataBean>();
		
		for(int i=0; i<li.size(); i++) {
			roomli.add(dbPro.getHobbyclassNum(li.get(i).getClassnum())); //객체 받아서 roomli에 저장
		
		}
		List<RoomBookDataBean> roombookli = new ArrayList<RoomBookDataBean>();
		List<List> rooaa = new ArrayList<List>();
		List<BookmemberDataBean> bookli = dbPro.getbookmem(name);
		
		for(int i=0; i<roomli.size(); i++) {
			System.out.println(roomli.get(i).getNum());
			rooaa.add(dbPro.getClassBook( roomli.get(i).getNum() )) ;
		}
		System.out.println("@@@@@@@@@roomlis"+rooaa.size());
		m.addAttribute("nowcnt", nowcnt);
		m.addAttribute("roombookli", roombookli);
		m.addAttribute("roaa",rooaa);
		m.addAttribute("bookli",bookli);
		System.out.println(bookli);
		
		return "content/mypage/mypage";
	}
	
	// 쪽지 보내기 팝업창
	@RequestMapping(value="popupnoteWrite", method = RequestMethod.GET)
	public String Mypage_popupnoteWrite(@RequestParam("memid") int noteRecieverMemid, Model model) throws Exception {
		System.out.println("마이페이지 팝업창 로드");
		System.out.println("### " + noteRecieverMemid);
		model.addAttribute("noteRecieverMemid", noteRecieverMemid);
		model.addAttribute("name", name);
		return "pop/popupnoteWrite";
	}
	
	// 쪽지 보내기 _ 데이터 삽입
	@ResponseBody
	@RequestMapping(value="popupnoteWrite", method=RequestMethod.POST)
	public String popupnoteWrite(@RequestParam("notereceiver") int notereceiver, NoteDataBean note) throws Exception {
		System.out.println("─────────쪽지 보내기─────────");
		System.out.println("받는사람 memid : " + notereceiver);
		note.setNotesender(name); // 보내는 사람 (현재세션 값) 세팅완료
		String notereceiver2 = noteservice.getNoteReceiverName(notereceiver);
		note.setNotereceiver(notereceiver2); // 받는 사람 세팅완료
		note.setStatus(0);
		noteservice.insertNote(note);
		
		return "OK";
	}
	// @RequestParam("noteid") String noteid 
	// 쪽지 답장 보내기 _ 데이터 삽입
		@ResponseBody
		@RequestMapping(value="popupnoteWrite2", method=RequestMethod.POST)
		public String popupnoteWrite2(@RequestParam("notereceiver") String notereceiver, NoteDataBean note) throws Exception {
			System.out.println("─────────쪽지 보내기─────────");
			System.out.println("답장 ~>  : " + note);
			note.setNotesender(name); // 보내는 사람 (현재세션 값) 세팅완료
			note.setStatus(0); // 읽지 않았으니 0
			note.setRethatid(note.getNoteid()); // 답장의 원본 글 id 세팅
			
			// 해당 글 noteid 가져오기
			noteservice.insertNote2(note);
		
			return "OK";
		}
	
	// 마이페이지 _ 메시지함
	@RequestMapping(value="popupnote", method = RequestMethod.GET)
	public String Mypage_popupnote(Model model) throws Exception {
		System.out.println("########### 마이페이지 메시지함 팝업창 로드 ###########");
		List<NoteDataBean> myNoteSendList = noteservice.getMyNoteSendList(name); // 내가 보낸 편지 가져오기
		List<NoteDataBean> myNoteReceiveList = noteservice.getMyNoteReceiveList(name);
		System.out.println("내가 보낸 쪽지함 : " + myNoteSendList);
		System.out.println("내가 받은 쪽지함 : " + myNoteReceiveList);
		model.addAttribute("myNoteSendList", myNoteSendList);
		model.addAttribute("myNoteReceiveList", myNoteReceiveList);
		
		return "pop/popupnote";
	}
	
	// 쪽지 상태 변경 -> 읽음
	@RequestMapping(value="popupnoteRead", method=RequestMethod.POST)
	public @ResponseBody String popupnoteRead(@RequestParam("noteid") String noteid) throws Exception {
		System.out.println("─────────쪽지 상태 변경 -> 읽음으로 ─────────");
		System.out.println(noteid);
		noteservice.updateMyNoteStatus(noteid);
		return "OK";
	}
	

}
