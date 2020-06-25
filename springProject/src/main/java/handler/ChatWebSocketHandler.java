package handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import model.LogonDataBean;
import model.MessageDataBean;
import service.MybatisChatDao;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private MybatisChatDao dao;

	private List<WebSocketSession> connectedUsers;

	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log(session.getId() + " 연결 됨!!");

		users.put(session.getId(), session);
		connectedUsers.add(session);
	}

	@Override
	public void afterConnectionClosed(

			WebSocketSession session, CloseStatus status) throws Exception {

		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId());

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		for (WebSocketSession s : users.values()) {

			s.sendMessage(message);
			log(s.getId() + "에 메시지 발송: " + message.getPayload());
		}

		
		MessageDataBean messageDataBean = MessageDataBean.convertMessage(message.getPayload());
		System.out.println("1 : " + messageDataBean.toString());
	
		System.out.println("22222222");
		dao.insertMessage(messageDataBean);
		System.out.println("22222222213213213213");
//		for (WebSocketSession s : users.values()) {
//			Gson gson = new Gson();
//			String msgJson = gson.toJson(messageDataBean);
//			s.sendMessage(new TextMessage(msgJson));
//			log(s.getId() + "에 메시지 발송: " + message.getPayload());
//		}

		/*
		 * System.out.println(message.getPayload());
		 * 
		 * Map<String, Object> map = null;
		 * 
		 * MessageDataBean messageDataBean =
		 * MessageDataBean.convertMessage(message.getPayload());
		 * 
		 * System.out.println("1 : " + messageDataBean.toString());
		 * 
		 * 
		 * ChatRoomDataBean roomDataBean = new ChatRoomDataBean();
		 * roomDataBean.setCLASS_class_id(messageDataBean.getCLASS_class_id());
		 * //클래스 roomDataBean.setTUTOR_USER_user_id(messageDataBean.
		 * getTUTOR_USER_user_id()); //튜터
		 * roomDataBean.setUSER_user_id(messageDataBean.getUSER_user_id()); //유저
		 * 
		 * ChatRoomDataBean croom =null;
		 * if(!messageDataBean.getUSER_user_id().equals(messageDataBean.
		 * getTUTOR_USER_user_id())) { System.out.println("a");
		 * 
		 * 
		 * 
		 * if(dao.isRoom(roomDataBean) == null ) { System.out.println("b");
		 * dao.createRoom(roomDataBean); System.out.println("d"); croom =
		 * dao.isRoom(roomDataBean);
		 * 
		 * }else { System.out.println("C"); croom = dao.isRoom(roomDataBean); }
		 * }else {
		 * 
		 * croom = dao.isRoom(roomDataBean); }
		 * 
		 * messageDataBean.setCHATROOM_chatroom_id(croom.getChatroom_id());
		 * if(croom.getUSER_user_id().equals(messageDataBean.getMessage_sender()
		 * )) {
		 * 
		 * messageDataBean.setMessage_receiver(roomDataBean.
		 * getTUTOR_USER_user_id()); }else {
		 * messageDataBean.setMessage_receiver(roomDataBean.getUSER_user_id());
		 * }
		 * 
		 * 
		 * 
		 * 
		 * for (WebSocketSession websocketSession : connectedUsers) { map =
		 * websocketSession.getAttributes(); LogonDataBean login =
		 * (LogonDataBean) map.get("login");
		 * 
		 * //받는사람 if
		 * (login.getName().equals(messageDataBean.getMessage_sender())) {
		 * 
		 * Gson gson = new Gson(); String msgJson =
		 * gson.toJson(messageDataBean); websocketSession.sendMessage(new
		 * TextMessage(msgJson)); }
		 * 
		 * 
		 * }
		 */
	}

	@Override
	public void handleTransportError(

			WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}

}