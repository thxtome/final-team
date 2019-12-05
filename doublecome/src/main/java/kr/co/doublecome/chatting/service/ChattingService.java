package kr.co.doublecome.chatting.service;

import java.util.List;

import kr.co.doublecome.repository.vo.Chat;

public interface ChattingService  {
	List<Chat> chatList(String email);
}
