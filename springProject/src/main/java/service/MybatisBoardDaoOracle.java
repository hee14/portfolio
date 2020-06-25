package service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.BoardDataBean;
import model.LikeDataBean;
import mybatis.AbstractRepository;

@Component
public class MybatisBoardDaoOracle {

	private final String namespace = "mybatis.Board";

	@Autowired
	public AbstractRepository opendb;

	public int getArticleCount(int num) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleCount";

			return sqlSession.selectOne(statement, num);

		} finally {
			sqlSession.close();
		}
	}

	public List<BoardDataBean> getArticles(int startRow, int endRow, int num) {

		startRow = startRow - 1;
		endRow = endRow - startRow;

		Map map = new HashMap();
		map.put("num", num);
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

	public void insertArticle(BoardDataBean article) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		Map map = new HashMap();
		int articlenum = article.getArticlenum();
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 1;

		try {
			number = sqlSession.selectOne(namespace + ".insert_max");

			if (articlenum != 0) { // ??
				map.put("ref", ref);
				map.put("re_step", re_step);
				re_step = re_step + 1;
				re_level = re_level + 1;
				String statement = namespace + ".insert_update";
				sqlSession.update(statement, map);
				sqlSession.commit();

			} else {
				ref = number; // 새글이면 ref는 maxnum
				re_step = 0;
				re_level = 0;

			}
			article.setArticlenum(number);
			article.setNum(num);
			article.setRef(ref);
			article.setRe_level(re_level);
			article.setRe_step(re_step);

			sqlSession.insert(namespace + ".insert", article);

			sqlSession.commit();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

	}

	public BoardDataBean getArticle(int articlenum) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		BoardDataBean article = null;

		try {

			sqlSession.update(namespace + ".content_update", articlenum);
			sqlSession.commit();

			article = sqlSession.selectOne(namespace + ".getArticle", articlenum);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return article;
	}

	public BoardDataBean getUpdateArticle(int articlenum) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		BoardDataBean article = null;
		try {
			article = sqlSession.selectOne(namespace + ".getArticle", articlenum);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;
	}

	public int updateArticle(BoardDataBean article) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		String dbpasswd = "";
		int x = -1;

		try {
			dbpasswd = sqlSession.selectOne(namespace + ".getPasswd", article.getArticlenum());
			if (dbpasswd.equals(article.getPasswd())) { // db저장되어있는 게시물비밀번호랑 입력한
														// 게시물비밀번호가 같으면
				sqlSession.update(namespace + ".update", article);// 수정된
																	// article을
																	// 업데이트
				sqlSession.commit();
				x = 1; // 업데이트가 되었다면 x=1이 됨.

			} else {
				x = 0;
			} // 업데이트가 안되었다면 x=0이 됨.
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return x;
	}

	public int deleteArticle(int articlenum, String passwd) throws Exception {
		String dbpasswd = null;
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		int x = -1;
		try {
			dbpasswd = sqlSession.selectOne(namespace + ".getPasswd", articlenum);
			if (dbpasswd.equals(passwd)) {
				sqlSession.delete(namespace + ".delete", articlenum);
				sqlSession.commit();
				x = 1;
			} else {
				x = 0;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return x;

	}

	// like
	public List<LikeDataBean> getLike(HashMap<String, Object> hashMap) { // email과
																			// articlenum을
																			// 넣으면

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getLike";

			return sqlSession.selectList(statement, hashMap);

		} finally {
			sqlSession.close();
		}

		// return null;
	}

	public int countbyLike(HashMap<String, Object> hashMap) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".countbyLike";

			return sqlSession.selectOne(statement, hashMap);

		} finally {
			sqlSession.close();
		}
	}

	public void create(HashMap<String, Object> hashMap) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".create", hashMap);

			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

	}

	public void likeCheck(HashMap<String, Object> hashMap) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {

			sqlSession.update(namespace + ".likeCheck", hashMap);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public void likeCheckCancel(HashMap<String, Object> hashMap) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {

			sqlSession.update(namespace + ".likeCheckCancel", hashMap);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public void likeCntUp(int articlenum) { // 해당 articlenum 게시물의 좋아요값 증가
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {

			sqlSession.update(namespace + ".likeCntUp", articlenum);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

	}

	public void likeCntDown(int articlenum) { // 해당 articlenum 게시물의 좋아요값 증가
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {

			sqlSession.update(namespace + ".likeCntDown", articlenum);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

	}

	public int getLikeCheck(HashMap<String, Object> hashMap) {
		int check = 0;
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getLikeCheck";

			if (sqlSession.selectOne(statement, hashMap) == null) {
				return check;
			} else
				return sqlSession.selectOne(statement, hashMap);

		} finally {
			sqlSession.close();
		}
	}

	public List<BoardDataBean> getBoardComments(int articlenum) {

		System.out.println("articlenum :::::######" + articlenum);
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".getBoardComments";
			List<BoardDataBean> a = sqlSession.selectList(statement, articlenum);
			System.out.println("aaaaaaaaaaa" + a);
			return sqlSession.selectList(statement, articlenum);

		} finally {
			sqlSession.close();
		}

	}

	public int getCommentCount(int articlenum1) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		System.out.println("articlenum1 ::" + articlenum1);

		try {
			String statement = namespace + ".getCommentCount";

			return sqlSession.selectOne(statement, articlenum1);

		} finally {
			sqlSession.close();
		}
	}

}// class end
