package kr.co.doublecome.chatting.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.doublecome.chatting.service.ChattingService;
import kr.co.doublecome.repository.vo.Chat;
import kr.co.doublecome.repository.vo.ConverSation;


@Component("messenger")
public class ChattingHandler extends TextWebSocketHandler {
	@Autowired
	ChattingService service;
	@Autowired
	Gson gson;
	private Map<Integer, Map<String, WebSocketSession>> chatMap = new HashMap<>();
	public ChattingHandler() { 
		System.out.println("채팅 핸들러 생성 완료"); 
	}
	
	@SuppressWarnings("null")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("채팅 접속");
		Map<String, Object> userData = session.getAttributes();
		String email = (String) userData.get("userId");
		System.out.println(email);
		List<Chat> chatList = service.chatList(email);
		for(Chat chat : chatList) {
			System.out.println("채팅방번호" +chat.getChatNo());
			Map<String, WebSocketSession> userSession = chatMap.get(chat.getChatNo());
			if(userSession == null) {
				userSession = new HashMap<String, WebSocketSession>(); 
				chatMap.put(chat.getChatNo(), userSession);
			}
			userSession.put(session.getId(), session);				
			chatMap.put(chat.getChatNo(), userSession);
		}
	}
	
	@SuppressWarnings("unlikely-arg-type")
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		System.out.println(msg);
		ConverSation covst = gson.fromJson(message.getPayload(), ConverSation.class);
		System.out.println("유저 아이디"+covst.getUserEmail());
		System.out.println("유저타입"+covst.getUserType());
		String data = gson.toJson(covst);
		System.out.println("보낼데이터 : " +  data);
		Map<String, WebSocketSession> userSession = chatMap.get(covst.getChatNo());
		for(String key : userSession.keySet()) {
			WebSocketSession user = userSession.get(key);
			System.out.println("session : " + user.getId());
			if(!user.getId().equals(session.getId())) {
				System.out.println("같지않다");
				user.sendMessage(new TextMessage(data));				
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료되었음..");
		Map<String, Object> userData = session.getAttributes();
		String email = (String) userData.get("userId");
		List<Chat> chatList = service.chatList(email);
		for(Chat chat : chatList) {
			chatMap.get(chat.getChatNo()).remove(session.getId());
		}
	}
	
}
