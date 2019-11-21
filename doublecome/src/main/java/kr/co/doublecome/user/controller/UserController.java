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
	public void userInfo() throws Exception{
	}
	@RequestMapping("/userInfoUpdate.do")
	public void userInfoUpdate( String userEmail , Model model ) throws Exception{
		model.addAttribute("user", service.selectUserInfoByName(userEmail));
	}
	
	@RequestMapping("/userUpdate.do")
	public String updateUser(User user) throws Exception{
		System.out.println("/updateUser.do");
		user.setUserPass(encoder.encode(user.getUserPass()));
		service.updateUser(user);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/bidList.do")
	@ResponseBody
	public List<Auction> bidList( String email) throws Exception{
		return service.bidList(email);	
		
	}


}	
