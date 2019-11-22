package kr.co.doublecome.repository.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class SearchAuction extends Search{
	public SearchAuction () {
		super();
	}
	
	public SearchAuction (int pageNo) {
		super(pageNo);
	}
	
	public SearchAuction (int pageNo, int listSize) {
		super(pageNo, listSize);
	}
	
	private int categoryCode;
	private int startLimit;
	private int endLimit;
	private int startBidCount;
	private int endBidCount;
	private Integer startPrice;
	private Integer endPrice;
	
	private Integer[] categories;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startLimitDate; 
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endLimitDate; 
	
}
