package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.BoardDataBean;
import model.InterestDataBean;
import model.LogonDataBean;
import model.MyPageDataBean;
import service.MybatisInterestDaoOracle;
import service.MybatisMypageDaoOracle;

@Controller
@RequestMapping("/memberAction/")
public class MemberActionController {

	String memEmail;
	String memEmail2;
	String name;

	@Autowired
	MybatisInterestDaoOracle service;

	@Autowired
	MybatisMypageDaoOracle dbPro;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {

		HttpSession session = request.getSession();

		name = (String) session.getAttribute("name");
		memEmail = (String) session.getAttribute("memEmail"); // 회원 이메일
		memEmail2 = (String) session.getAttribute("memEmail2"); // 이메일 아이디만
		System.out.println(name);
	}

	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String memberAction_loginForm() throws Exception {
		return "content/memberAction/loginForm";
	}

	@RequestMapping(value = "memberLikeForm", method = RequestMethod.GET)
	public String memberAction_memberLikeForm(Model model) throws Exception {
		List<InterestDataBean> interestList = service.allgetTit();
		// System.out.println(interestList.get(0));
		model.addAttribute("interestList", interestList);

		return "content/memberAction/memberLikeForm";
	}

	@RequestMapping(value = "memberLikeSubForm", method = RequestMethod.POST)
	public String memberAction_memberLikeSubForm(@RequestParam("likes") String[] chkbox, Model model) throws Exception {
		System.out.println(chkbox + "!!!!!!!!!!!!!!");
		List li = new ArrayList();
		List lii = new ArrayList();
		for (int i = 0; i < chkbox.length; i++) {
			System.out.println(chkbox[i]);
			String checklist = chkbox[i];
			List<InterestDataBean> lia = service.getLikeSub(checklist);
			lii.add(checklist);
			li.add(lia);
			System.out.println(lia.size() + " ##########");
		}
		System.out.println(li + " $$$$$$$$$$$$$$$$$$$$$");

		model.addAttribute("checkList", lii);
		model.addAttribute("li", li);

		return "content/memberAction/memberLikeSubForm";
	}

	@RequestMapping(value = "memberLikeSubPro", method = RequestMethod.POST)
	public String memberAction_memberLikeSubPro(@RequestParam("likes") String[] chkbox) throws Exception {

		List li = new ArrayList();
		int memberLikecheck = dbPro.getMemberLikeCheck(name);
		System.out.println(memberLikecheck + "--- > memberAction");

		if (memberLikecheck == -1) {
			System.out.println("관심사가 설정되어있지 않을때");
			for (int i = 0; i < chkbox.length; i++) {
				System.out.println(chkbox[i]);
				String checklist = chkbox[i];
				service.insertMemberLike(checklist, name);
			}
		} else {
			System.out.println("왜 안지우노?");
			dbPro.deleteMemberLike(name);
			for (int i = 0; i < chkbox.length; i++) {
				System.out.println("관심사 설정되어있을때");
				System.out.println(chkbox[i]);
				String checklist = chkbox[i];
				service.insertMemberLike2(checklist, name);
			}
		}
		return "redirect:/mypage/mypage2";
	}

	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String memberAction_myPage() throws Exception {

		return "content/memberAction/mypage";
	}

	@RequestMapping(value = "memberInfo", method = RequestMethod.GET)
	public String memberAction_memberInfo(@RequestParam("memid") int memid, Model model) throws Exception {

		if (name == null || name.equals("null")) {
			int sessionCheck = 0;
			model.addAttribute("sessionCheck", sessionCheck);
		} else {
			int sessionCheck = 1;
			model.addAttribute("sessionCheck", sessionCheck);
		}

		// 회원정보
		System.out.println("memid## ->> " + memid);
		model.addAttribute("memid",memid);
		LogonDataBean memberInfo = dbPro.getMemberInfo(memid);
		System.out.println(memberInfo + "#### memberInfo");
		model.addAttribute("memberInfo", memberInfo);

		// 주소
		String[] arr = memberInfo.getAddress().split(" ");
		String setAddress = arr[0];
		model.addAttribute("memberAddress", setAddress);

		// 가입한 모임
		List<MyPageDataBean> memberJoinClass = dbPro.getmemberJoinClass(memid);
		System.out.println("회원이 가입한 모임리스트### ->> " + memberJoinClass);
		int memberJoinClassCnt = dbPro.getmemberJoinClassCnt(memid);
		model.addAttribute("memberJoinClass", memberJoinClass);
		model.addAttribute("memberJoinClassCnt", memberJoinClassCnt);

		// 작성한 글
		List<BoardDataBean> memberBoard = dbPro.getBoardList(memid);
		System.out.println("회원이 작성한 글### ->> " + memberBoard);
		int memberBoardCnt = dbPro.getBoardListCnt(memid);
		model.addAttribute("memberBoardCnt", memberBoardCnt);
		model.addAttribute("memberBoard", memberBoard);

		// 작성한 댓글
		List<BoardDataBean> memberComment = dbPro.getMemberComment(memid);
		System.out.println(memberComment);
		int memberCommentCnt = dbPro.getMemberCommentCnt(memid);
		model.addAttribute("memberCommentCnt", memberCommentCnt);
		model.addAttribute("memberComment", memberComment);

		return "content/memberAction/memberInfoForm";
	}
}
