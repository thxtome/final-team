package kr.co.doublecome.chatting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.chatting.service.ChattingService;
import kr.co.doublecome.repository.vo.ConverSation;

@Controller("kr.co.doublecome.chatting.controller.ChattingController")
@RequestMapping("/chatting")
public class ChattingController {
	@Autowired
	private ChattingService service;
	
	@RequestMapping("/messenger.do")
	public void messenger(Model model,	 String email) {
		model.addAttribute("email", email);
		model.addAttribute("chat", service.chatList(email));
	}
	@RequestMapping("/chatList.do")
	@ResponseBody
	public List<ConverSation> chatList(@RequestBody ConverSation covst) {
		System.out.println(covst.getUserType());
		System.out.println(covst.getChatNo());
		service.chatUpdate(covst);
		return service.selectOneChat(covst);
	}
	@RequestMapping("/insertChat.do")
	@ResponseBody
	public void insertChat(@RequestBody ConverSation covst) {
		service.chatInsert(covst);
	}
		
}
