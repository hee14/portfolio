package service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.BoardDataBean;
import model.BookmemberDataBean;
import model.InterestDataBean;
import model.LogonDataBean;
import model.MyPageDataBean;
import model.RoomBookDataBean;
import model.RoomDataBean;
import mybatis.AbstractRepository;


@Component
public class MybatisMypageDaoOracle{
	private final String namespace = "mybatis.Mypage";

	@Autowired
	public AbstractRepository opendb;
	
	public List<MyPageDataBean> getMyRoomList(String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {	
			String statement = namespace + ".getMyRoomList";
			return sqlSession.selectList(statement, email); 
		}finally {	sqlSession.close();		}
		
	}
	
	//meet_title을 넣으면 -> 해당 class의 num들을 리턴
	public RoomDataBean getHobbyclassNum(int classnum) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getHobbyclassNum";
			return sqlSession.selectOne(statement, classnum);
		} finally {
			sqlSession.close();
		}	
	}
	
	//동아리번호 넣으면 -> 일정 가져오기
	public List<RoomBookDataBean> getClassBook(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getClassBook";
			return sqlSession.selectList(statement, num);
		} finally {
			sqlSession.close();
		}	
	}
	
	public List<InterestDataBean> getMemLike(String name) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			System.out.println(name + "gggggg");
			String statement = namespace + ".getMemLike";
			return sqlSession.selectList(statement, name);
		} finally {
			sqlSession.close();
		}
	}
	
	public int getMemberLikeCheck(String name) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		int memberLikecheck = 0;
		try {
			memberLikecheck = sqlSession.selectOne(namespace + ".getMemberLikeCheck", name);
			if(memberLikecheck > 0) {
				memberLikecheck = 1;
			} else {
				memberLikecheck = -1;
			}
		} finally {
			sqlSession.close();
		}
		return memberLikecheck;
	}
	
	// 회원관심사 삭제
	public void deleteMemberLike(String name) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		System.out.println("여긴 왜 안들어오노~~?");
		System.out.println("delete-->>" + name);
		try {
			sqlSession.insert(namespace + ".deleteMemberLike", name);
			System.out.println("된거여???");
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	
	public List<MyPageDataBean> getMyjoinRoom(String name) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			System.out.println("내가 가입한 모임 리스트");
			String statement = namespace + ".getMyjoinRoom";
			return sqlSession.selectList(statement, name);
		} finally {
			sqlSession.close();
		}
	}
	
	public LogonDataBean getMemberInfo(int memid) {
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try {
	         System.out.println("회원정보 출력");
	         System.out.println("내가 가입한 모임 리스트");
	         String statement = namespace + ".getMemberInfo";
	         return sqlSession.selectOne(statement, memid);
	      } finally {
	         sqlSession.close();
	      }
	   }
	   
	   public List<MyPageDataBean> getmemberJoinClass(int memid) {
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try {
	         System.out.println("회원이 가입한 모임 출력");
	         String statement = namespace + ".getmemberJoinClass";
	         return sqlSession.selectList(statement, memid);
	      } finally {
	         sqlSession.close();
	      }
	   }
	   public int getmemberJoinClassCnt(int memid) {
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try {
	         System.out.println("회원이 가입한 모임 출력 count");
	         String statement = namespace + ".getmemberJoinClassCnt";
	         return sqlSession.selectOne(statement, memid);
	      } finally {
	         sqlSession.close();
	      }
	   }
	   public List<BoardDataBean> getBoardList(int memid) {
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try { 
	         System.out.println("회원이 작성한 글");
	         String statement = namespace + ".getBoardList";
	         return sqlSession.selectList(statement, memid);
	      } finally {
	         sqlSession.close();
	      }
	   }
	   public int getBoardListCnt(int memid) {
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try {
	         System.out.println("회원이 가입한 모임 출력 count");
	         String statement = namespace + ".getBoardListCnt";
	         return sqlSession.selectOne(statement, memid);
	      } finally {
	         sqlSession.close();
	      }
	   }
	   
	   
	   public List<BoardDataBean> getMemberComment(int memid) {
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try {
	         System.out.println("회원이 작성한 댓글");
	         String statement = namespace + ".getMemberComment";
	         return sqlSession.selectList(statement, memid);
	      } finally {
	         sqlSession.close();
	      }
	   }
	   
	   public int getMemberCommentCnt(int memid) {
	      SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try {
	         System.out.println("회원이 가입한 모임 출력 count");
	         String statement = namespace + ".getMemberCommentCnt";
	         return sqlSession.selectOne(statement, memid);
	      } finally {
	         sqlSession.close();
	      }
	   }

	public List<BookmemberDataBean> getbookmem(String name) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
	      try {
	         String statement = namespace + ".getbookmem";
	         return sqlSession.selectList(statement, name);
	      } finally {
	         sqlSession.close();
	      }
	}
	
}





