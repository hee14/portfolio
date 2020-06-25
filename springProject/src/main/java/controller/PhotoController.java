package controller;

import java.io.FileOutputStream;

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
import model.LogonDataBean;
import model.PhotoDataBean;
import service.MybatisBoardDaoOracle;
import service.MybatisLogonDaoOracle;
import service.MybatisPhotoDaoOracle;

@Controller
@RequestMapping("/photo/")
public class PhotoController {

	private String email;
	private HttpSession session;
	private String ip;
	
	@Autowired
	MybatisPhotoDaoOracle photoService;
	@Autowired
	MybatisLogonDaoOracle Logonservice;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request) {
		this.session = request.getSession();

		this.email = (String) session.getAttribute("memEmail");
		if (email == null) {
			email = "null";
		}
		
		ip=request.getRemoteAddr();
			
	}
	
	/* 사진첩 */
	@RequestMapping(value="photoUpload", method=RequestMethod.GET)
	public String photoUploadForm(@ModelAttribute("photo") PhotoDataBean photo) {
		
		photo.setEmail(email);
		
		return "content/photo/photoUploadForm";
		
	}
	
	@RequestMapping(value="photoUpload" , method=RequestMethod.POST)	
	public String photoUploadPro(MultipartHttpServletRequest multipart, PhotoDataBean photo) throws Exception {
		
		List<MultipartFile> fileList = multipart.getFiles("uploadfile");

		for (MultipartFile mf : fileList) {
			String filename = mf.getOriginalFilename();
			System.out.println(filename+"filename@~!!!@!@");
	        if (filename!=null&&!filename.equals("")) {
	           String uploadPath = multipart.getRealPath("/")+"/uploadFile";
	           System.out.println("uploadPath: " + uploadPath);
	           FileCopyUtils.copy(mf.getInputStream(), 
	                 new FileOutputStream(uploadPath+"/"+mf.getOriginalFilename()));
	           System.out.println(uploadPath+"사진 입력 @@@@@@@@@@@@@@@@@");
	           photo.setFilename(filename);
	           photo.setFilesize((int) mf.getSize());
	        } else {
	        	photo.setFilename("");
	        	photo.setFilesize(0);
	        }
	        photo.setIp(ip);
	        photoService.insertPhoto(photo);
		}
		
		return "redirect:/room/roomcontent?num="+photo.getNum();
	}
	
	@RequestMapping(value="photoContent")	
	public String photoContent(int photonum, Model model) {
		
		PhotoDataBean photo = photoService.getPhoto(photonum);
		model.addAttribute("photo", photo);
		
		List<PhotoDataBean> photos = photoService.getPhotoContents(photonum);
		model.addAttribute("photos", photos);
		
		//글쓴이 프로필사진 가져오기
		LogonDataBean setmember = Logonservice.getUser(photo.getEmail());
		model.addAttribute("setmember", setmember);
				
		//내 프로필사진 가져오기
		LogonDataBean setmember1 = Logonservice.getUser(email);
		model.addAttribute("setmember1", setmember1);
	
		//해당 게시물에 좋아요 이미 눌렀는지 확인
		int checknum = 0;
		HashMap <String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("photonum", photonum);
	    hashMap.put("email", email);
	    checknum = photoService.getLikeCheck(hashMap);
	    
		model.addAttribute("checknum", checknum);
		
		List<PhotoDataBean> commentList = photoService.getPhotoComments(photonum);
		model.addAttribute("commentList", commentList);
		
		List<LogonDataBean> commentMember = new ArrayList<LogonDataBean>();
		for (int i=0; i<commentList.size(); i++) {
			commentMember.add( Logonservice.getUser(commentList.get(i).getEmail()) );
		}
		model.addAttribute("commentMember", commentMember);
		
		return "content/photo/photoContent";
	}
	
	@RequestMapping(value="photoContent/write" , method=RequestMethod.GET)	
	public String comment_writePro(PhotoDataBean photo) throws Exception {	
	    photo.setIp(ip);
	    photo.setPasswd(" ");
	    photoService.insertPhoto(photo);
		
	    int photonum = photo.getRef();
	    
		return "redirect:/photo/photoContent?photonum="+photonum;
	}
	
		// 사진첩 like
	  @ResponseBody
	  @RequestMapping(value="/photoContent/like", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	  public String like(int photonum, HttpSession session){
	    JSONObject obj = new JSONObject();
	 
	    ArrayList<String> msgs = new ArrayList<String>();
	    HashMap <String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("photonum", photonum);
	    hashMap.put("email", email);
	    
	    PhotoDataBean photo = photoService.getPhoto(photonum);
	    int likeCnt = photo.getLike1(); //게시판의 좋아요 카운트
	    int likeCheck = 0; 
	    
	    if(photoService.countbyLike(hashMap)==0){ //email과 articlenum에 해당하는 행이 없을 경우
	    	
	    	photoService.create(hashMap); //insert
	    	msgs.add("좋아요!"); //메시지에 좋아요 추가
		    likeCheck++;
		    likeCnt++; //게시판의 좋아요 ++
		    photoService.likeCntUp(photonum);  //게시물의 좋아요 갯수 증가
		      
	    }else { //행이 이미 만들어져 있는 경우 -> 1. 0일 때 -> 다시 like하는 경우 2. 1일 때 -> dislike 하는 경우
	      
		    likeCheck = photoService.getLikeCheck(hashMap);    //좋아요 likecheck 값 가져옴
		    if(likeCheck == 0) { //좋아요 체크 값이 0일 경우
		      msgs.add("좋아요!"); //메시지에 좋아요 추가
		      photoService.likeCheck(hashMap); //likecheck값을 1로 바꿈
		      likeCheck++;
		      likeCnt++; //게시판의 좋아요 ++
		      photoService.likeCntUp(photonum);  //게시물의 좋아요 갯수 증가
		    } else {
		      msgs.add("좋아요 취소");
		      photoService.likeCheckCancel(hashMap); //0으로 바꿈
		      likeCheck--;
		      likeCnt--;
		      photoService.likeCntDown(photonum);  //게시물의 좋아요 갯수 감소
		    }
		    
	    }
	    
	    obj.put("photonum", photo.getPhotonum());
	    obj.put("likeCheck", likeCheck); //좋아요 체크 여부 (0 또는 1)
	    obj.put("likeCnt", likeCnt); //게시물의 누적 좋아요 수
	    obj.put("msg", msgs);
	    
	    return obj.toJSONString();
	  }
	
	
	
}
