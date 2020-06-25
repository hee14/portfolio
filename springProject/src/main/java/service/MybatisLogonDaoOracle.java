package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.LogonDataBean;
import mybatis.AbstractRepository;


@Component
public class MybatisLogonDaoOracle{
	private final String namespace = "mybatis.Logon";

	@Autowired
	AbstractRepository opendb;
	
	public String confirmName(String name) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".confirmName";
			return sqlSession.selectOne(statement, name);
		} finally {
			sqlSession.close();
		}	
	}
	
	public String confirmEmail(String email) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".confirmEmail";
			return sqlSession.selectOne(statement, email);
		} finally {
			sqlSession.close();
		}
	}
	
	public void insertMember(LogonDataBean member) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insertMember";
			sqlSession.insert(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();	
		}
	}
	
	public int userCheck(String email, String password) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		String dbpasswd = null;
		int x = -1;
		try {
			dbpasswd = sqlSession.selectOne(namespace+".getPasswd", email);
			if(dbpasswd.equals(password)) {
				x= 1;
			} else {
				x= 0;
			}
		} catch(Exception ex) {
			
		} finally {
			sqlSession.close();	
		}
		return x;
	}
	
	public String findName(String memEmail) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		String name = "";
		try {
			String statement = namespace + ".findName";
			name = sqlSession.selectOne(statement, memEmail);
		} finally {
			sqlSession.close();	
		}
		return name;
	}
	
	public LogonDataBean getUser(String memEmail) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getUser";
			System.out.println("@@@@@@@aaaa@@@33");
			return sqlSession.selectOne(statement, memEmail);
		} finally {
			sqlSession.close();	
		}
		
	}
	
	
	
}





