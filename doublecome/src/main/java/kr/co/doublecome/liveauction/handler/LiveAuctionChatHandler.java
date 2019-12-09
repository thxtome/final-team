package kr.co.doublecome.liveauction.handler;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
@Component("LiveAuctionChatHandler")
public class LiveAuctionChatHandler extends TextWebSocketHandler{
	
	@Autowired
	Gson gson;
	
	//전체 사용자 정보 관리하기
	private Map<String, Map<String, WebSocketSession>> users = new HashMap<>();
	
	public LiveAuctionChatHandler() {
		System.out.println("LiveAuctionchat 생성");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String id = (String)map.get("userId");
		System.out.println(id + "연결되었음");
		map.put("msg",id + " 님이 입장하셨습니다.");
		Map<String, WebSocketSession> innerMap = new HashMap<>();
		innerMap.put(id, session);
		
		users.put(session.getId(),innerMap);
		System.out.println();

		broadcast(map);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String id = (String)map.get("userId");
		map
		System.out.println("보낸 아이디 : " + session.getId());
		System.out.println("보낸 데이터 : " + message.getPayload());
		broadcast(id + " : " + message.getPayload());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		Map<String, Object> map = session.getAttributes();
		String id = (String)map.get("userId");
		map.put("msg" ," 님이 퇴장하셨습니다.");
		broadcast(map);
		users.remove(session.getId());
	}
	
	public void broadcast(Map<String, Object> map) throws Exception{
		Set<String> keys = users.keySet();
		for(String key : keys) {
			Map<String, WebSocketSession> innerMap = users.get(key);
			Set<String> innerKeys = innerMap.keySet();
			
			for(String innerKey : innerKeys) {
				WebSocketSession user = innerMap.get(innerKey);
				user.sendMessage(new TextMessage(gson.toJson(map)));
			}
		}
	}

	
}
