package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.BoardDataBean;
import model.BookmemberDataBean;
import model.LogonDataBean;
import model.MyPageDataBean;
import model.NoticeDataBean;
import model.RoomBookDataBean;
import model.RoomDataBean;
import mybatis.AbstractRepository;
import oracle.net.aso.b;

@Component
public class RoomDaoMybatis {

	private final String namespace = "mybatis.Room";

	@Autowired
	AbstractRepository opendb;

	public int getArticleCount() {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleCount";

			return sqlSession.selectOne(statement);

		} finally {
			sqlSession.close();
		}
	}
	
	public int getCateArticleCount(int like_ca) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getCateArticleCount";

			return sqlSession.selectOne(statement, like_ca);

		} finally {
			sqlSession.close();
		}
	}
	
	public List<RoomDataBean> getArticles(int startRow, int endRow) {

		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticles";
			return sqlSession.selectList(statement, map);

		} finally {
			sqlSession.close();
		}
	}

	public int RoomInsert(RoomDataBean Bean) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		int number = 0;
		int num = 0;
		try {
			String statement = namespace + ".getArticleNum";
			number = sqlSession.selectOne(statement);
			Bean.setNum(number);
			statement = namespace + ".insert_max";
			sqlSession.insert(statement, Bean);
			sqlSession.commit();

			String statement2 = namespace + ".getNum";
			System.out.println(Bean.getHost() + "###><");
			num = sqlSession.selectOne(statement2, Bean.getHost());
			return num;
		} finally {
			sqlSession.close();
		}
	}

	public List<RoomDataBean> getRoomList() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleList";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}

	public List<RoomDataBean> getRoomListName() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getRoomListName";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}

	public RoomDataBean getRoom(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getArticle";
			return (RoomDataBean) sqlSession.selectOne(statement, num);

		} finally {
			sqlSession.close();
		}
	}

	public void RoomJoin(RoomDataBean Bean, String email, int i) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		MyPageDataBean member = new MyPageDataBean();
		LogonDataBean logon;
		Map map = new HashMap<>();
		map.put("i", i);
		map.put("email", email);
		int number = 0;
		try {

			if (Bean.getNum() == 0) {
				String statement = namespace + ".getArticleNum";
				number = sqlSession.selectOne(statement);
				Bean.setNum(number);
			}

			String statement = namespace + ".getMember";
			logon = sqlSession.selectOne(statement, email);
			member.setLike_ca(Bean.getLike_ca());
			member.setMeet_title(Bean.getMeet_title());
			member.setEmail(email);
			member.setClassnum(Bean.getNum());
			member.setMembercnt(Bean.getMembercnt());
			member.setStatus(i);
			member.setBirthday(logon.getBirthday());
			member.setGender(logon.getGender());
			member.setName(logon.getName());

			statement = namespace + ".roomJoin";
			sqlSession.insert(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

	}

	public int check(int num, String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap<>();
		map.put("num", num);
		map.put("email", email);
		try {
			String statement = namespace + ".check";
			return sqlSession.selectOne(statement, map);

		} finally {
			sqlSession.close();
		}
	}

	public int joincheck(int num, String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap<>();
		map.put("num", num);
		map.put("email", email);
		int jo;
		try {

			String statement = namespace + ".joincheckcnt";
			jo = sqlSession.selectOne(statement, map);

			if (jo >= 1) {
				statement = namespace + ".joincheck";
				return sqlSession.selectOne(statement, map);
			}
			return jo;
		} finally {
			sqlSession.close();
		}
	}

	public void RoomOut(String email, int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap<>();
		map.put("num", num);
		map.put("email", email);
		try {
			String statement = namespace + ".roomOut";
			sqlSession.delete(statement, map);
			sqlSession.commit();

		} finally {
			sqlSession.close();
		}

	}

	public void InsertJoin(RoomBookDataBean Book) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".roomBook";
			sqlSession.insert(statement, Book);
			sqlSession.commit();

		} finally {
			sqlSession.close();
		}

	}

	public List<RoomBookDataBean> getBookList(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getBookList";
			return sqlSession.selectList(statement, num);

		} finally {
			sqlSession.close();
		}
	}

	// 가입한 모임리스트
	public List<MyPageDataBean> getMemberList(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getMemberList";
			return sqlSession.selectList(statement, num);
		} finally {
			sqlSession.close();
		}
	}

	public List getmynum(String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getmynum";
			return sqlSession.selectList(statement, email);

		} finally {
			sqlSession.close();
		}
	}

	///////////////////////////////////////////////////////////////////////////

	public int getMemberListCnt(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			System.out.println(num + "getgetget");
			String statement = namespace + ".getMemberListCnt";
			return sqlSession.selectOne(statement, num);
		} finally {
			sqlSession.close();
		}
	}

	public int jangCheck(String name, int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap<>();
		map.put("name", name);
		map.put("num", num);
		int jangCheck = 0;
		try {
			jangCheck = sqlSession.selectOne(namespace + ".jangCheck", map);
			return jangCheck;
		} finally {
			sqlSession.close();
		}
	}

	// 해당 모임의 일정이 있는지 없는지
	public int bookCheck(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".bookCheck", num);
		} finally {
			sqlSession.close();
		}
	}

	// room 카테고리 이미지
	public String getRoomCateImg(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getRoomCateImg";
			return sqlSession.selectOne(statement, num);
		} finally {
			sqlSession.close();
		}
	}

	public boolean checkcnt(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkcnt";
			int now = sqlSession.selectOne(statement, num);
			statement = namespace + ".checkmemcnt";
			int roomcnt = sqlSession.selectOne(statement, num);
			System.out.println(now + ":" + roomcnt);
			if (now < roomcnt) {
				return true;
			} else {

				return false;
			}

		} finally {
			sqlSession.close();
		}

	}

	public int checkmem(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkcnt";
			return sqlSession.selectOne(statement, num);

		} finally {
			sqlSession.close();
		}

	}

	public List<RoomDataBean> getCateArticles(int startRow, int endRow, int like_ca) {

		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("like_ca", like_ca);

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getCateArticles";
			return sqlSession.selectList(statement, map);

		} finally {
			sqlSession.close();
		}

	}
	//추가 대표추천
	public List<RoomDataBean> getCateArticleOne() {

		

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getCateArticleOne";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}

	// public void insertBook(BookmemberDataBean bookmem) {
	// SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	// try {
	// String statement = namespace + ".insertBook";
	// sqlSession.insert(statement, bookmem);
	// sqlSession.commit();
	//
	// } finally {
	// sqlSession.close();
	// }
	//
	// }

	public boolean checkbookcnt(BookmemberDataBean bookmem) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".bookmembercnt";
			int i = sqlSession.selectOne(statement, bookmem);
			statement = namespace + ".checkbookcnt";
			int j = sqlSession.selectOne(statement, bookmem);

			if (i > j) {
				statement = namespace + ".bookmemberJoin";
				sqlSession.insert(statement, bookmem);
				sqlSession.commit();
				return true;
			} else {

				return false;
			}

		} finally {
			sqlSession.close();
		}
	}

	public int countbook(int book_id, int class_id) {

		BookmemberDataBean bmd = new BookmemberDataBean();
		bmd.setBook_id(book_id);
		bmd.setClass_id(class_id);

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkbookcnt";
			return sqlSession.selectOne(statement, bmd);

		} finally {
			sqlSession.close();
		}

	}

	public Integer bookmemcheck(int book_id, int class_id, String name) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		BookmemberDataBean bmd = new BookmemberDataBean();
		bmd.setBook_id(book_id);
		bmd.setClass_id(class_id);
		bmd.setName(name);
		
		try {
			String statement = namespace + ".bookmemcheck";
			return sqlSession.selectOne(statement, bmd);

		} finally {
			sqlSession.close();
		}
	}


	public void deletebookmem(BookmemberDataBean bookmem) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".deletebookmem";
			sqlSession.delete(statement, bookmem);
			sqlSession.commit();
			

		} finally {
			sqlSession.close();
		}	
	}

	// 검색기능 -> 04월 20일 오후_야자 추가사항
	public List<RoomDataBean> getSearchList(int startRow, int endRow, String keyword2) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("keyword2", keyword2);
		try { 
			String statement = namespace + ".getSearchList";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public int getSearchListCheck(String keyword2) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getSearchListCheck";
			return sqlSession.selectOne(statement, keyword2);
		} finally {
			sqlSession.close();
		}
	}

