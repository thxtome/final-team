package kr.co.doublecome.chatting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.ChattingMapper;
import kr.co.doublecome.repository.vo.Chat;
import kr.co.doublecome.repository.vo.ConverSation;

@Service("kr.co.doublecome.chatting.service.ChattingServiceImpl")
public class ChattingServiceImpl implements ChattingService	{
	
	@Autowired
	private ChattingMapper mapper;
	
	public List<Chat> chatList(String email) {
		return mapper.listChat(email);
	}
	public List<ConverSation> selectOneChat(ConverSation covst) {
		return mapper.oneChat(covst);
	}
	public void chatUpdate(ConverSation covst) {
		mapper.updateChat(covst);
	} 		
	public void chatInsert(ConverSation covst) {
		mapper.addCovstData(covst);
	}
	
}
