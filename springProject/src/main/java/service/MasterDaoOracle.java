package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Agetotalcount;
import model.BannerDataBean;
import model.CountDataBean;
import model.InterestDataBean;
import model.LogonDataBean;
import model.MyPageDataBean;
import model.NoticeDataBean;
import model.RoomBookDataBean;
import model.RoomDataBean;
import mybatis.AbstractRepository;

@Component
public class MasterDaoOracle {

	private final String namespace = "mybatis.master";

	@Autowired
	AbstractRepository opendb;

	// 전체관심사 tit 가져오기
	public List<RoomBookDataBean> classbook() {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".classbook";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}

	public List<MyPageDataBean> classjoin() {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".classjoin";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}

	public List<RoomDataBean> hobbyclass() {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".hobbyclass";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}

	public List<LogonDataBean> member() {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".member";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}
	
	public List<RoomDataBean> classlist() {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".hobbyclass";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}

	}
	
	public List counting() {

		List coun = new ArrayList<>();
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".usercounting";
			coun.add(sqlSession.selectOne(statement));
			statement = namespace + ".mancounting";
			coun.add(sqlSession.selectOne(statement));
			statement = namespace + ".girlcounting";
			coun.add(sqlSession.selectOne(statement));
			statement = namespace + ".classcounting";
			coun.add(sqlSession.selectOne(statement));
			
			
			return coun;
		} finally {
			sqlSession.close();
		}

	}

	public void insertBanner(BannerDataBean banner) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".insertBanner";
			sqlSession.insert(statement,banner);
			sqlSession.commit();

		} finally {
			sqlSession.close();
		}

	}

	public List<BannerDataBean> getBanner() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getBanner";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}
	}
	
	public void memberdelete(int memno) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".memberdelete";
			sqlSession.delete(statement,memno);
			sqlSession.commit();
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

	public void bannerdelete(int memno) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".bannerdelete";
			sqlSession.delete(statement,memno);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		
	}

	public List<Agetotalcount> agetotal() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".agetotal";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}
	}

	public List<NoticeDataBean> getNotice() {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getNotice";
			return sqlSession.selectList(statement);

		} finally {
			sqlSession.close();
		}
	}

	public void insertNotice(NoticeDataBean notice) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".insertNotice";
			sqlSession.insert(statement,notice);
			sqlSession.commit();

		} finally {
			sqlSession.close();
		}
		
	}

	public void noticedelete(int notice_id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".noticedelete";
			sqlSession.delete(statement,notice_id);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		
		
	}
}
