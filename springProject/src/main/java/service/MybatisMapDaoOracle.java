package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.MapDataBean;
import mybatis.AbstractRepository;

@Component
public class MybatisMapDaoOracle {

	private final String namespace = "mybatis.Smap";
	
	@Autowired
	public AbstractRepository opendb;
	
	// 1. 마이페이지 뷰단 추가
	// map -> 회원이 가입한 일정모임의 제목 타이틀과 관심사이미지!
	public List<MapDataBean> getMemjoinClass(String name) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			System.out.println("왜안오노?");
			String statement = namespace + ".getMemjoinClass";
			return sqlSession.selectList(statement, name);
		} finally { 
			sqlSession.close();
		}
	}
	
		
}
