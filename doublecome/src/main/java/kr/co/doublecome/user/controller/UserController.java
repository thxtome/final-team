package kr.co.doublecome.user.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	//회원 가입 - 이메일 중복 검사
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public int checkEmail( @RequestParam(value="param") String userEmail) {
		System.out.println("email" + service.checkEmail(userEmail));
		return service.checkEmail(userEmail);
	}
	//회원 가입 - 번호 중복 검사
	@RequestMapping("/checkPhnum.do")
	@ResponseBody
	public int checkPhnum(@RequestParam(value="param") String userPhnum) {
		System.out.println("phnum" + service.checkPhnum(userPhnum));
		return service.checkPhnum(userPhnum);
	}
	//회원 가입 - 별명 중복 검사
	@RequestMapping("/checkNickname.do")
	@ResponseBody
	public int checkNickname( @RequestParam(value="param") String userNickname) {
		System.out.println("userNickname" + service.checkPhnum(userNickname));
		return service.checkNickname(userNickname);
	}
	
	
	//마이페이지 
	@RequestMapping("/userInfo.do")
	public void userInfo() throws Exception{
	}
	//마이페이지 - 회원 정보 수정 
	@RequestMapping("/userInfoUpdate.do")
	public void userInfoUpdate(
			/* @RequestParam(value="userEmail") */ String userEmail,
			/* @RequestParam(value="userPass") */ String userPass,		
			Model model  ) throws Exception{
		User user = new User();
		user.setUserEmail(userEmail);
		user.setUserPass(userPass);
		model.addAttribute("user", service.selectUserInfo(user));
	}
	//마이페이지 - 회원 정보 수정 버튼
	@RequestMapping("/userUpdate.do")
	public String updateUser(User user, Principal p, RedirectAttributes attr) throws Exception{
		User u = service.selectUserInfoByName(p.getName());
		System.out.println(u.getUserPass() + "u.getUserPass()");
		System.out.println(user.getUserPass().length() + ": userPass.length()");
		System.out.println(user.getUserPass() + ": userPass");
		//비밀번호 수정
		if(user.getUserPass().length() == 0)
		user.setUserPass(u.getUserPass());
		else 
		user.setUserPass(encoder.encode(user.getUserPass()));
		// 별명 수정
		if(user.getUserNickname().length() == 0)
		user.setUserPass(u.getUserNickname());
		else 
		user.setUserNickname(user.getUserNickname());
		
		service.updateUser(user);
		System.out.println("/updateUser.do");
		attr.addFlashAttribute("user", user);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/bidList.do")
	@ResponseBody
	public List<Auction> bidList( String email) throws Exception{
		return service.bidList(email);	
		
	}


}	
