package kr.co.doublecome.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.doublecome.mypage.controller")
@RequestMapping("/mypage")
public class MypageController {
	@RequestMapping("/mypage.do")
	public void mypage() {}
}
