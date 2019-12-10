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
import kr.co.doublecome.repository.vo.DealChat;


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
		Map<String, WebSocketSession> userSession = new HashMap<>();
		for(Chat chat : chatList) {
			System.out.println("채팅방번호" +chat.getChatNo());
			userSession = chatMap.get(chat.getChatNo());
			if(userSession == null) {
				System.out.println("오류");
				userSession.put(session.getId(),session);
			} else if(userSession.get(session.getId()) == null) {
				System.out.println("다");
				userSession.put(session.getId(),session);
			}
			chatMap.put(chat.getChatNo(), userSession);
		}
	}
	
	@SuppressWarnings("unlikely-arg-type")
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		System.out.println(msg);
		DealChat dc = gson.fromJson(message.getPayload(), DealChat.class);
		System.out.println(dc.getEmail());
		System.out.println(dc.getMsg());
		System.out.println(dc.getChatNo());
		System.out.println(session.getId());
		String data = gson.toJson(dc);
		System.out.println(data);
		Map<String, WebSocketSession> userSession = chatMap.get(dc.getChatNo());
		for(String key : userSession.keySet()) {
			WebSocketSession user = userSession.get(key);
			System.out.println("session" + user);
			if(!user.equals(session.getId())) {
				user.sendMessage(new TextMessage(data));				
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료되었음..");
	}
	
}
