package kr.co.doublecome.repository.vo;

import lombok.Data;

@Data	
public class User {
	private String userEmail;
	private String userPass;
	private String userScore;
	private String userPhnum;
	private String userNickname;
	private int userType;
	private int userCnt;
	private int fileGroupCode;
	
	
	
}
