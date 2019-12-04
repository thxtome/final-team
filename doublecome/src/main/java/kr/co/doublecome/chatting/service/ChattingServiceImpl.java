package kr.co.doublecome.chatting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.ChattingMapper;

@Service("kr.co.doublecome.chatting.service.ChattingServiceImpl")
public class ChattingServiceImpl implements ChattingService	{
	
	@Autowired
	private ChattingMapper mapper;
	
	
}
