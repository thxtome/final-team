package kr.co.doublecome.repository.vo;

import lombok.Data;

@Data	
public class Auction {
	private int auctionNo;
	private String auctionTitle;
	private String auctionContent;
	private String auctionRegDate;
	private String auctionLimitDate;
	private int auctionBuyNow;
	private int auctionMinPrice;
	private int auctionCondition;
	private int fileGroupCode;
	private int categoryCode;
	private int maxPrice;
	private int bidCnt;
	private int bidPrice;
	private String userEmail;
	private double score;
	private String userNickname;
	
	private int inquiryNo;
	private String inquiryContent;
	private int inquiryParent;
}
