package kr.co.doublecome.util.interceptor;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor{
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		 System.out.println("Before Handshake");
		 ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
	     HttpServletRequest req =  ssreq.getServletRequest();

		 int auctionNo = (int)req.getSession().getAttribute("auctionNo");
		 
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		 //아이디 입력
		 if(principal != "anonymousUser") {
			 UserDetails userDetails = (UserDetails) principal;
			 attributes.put("userId", userDetails.getUsername());
		 } else {
			 attributes.put("userId","비회원");
		 }
		 
		 //색상 랜덤 선택
		 Random r = new Random();
		 String color = "#";
		 for(int i = 0; i < 3; i++) {
			 int num = r.nextInt(130) + 124;
			 color += String.format("%02X", num) + "";
		 }
		 attributes.put("color",color);
		 attributes.put("auctionNo",auctionNo);
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("에프터핸쉐");
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
