package kr.co.doublecome.repository.vo;

import lombok.Data;

@Data	
public class Auction {
	private int auctionNo;
	private String auctionTitle;
	private String auctionContent;
	private String auctionRegDate;
	private String auctionLimitDate;
	private int auctionBuyPrice;
	private int auctionMinPrice;
	private int auctionCondition;
	private String user_email;
	private int fileGroupCode;
	private int categoryCode;
	private int maxPrice;
	private int bidCnt;
}
