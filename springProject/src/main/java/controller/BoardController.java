package controller;

import java.io.FileOutputStream;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.BoardDataBean;
import model.InterestDataBean;
import model.LogonDataBean;
import model.MyPageDataBean;
import model.RoomBookDataBean;
import model.RoomDataBean;
import service.MybatisBoardDaoOracle;
import service.MybatisInterestDaoOracle;
import service.MybatisLogonDaoOracle;
import service.RoomDaoMybatis;

@Controller
@RequestMapping("/board/")
public class BoardController {

	private String email;
	private HttpSession session;
	private String boardid;
	private String ip;
	
	@Autowired
	RoomDaoMybatis service;
	@Autowired
	MybatisInterestDaoOracle Interservice;
	@Autowired
	MybatisLogonDaoOracle Logonservice;
	@Autowired
	MybatisBoardDaoOracle Boardservice;

	@ModelAttribute
	public void initProcess(HttpServletRequest request) {
		this.session = request.getSession();

		this.email = (String) session.getAttribute("memEmail");
		if (email == null) {
			email = "null";
		}
		
		ip=request.getRemoteAddr();
		
		if(request.getParameter("boardid")!=null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", 1);
		}
		boardid = (String) session.getAttribute("boardid");
		
		if (boardid==null) {
			boardid = "1";
			session.setAttribute("boardid", "1");
		}
		
		
	}


	//board/write
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String board_writeForm(@ModelAttribute("article") BoardDataBean article) {
		
		article.setEmail(email);
		
		return "content/board/writeUploadForm";
	}
	
	@RequestMapping(value="write" , method=RequestMethod.POST)	
	public String board_writePro(BoardDataBean article) throws Exception {
		
		article.setBoardid(boardid);
		
		article.setIp(ip);
		
		
		
		Boardservice.insertArticle(article);
		
		
		return "redirect:/room/roomcontent?num="+article.getNum();
	}
	
	
	@RequestMapping(value="content")	
	public String board_content(int articlenum, Model model) {
		
		BoardDataBean article = Boardservice.getArticle(articlenum);
		model.addAttribute("article", article);
		
		//글쓴이 프로필사진 가져오기
		LogonDataBean setmember = Logonservice.getUser(article.getEmail());
		model.addAttribute("setmember", setmember);
		
		//내 프로필사진 가져오기
		LogonDataBean setmember1 = Logonservice.getUser(email);
		model.addAttribute("setmember1", setmember1);
		
		//해당 게시물에 좋아요 이미 눌렀는지 확인
		int checknum = 0;
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("articlenum", articlenum);
	    hashMap.put("email", email);
	    checknum = Boardservice.getLikeCheck(hashMap);
		model.addAttribute("checknum", checknum);
		
		
		List<BoardDataBean> commentList = Boardservice.getBoardComments(articlenum);
		model.addAttribute("commentList", commentList);
		List<LogonDataBean> commentMember = new ArrayList<LogonDataBean>();
		for (int i=0; i<commentList.size(); i++) {
			commentMember.add( Logonservice.getUser(commentList.get(i).getEmail()) );
		}
		model.addAttribute("commentMember", commentMember);
		
		
		
		return "content/board/content";
	}
	
	
	@RequestMapping(value="updateForm")
	public String board_updateForm(int articlenum, Model model) {
	
		BoardDataBean  article = Boardservice.getUpdateArticle(articlenum); 
		model.addAttribute("article", article);
		return "content/board/updateForm";
	}

	@RequestMapping(value="updatePro", method=RequestMethod.POST)
	public String board_updatePro(BoardDataBean article, Model model) throws Exception {
	
		
	    
	    int check = Boardservice.updateArticle(article); 
	    model.addAttribute("check", check);
	    model.addAttribute("article", article);
		 
		return "content/board/updatePro";
	}
	
	@RequestMapping(value="deleteForm")
	public String board_deleteForm(int articlenum, Model model) {
		
		model.addAttribute("articlenum", articlenum);
		
		return "content/board/deleteForm";
	}
	
	@RequestMapping(value="commentWrite" , method=RequestMethod.POST)	
	public String board_commentWritePro(BoardDataBean article) throws Exception {
		System.out.println("articlenum 32323232323--->"+article.getArticlenum());
		
		article.setBoardid(boardid);
		
		article.setIp(ip);
		
		
		int articlenum = article.getArticlenum();
		Boardservice.insertArticle(article);
		
		return "redirect:/board/content?articlenum="+articlenum;
	}

	@RequestMapping(value="deletePro", method=RequestMethod.POST)
	public String board_deletePro(int articlenum, String passwd, Model model) throws Exception {
			
		int check = Boardservice.deleteArticle(articlenum, passwd); 
		model.addAttribute("check", check);
		
		return "content/board/updatePro";
	}
	
	
	/* 게시판 좋아요 */
	@ResponseBody
  @RequestMapping(value="/content/like", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String like(int articlenum, HttpSession session){
   
    JSONObject obj = new JSONObject();
 
    ArrayList<String> msgs = new ArrayList<String>();
    HashMap <String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("articlenum", articlenum);
    hashMap.put("email", email);
    
    BoardDataBean article = Boardservice.getArticle(articlenum);
    int likeCnt = article.getLike1(); //게시판의 좋아요 카운트
    int likeCheck = 0; 
    
    if(Boardservice.countbyLike(hashMap)==0){ //email과 articlenum에 해당하는 행이 없을 경우
    	
    	Boardservice.create(hashMap); //insert
    	msgs.add("좋아요!"); //메시지에 좋아요 추가
	    likeCheck++;
	    likeCnt++; //게시판의 좋아요 ++
	    Boardservice.likeCntUp(articlenum);  //게시물의 좋아요 갯수 증가
	      
    }else { //행이 이미 만들어져 있는 경우 -> 1. 0일 때 -> 다시 like하는 경우 2. 1일 때 -> dislike 하는 경우
      
	    likeCheck = Boardservice.getLikeCheck(hashMap);    //좋아요 likecheck 값 가져옴
	    if(likeCheck == 0) { //좋아요 체크 값이 0일 경우
	      msgs.add("좋아요!"); //메시지에 좋아요 추가
	      Boardservice.likeCheck(hashMap); //likecheck값을 1로 바꿈
	      likeCheck++;
	      likeCnt++; //게시판의 좋아요 ++
	      Boardservice.likeCntUp(articlenum);  //게시물의 좋아요 갯수 증가
	    } else {
	      msgs.add("좋아요 취소");
	      Boardservice.likeCheckCancel(hashMap); //0으로 바꿈
	      likeCheck--;
	      likeCnt--;
	      Boardservice.likeCntDown(articlenum);  //게시물의 좋아요 갯수 감소
	    }
	    
    }
    
    
    obj.put("articlenum", article.getArticlenum());
    obj.put("likeCheck", likeCheck); //좋아요 체크 여부 (0 또는 1)
    obj.put("likeCnt", likeCnt); //게시물의 누적 좋아요 수
    obj.put("msg", msgs);
    
    return obj.toJSONString();
  }
	
}
