package kr.co.doublecome.chatting.service;

import java.util.List;

import kr.co.doublecome.repository.vo.Chat;
import kr.co.doublecome.repository.vo.ConverSation;

public interface ChattingService  {
	List<Chat> chatList(String email);
	List<ConverSation> selectOneChat(ConverSation covst);
	void chatUpdate(ConverSation covst);
	void chatInsert(ConverSation covst);
}
