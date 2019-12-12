package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Chat;
import kr.co.doublecome.repository.vo.ConverSation;

public interface ChattingMapper {
	List<Chat> listChat(String email);
	List<ConverSation> oneChat(ConverSation covst);
	void updateChat(ConverSation covst);
	void addCovstData(ConverSation covst);
	int readsCnt(Chat chat);
	void updateReads(Chat chat);
}
