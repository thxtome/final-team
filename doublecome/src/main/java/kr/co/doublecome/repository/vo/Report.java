package kr.co.doublecome.repository.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Report {
	private int reportNo;
	private String reportContent;
	private String reportSender;
	private String reportReceiver;
	private int dealNo;
	private int reportTypeCode;
	private int auctionNo;
	private int reportCnt;
	private LocalDateTime reportRegDate;
	private String reportTypeName;
}
