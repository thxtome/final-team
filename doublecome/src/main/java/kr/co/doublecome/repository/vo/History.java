package kr.co.doublecome.repository.vo;

import lombok.Data;

@Data
public class History {

	private String userEmail;
	private String userScore;
	private String userNickname;
	private int userCnt;
	private int fileGroupCode;
	private int sellCnt;
	
}
