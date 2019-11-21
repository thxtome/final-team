package kr.co.doublecome.util.mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.user.service.UserService;

@Controller
@RequestMapping("/mail") 
public class MailSendController {
	
	public MailSendController() {
		System.out.println("mailSend");
	}
	
	@Autowired 
	private JavaMailSenderImpl mailSend;
	
	@Autowired
	UserService service;
	
	//비밀번호 찾기
	@RequestMapping("/findPass.do") 
	public String mailSender( String email ) { 
		System.out.println("/sendMailForFindPass.do");
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override 
			public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				helper.setFrom(""/*email*/);  					// 보내는사람 생략하면 정상작동을 안함 xml과 다르면 전송 안됨
				helper.setTo(""); 						// 받는사람 이메일
				helper.setSubject("누구나 쉬운 경매! 더불로와 - 비밀번호 찾기"); 			// 메일제목은 생략이 가능하다
				helper.setText(
						"아래 링크로 이동해 비밀번호를 다시 설정 하세요<br>" +
						"<br>" +
						"<a href=http://localhost:8000/doublecome/user/userInfoUpdate.do"+
								"?userEmail=" + email +
								"&userPass=" + service.findPass(email) + "> 비밀번호 재설정 하러 가기 <a>"  , true);	 			// 메일 내용
			} 
		}; 
		mailSend.send(preparator); 
		return "main"; 
	}



}
