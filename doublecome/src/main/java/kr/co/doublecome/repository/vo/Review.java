package kr.co.doublecome.repository.vo;

import lombok.Data;

@Data
public class Review {
	private String auctionTitle;
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewRegDate;
	private int dealNo;
	private String reviewerNickname;
	private String reviewSender;
	private String reviewReceiver;
	private int reviewScore;
}
