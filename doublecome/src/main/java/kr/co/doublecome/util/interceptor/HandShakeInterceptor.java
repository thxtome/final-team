package kr.co.doublecome.util.interceptor;

import java.util.Map;
import java.util.Random;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor{
	int count = 1;
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		 System.out.println("Before Handshake");
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 if(principal != "anonymousUser") {
			 UserDetails userDetails = (UserDetails) principal;
			 attributes.put("userId", userDetails.getUsername());
		 } else {
			 attributes.put("userId","익명 " + count++);
		 }
		 
		 Random r = new Random();
		 String color = "#";
		 for(int i = 0; i < 3; i++) {
			 color += r.nextInt(12) + 5 + "";
		 }
		 attributes.put("color",color);
		 
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("에프터핸쉐");
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
