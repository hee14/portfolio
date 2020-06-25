package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.MessageDataBean;
import mybatis.AbstractRepository;

@Component
public class MybatisChatDao {

	// @Inject
	// private SqlSession session;

	private final String namespace = "mybatis.Chat";

	@Autowired
	AbstractRepository opendb;

	/*public void createRoom(ChatRoomDataBean DataBean) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".createRoom", DataBean);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}*/

	/*public ChatRoomDataBean isRoom(ChatRoomDataBean DataBean) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			ChatRoomDataBean roomDataBean = null;
			roomDataBean = sqlSession.selectOne(namespace + ".isRoom", DataBean);
			System.out.println(roomDataBean);

			return roomDataBean;
		} finally {
			sqlSession.close();
		}
	}*/
	
	public List<MessageDataBean> isRoom(int class_id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".isRoom", class_id);
		} finally {
			sqlSession.close();
		}
	}

	public void insertMessage(MessageDataBean DataBean) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertMessage", DataBean);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	/*public String getPartner(ChatRoomDataBean DataBean) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			List<MessageDataBean> mDataBean = sqlSession.selectList(namespace + ".getPartner", DataBean);

			return mDataBean.get(0).getUSER_user_id();
		} finally {
			sqlSession.close();
		}
	}*/

	/*public String getProfile(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getProfile", str);
		} finally {
			sqlSession.close();
		}
	}*/

	/*public String getName(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getName", str);
		} finally {
			sqlSession.close();
		}
	}
*/
/*	public List<MessageDataBean> getMessageList(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getMessageList", str);
		} finally {
			sqlSession.close();
		}
	}*/

/*	public List<ChatRoomDataBean> getRoomList(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getRoomList", str);
		} finally {
			sqlSession.close();
		}
	}

	public List<ChatRoomDataBean> getRoomList2(String str) {

		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getRoomList2", str);
		} finally {
			sqlSession.close();
		}
	}*/

	/*public MessageDataBean getRecentMessage(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getRecentMessage", str);
		} finally {
			sqlSession.close();
		}
	}*/

/*	public String getTutorId(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".getTutorId", str);
		} finally {
			sqlSession.close();
		}
	}*/

	/*public List<ChatRoomDataBean> getRoomListTutor(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".getRoomListTutor", str);
		} finally {
			sqlSession.close();
		}
	}*/

/*	public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
			map.put("USER_user_id", user_id);
			map.put("CLASS_class_id", class_id);
			sqlSession.update(namespace + ".updateReadTime", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}*/
/*
	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
			map.put("USER_user_id", user_id);
			map.put("CLASS_class_id", class_id);

			return sqlSession.selectOne(namespace + ".getUnReadCount", map);
		} finally {
			sqlSession.close();
		}
	}

	public int getAllCount(String str) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("USER_user_id", str);
			map.put("TUTOR_USER_user_id", str);
			if (sqlSession.selectOne(namespace + ".getAllCount", map) == null) {
				return 0;
			} else {

				return sqlSession.selectOne(namespace + ".getAllCount", map);
			}
		} finally {
			sqlSession.close();
		}
	}*/

	/*public void updateReadTimeTutor(int class_id, String user_id, String TUTOR_USER_user_id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
			map.put("USER_user_id", user_id);
			map.put("CLASS_class_id", class_id);
			sqlSession.update(namespace + ".updateReadTimeTutor", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
*/
	/*public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id) {
		SqlSession sqlSession = opendb.getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
			map.put("USER_user_id", user_id);
			map.put("CLASS_class_id", class_id);

			return sqlSession.selectOne(namespace + ".getUnReadCountTutor", map);
		} finally {
			sqlSession.close();
		}
	}*/

}