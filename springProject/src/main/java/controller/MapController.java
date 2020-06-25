package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.MapDataBean;
import service.MybatisMapDaoOracle;

@Controller
@RequestMapping("/map/")
public class MapController {
		
	private String email;
	private String name;
	
	@Autowired
	MybatisMapDaoOracle mapservice;
	
	@ModelAttribute
	public void initProcess(HttpServletRequest request) {
		HttpSession session = request.getSession();
			email = (String)session.getAttribute("memEmail");
			name = (String)session.getAttribute("name");
	}
		
	// 일정 모임 한눈에 보기 뷰단 뿌려주기
	@RequestMapping(value = "mapView", method = RequestMethod.GET)
	public String mapView(Model model) throws Exception {
		System.out.println("지도 API");
		System.out.println(name + "######");
		List<MapDataBean> MemjoinClass = mapservice.getMemjoinClass(name); // 현재 세션값의 회원의 가입한 모임 리스트
		System.out.println(" #### MemjoinClass ---- > " + MemjoinClass);
		
		model.addAttribute("MemjoinClass", MemjoinClass);
		
		return "content/map/mapView";
	}
	
}
