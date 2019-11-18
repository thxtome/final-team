package kr.co.doublecome.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.repository.vo.User;
import kr.co.doublecome.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@RequestMapping("/loginForm.do")
	public void loginForm(String result, Model model) throws Exception{
		if(result != null) {
			model.addAttribute("result", "false");
		}
	}
	
	@RequestMapping("/joinForm.do")
	public void joinForm(User user) throws Exception{}

	@RequestMapping("/userInfo.do")
	public void userInfo(User user) throws Exception{
		service.selectUserInfo(user);
	}

	@RequestMapping("/userInfoUpdate.do")
	public void userInfoUpdate(User user) throws Exception{
		service.selectUserInfo(user);
	}
	@RequestMapping("/updateUser.do")
	public void updateUser(User user) throws Exception{
		service.updateUser(user);
	}
	
	
	@RequestMapping("/findEmailForm.do")
	public void findEmailForm(User user) throws Exception{}
	@RequestMapping("/findEmail.do")
	public String findEmail(String userPhnum) throws Exception{
		return service.findEmail(userPhnum);
	}
	
	@RequestMapping("/findPassForm.do")
	public void findPass(User user) throws Exception{}
	

	
	@RequestMapping("/insert.do")
	public String insertUser(User user) throws Exception{
		user.setUserPass(encoder.encode(user.getUserPass()));
		service.insertUser(user);
		return "redirect:" + "/main.do";
	}
}	
