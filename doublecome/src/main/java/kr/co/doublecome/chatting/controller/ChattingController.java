package kr.co.doublecome.chatting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.doublecome.chatting.service.ChattingService;
import kr.co.doublecome.repository.vo.Chat;
import kr.co.doublecome.repository.vo.ChatSearch;
import kr.co.doublecome.repository.vo.ConverSation;

@Controller("kr.co.doublecome.chatting.controller.ChattingController")
@RequestMapping("/chatting")
public class ChattingController {
	@Autowired
	private ChattingService service;
	
	@RequestMapping("/messenger.do")
	public void messenger(Model model,	 String email) {
		model.addAttribute("email", email);
		ChatSearch ctList = new ChatSearch();
		ctList.setEmail(email);
		model.addAttribute("chat", service.chatList(ctList));
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
		Chat chat = new Chat();
		chat.setChatNo(covst.getChatNo());
		chat.setUserType(covst.getUserType());
		service.readsUpdate(chat);
		service.chatInsert(covst);
	}
	@RequestMapping("/updateReads.do")
	@ResponseBody
	public int getCount(@RequestBody Chat chat) {
		return service.readsCount(chat);
	}
	@RequestMapping("/deleteReads.do")
	@ResponseBody
	public void deleteReads(@RequestBody ConverSation covst) {
		service.readsDelete(covst);
	}
	
	@RequestMapping("/searchChat.do")
	@ResponseBody
	public List<Chat> searchChat(@RequestBody ChatSearch ctList) {
		System.out.println("채팅 검색창 왔음");
		System.out.println("검색대상" + ctList.getEmail());
		System.out.println("감섹키워드" + ctList.getSearchValue());
		List<Chat> chat = service.chatList(ctList);
		System.out.println(chat);
		return service.chatList(ctList);
	}
}
