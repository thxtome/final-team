package kr.co.doublecome.liveauction.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
@Component("LiveAuctionBidHandler")
public class LiveAuctionBidHandler extends TextWebSocketHandler{
	//전체 사용자 정보 관리하기
	private Map<String, WebSocketSession> users = new HashMap<>();
	
	public LiveAuctionBidHandler() {
		System.out.println("LiveAuctionBid 생성");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결되었음");
		users.put(session.getId(),session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("보낸 아이디 : " + session.getId());
		System.out.println("보낸 데이터 : " + message.getPayload());
		session.sendMessage(new TextMessage("에코 메세지 : " + message.getPayload()));
		Set<String> keys = users.keySet();
		for(String key : keys) {
			WebSocketSession user = users.get(key);
			user.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + "연결이 종료되었음");
		users.remove(session.getId());
	}
	
	
}
