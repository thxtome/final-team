package kr.co.doublecome.repository.vo;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class Inquiry {

	private int inquiryNo;
	private String inquiryContent;
	private Integer inquiryParent;
	private LocalDateTime inquiryRegDate;
	private int auctionNo;
	private String userEmail;
	
}
