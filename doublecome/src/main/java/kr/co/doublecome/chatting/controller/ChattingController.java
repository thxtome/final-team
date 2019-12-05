package kr.co.doublecome.chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.doublecome.chatting.service.ChattingService;

@Controller("kr.co.doublecome.chatting.controller.ChattingController")
@RequestMapping("/chatting")
public class ChattingController {
	@Autowired
	private ChattingService service;
	
	@RequestMapping("/messenger.do")
	public void messenger(Model model, String email) {
		model.addAttribute("email",email);
		model.addAttribute("chat", service.chatList(email));
		System.out.println(service.chatList(email));
	}
}
