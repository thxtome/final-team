package kr.co.doublecome.util.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;


public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	public LoginSuccessHandler() {
		System.out.println("초기화성공");
	}

	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, HttpServletResponse response, Authentication authentication) 
					throws IOException, ServletException {
		Collection<? extends GrantedAuthority> list = authentication.getAuthorities();
		for (GrantedAuthority auth : list) {
			System.out.println(auth.getAuthority());
		}
		response.sendRedirect(request.getContextPath() + "/main.do");
	}

}
