package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.NoteDataBean;
import mybatis.AbstractRepository;

@Component
public class MybatisNoteDaoOracle {
	private final String namespace = "mybatis.Note";
	
	@Autowired
	public AbstractRepository opendb;
	
	public String getNoteReceiverName(int notereceiver) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			System.out.println("받는사람 이름 가져오기");
	        String statement = namespace + ".getNoteReceiverName";
	        return sqlSession.selectOne(statement, notereceiver);
		} finally {
			sqlSession.close();
		}
	}
	
	// 쪽지 보내기
	public void insertNote(NoteDataBean note) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insertNote";
			sqlSession.insert(statement, note);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	// 쪽지 답장 보내기
	public void insertNote2(NoteDataBean note) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".updateNote"; // 원본글 수정, rethat = 1로 수정
			sqlSession.update(statement, note.getNoteid());
			sqlSession.commit();
			
			// 글저장
			String statement2 = namespace + ".insertNote2";
			sqlSession.insert(statement2, note);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	// 내가 보낸 쪽지함
	public List<NoteDataBean> getMyNoteSendList(String name) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getMyNoteSendList";
			return sqlSession.selectList(statement, name);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<NoteDataBean> getMyNoteReceiveList(String name) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getMyNoteReceiveList";
			return sqlSession.selectList(statement, name);
		} finally {
			sqlSession.close();
		}
	}
	
	public void updateMyNoteStatus(String noteid) throws Exception {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			System.out.println("@@updateMyNoteStatus 시작 -> ");
			String statement = namespace + ".updateMyNoteStatus";
			sqlSession.update(statement, noteid);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
}
