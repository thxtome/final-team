package kr.co.doublecome.liveauction.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kr.co.doublecome.repository.mapper.AuctionDetailMapper;
import kr.co.doublecome.repository.vo.Auction;
@Component("LiveAuctionBidHandler")
public class LiveAuctionBidHandler extends TextWebSocketHandler{
	
	@Autowired
	Gson gson;
	
	@Autowired
	AuctionDetailMapper mapper;

	//전체 사용자 정보 관리하기
	private Map<Integer, Map<String, WebSocketSession>> channels = new HashMap<>();
	
	public LiveAuctionBidHandler() {
		System.out.println("LiveAuctionBid 생성");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> userData = session.getAttributes();
		int auctionNo = (int)userData.get("auctionNo");
		
		Map<String, WebSocketSession> users = channels.get(auctionNo);
		if(users == null) {
			users = new HashMap<String,WebSocketSession>();
			channels.put(auctionNo, users);
		}
		users.put(session.getId(), session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> userData = session.getAttributes();
		int auctionNo = (int)userData.get("auctionNo");
		Map<String, WebSocketSession> users = channels.get(auctionNo);
		if(userData.get("userId") == "비회원") {
			sendDataSolo("false",session);
			return;
		}		
		sendDataSolo("true",session);
		int bidPrice = Integer.parseInt(message.getPayload());
		Auction auction = new Auction();
		auction.setAuctionNo(auctionNo);
		auction.setBidPrice(bidPrice);
		auction.setUserEmail((String)userData.get("userId"));
		mapper.auctionBid(auction);
		
		userData.put("maxPrice", bidPrice);
		
		sendData(userData,users);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> userData = session.getAttributes();
		int auctionNo = (int)userData.get("auctionNo");
		
		Map<String, WebSocketSession> users = channels.get(auctionNo);
		users.remove(session.getId());
		
		//시청자가 없을 경우 방 삭제
		if(users.isEmpty()) {
			channels.remove(auctionNo);
			return;
		}
	}
	
	public void sendData(Map<String, Object> userData, Map<String, WebSocketSession> users) throws Exception{
		String data = gson.toJson(userData);
		for(String key : users.keySet()) {
			WebSocketSession user = users.get(key);
			System.out.println("전송");
			user.sendMessage(new TextMessage(data));
		}
	}
	
	public void sendDataSolo(String result, WebSocketSession session) throws Exception{
		String data = gson.toJson(result);
		session.sendMessage(new TextMessage(data));
	}
	
	
}
