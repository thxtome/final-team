package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Chat;

public interface ChattingMapper {
	List<Chat> listChat(String email);
}
