package kr.co.doublecome.liveauction.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
@Component("LiveAuctionChatHandler")
public class LiveAuctionChatHandler extends TextWebSocketHandler{
	//전체 사용자 정보 관리하기
	private Map<String, WebSocketSession> users = new HashMap<>();
	
	public LiveAuctionChatHandler() {
		System.out.println("LiveAuctionchat 생성");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결되었음");
		users.put(session.getId(),session);
		broadcast(session.getId() + " 님이 입장하셨습니다.");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("보낸 아이디 : " + session.getId());
		System.out.println("보낸 데이터 : " + message.getPayload());
		broadcast(session.getId() + " : " + message.getPayload());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + "연결이 종료되었음");
		broadcast(session.getId() + " 님이 퇴장하셨습니다.");
		users.remove(session.getId());
	}
	
	public void broadcast(String msg) throws Exception{
		Set<String> keys = users.keySet();
		for(String key : keys) {
			WebSocketSession user = users.get(key);
			user.sendMessage(new TextMessage(msg));
		}
	}
	
	
}
