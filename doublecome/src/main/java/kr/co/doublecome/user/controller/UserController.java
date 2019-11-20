package kr.co.doublecome.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.User;
import kr.co.doublecome.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	private PasswordEncoder encoder;
	
	
	//로그인
	@RequestMapping("/loginForm.do")
	public void loginForm(String result, Model model) throws Exception{
		if(result != null) {
			model.addAttribute("result", "false");
		}
	}
	


	
	//이메일 찾기 페이지, 이메일 찾기
	@RequestMapping("/findEmailForm.do")
	public void findEmailForm(User user,  Model model) throws Exception{
		model.addAttribute("user", service.findEmail(user));
	}
	//비밀번호 찾기 페이지
	@RequestMapping("/findPassForm.do")
	public void findPass(User user) throws Exception{}
	
	

	//회원 가입
	@RequestMapping("/joinForm.do")
	public void joinForm(User user) throws Exception{}
	@RequestMapping("/insert.do")
	public String insertUser(User user) throws Exception{
		user.setUserPass(encoder.encode(user.getUserPass()));	
		service.insertUser(user);
		return "redirect:" + "/main.do";
	}
	
	
	//마이페이지 
	@RequestMapping("/userInfo.do")
	public void userInfo(/*User user, Model model, @RequestParam(value="email", required=false) String email*/) throws Exception{
		/* service.selectUserInfo(user); 
		 * user.setUserEmail(email); model.addAttribute("auction",
		 * service.mybidAuction(user));
		 */
	}
	@RequestMapping("/userInfoUpdate.do")
	public void userInfoUpdate( User user /*, Model model */) throws Exception{
		/*System.out.println(service.selectUserInfo(user));
		model.addAttribute("user", service.selectUserInfo(user));
		 service.selectUserInfo(user); */
	}
	
	@RequestMapping("/updateUser.do")
	public void updateUser(User user) throws Exception{
		service.updateUser(user);
	}
	
	@RequestMapping("/bidList.do")
	@ResponseBody
	public List<Auction> bidList( String email) throws Exception{
		
		/*System.out.println(service.bidList(email));*/
		return service.bidList(email);	
		
	}
/*	
 		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
		<dependency>
		    <groupId>com.fasterxml.jackson.core</groupId>
		    <artifactId>jackson-databind</artifactId>
		    <version>${jacksion.version}</version>
		</dependency>
		
		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-core -->
		<dependency>
		    <groupId>com.fasterxml.jackson.core</groupId>
		    <artifactId>jackson-core</artifactId>
		    <version>${jacksion.version}</version>
		</dependency> 
		pom.xml에 추가
		*/

}	