public void memberkick(String name, String classnum) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap<>();
		map.put("name", name);
		map.put("classnum", classnum);
		try {
			String statement = namespace + ".memberkick";
			sqlSession.delete(statement, map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}	
		
	}

	public void memberstat(String name, String classnum, int statu) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap<>();
		map.put("name", name);
		map.put("classnum", classnum);
		map.put("status", statu);
		try {
			String statement = namespace + ".memberstat";
			sqlSession.update(statement, map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}	
		
	}

	public List<BookmemberDataBean> getbookmembers() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try { 
			String statement = namespace + ".getbookmembers";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}
	
	public void classdelete(int memno) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".classdelete";
			sqlSession.delete(statement,memno);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		
	}

	public List<NoticeDataBean> getnoticeli() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try { 
			String statement = namespace + ".getnoticeli";
			return sqlSession.selectList(statement);
		} finally {
			sqlSession.close();
		}
	}

	public NoticeDataBean getnotice(int notice_id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".readcntup";
			sqlSession.update(statement, notice_id);
			sqlSession.commit();
			
			statement = namespace + ".getnotice";
			return sqlSession.selectOne(statement, notice_id);
		} finally {
			sqlSession.close();
		}
	}

	public void bookmemberout(String name, int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		Map map = new HashMap<>();
		map.put("name", name);
		map.put("class_id",num);
		try {
			String statement = namespace + ".memcheckmem";
			int ch = sqlSession.selectOne(statement,map);
			if(ch==0){
				return;
			}else{
			statement = namespace + ".bookmemberout";
			sqlSession.delete(statement,map);
			sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
		
	}

}