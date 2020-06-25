package service;

import java.util.ArrayList;
import java.util.HashMap;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.BoardDataBean;
import model.LikeDataBean;
import model.PhotoDataBean;
import mybatis.AbstractRepository;

@Component
public class MybatisPhotoDaoOracle {

	private final String namespace = "mybatis.Photo";
	
	@Autowired
	public AbstractRepository opendb;
	
	/* 사진첩 */
	public void insertPhoto(PhotoDataBean photo) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		Map map = new HashMap();
		int photonum = photo.getPhotonum();
		System.out.println("photonum::"+photonum);
		int num = photo.getNum();
		System.out.println("num::"+num);
		int ref = photo.getRef();
		int re_step = photo.getRe_step();
		int re_level = photo.getRe_level();
		int number = 1;
		
		try {
			number = sqlSession.selectOne(namespace + ".insert_max"); //글번호 현재까지 최대값+1
			System.out.println("number --->"+number);
			if (photonum != 0) { 
				map.put("ref", ref);
				map.put("re_step", re_step);
				re_step = re_step + 1;
				re_level = re_level + 1;
				String statement = namespace + ".insert_update";
				sqlSession.update(statement, map);
				sqlSession.commit();
			} else {
				ref = number; //새글이면 ref는 maxnum
				re_step=0;
				re_level=0;	
			}
			
			photo.setPhotonum(number);
			photo.setNum(num);
			photo.setRef(ref);
			photo.setRe_level(re_level);
			photo.setRe_step(re_step);
			System.out.println("22222222222222222");
			sqlSession.insert(namespace + ".insert", photo);
			
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			sqlSession.close();		
		}	
		
	}
	
	public int getPhotoCount(int num) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getPhotoCount";
			
			return sqlSession.selectOne(statement, num);
			
		} finally {			sqlSession.close();		}
	}

	public List<BoardDataBean> getPhotos(int num) {
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try {		
			
			String statement = namespace + ".getPhotos";
			return sqlSession.selectList(statement, num);
			
		} finally {			sqlSession.close();		}
		
	}

	public PhotoDataBean getPhoto(int photonum) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		PhotoDataBean photo = null;
		
		try {
			
			sqlSession.update(namespace+".content_update", photonum);
			sqlSession.commit();
			
			photo = sqlSession.selectOne(namespace+".getPhoto", photonum);
			
		} catch (Exception ex) {			
			ex.printStackTrace();
		} finally {			sqlSession.close();
		}
		
		return photo;
	}


	public int getLikeCheck(HashMap<String, Object> hashMap) {
		int check = 0;
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try {
			String statement = namespace + ".getLikeCheck";
			
			if(sqlSession.selectOne(statement, hashMap)==null) {
				return check;
			} else
				return sqlSession.selectOne(statement, hashMap);
			
		} finally {			sqlSession.close();		}
	}

	public int countbyLike(HashMap<String, Object> hashMap) {
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".countbyLike";
			
			return sqlSession.selectOne(statement, hashMap);
			
		} finally {			sqlSession.close();		}
		
	}

	public void create(HashMap<String, Object> hashMap) {
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".create", hashMap);
			
			sqlSession.commit();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {			
			sqlSession.close();		
		}
		
	}

	public void likeCntUp(int photonum) {
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try {
			
			sqlSession.update(namespace+".likeCntUp", photonum);
			sqlSession.commit();
		}catch (Exception e) {
				e.printStackTrace();
		} finally {			
				sqlSession.close();		
		}
		
		
	}

	public void likeCheck(HashMap<String, Object> hashMap) {
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try {
			
			sqlSession.update(namespace+".likeCheck", hashMap);
			sqlSession.commit();
		}catch (Exception e) {
				e.printStackTrace();
		} finally {			
			sqlSession.close();		
		}
			
	}

	public void likeCheckCancel(HashMap<String, Object> hashMap) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
					
			try {
				sqlSession.update(namespace+".likeCheckCancel", hashMap);
				sqlSession.commit();
			}catch (Exception e) {
				e.printStackTrace();
			} finally {			
				sqlSession.close();		
			}
					
	}

	public void likeCntDown(int photonum) { //해당 articlenum 게시물의 좋아요값 증가
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try {
			
			sqlSession.update(namespace+".likeCntDown", photonum);
			sqlSession.commit();
		}catch (Exception e) {
				e.printStackTrace();
		} finally {			
				sqlSession.close();		
		}
		
		
	}


	public List<PhotoDataBean> getPhotoContents(int photonum) {
		
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try {		
			String statement = namespace + ".getPhotoContents";
			
			return sqlSession.selectList(statement, photonum);
			
		} finally {			sqlSession.close();		}
		
	}
	
	public List<PhotoDataBean> getPhotoComments(int photonum) {
		
		
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		
		try {		
			String statement = namespace + ".getPhotoComments";
			return sqlSession.selectList(statement, photonum);
			
		} finally {			sqlSession.close();		}
		
	}
	
	
}

	





