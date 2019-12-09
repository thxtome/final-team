package kr.co.doublecome.chatting.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.doublecome.repository.vo.DealChat;


@Component("messenger")
public class ChattingHandler extends TextWebSocketHandler {
	
	private String userEmail;
	public ChattingHandler() { 
		System.out.println("채팅 핸들러 생성 완료");
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + " 연결되었음..");
		userEmail = session.getId();
		System.out.println(userEmail);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		System.out.println(msg);
		DealChat dc = new Gson().fromJson(message.getPayload(), DealChat.class);
		System.out.println(dc.getEmail());
		System.out.println(dc.getMsg());
		System.out.println(dc.getChatNo());
		if (!userEmail.equals(session.getId())) session.sendMessage(new TextMessage(dc.getMsg()));
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료되었음..");
	}
	
}
