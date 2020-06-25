package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AbstractRepository {
	String dbname;
	String resource;

	public AbstractRepository(String dbname){
		this.resource = "mybatis/mybatis-config" + dbname + ".xml";
		System.out.println(resource);
		setSqlSessionFactory();
	}
	
//	public void setDbname(String dbname) {
//		this.resource = "mybatis/mybatis-config" + dbname + ".xml";
//		this.dbname = dbname;
//	}

	private static SqlSessionFactory sqlSessionFactory;

	private void setSqlSessionFactory() {
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
}
