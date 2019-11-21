package kr.co.doublecome.repository.vo;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.doublecome.util.page.Search;
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
	
	private Integer startPrice;
	private Integer endPrice;
	private Integer[] categories;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDateTime startLimitDate; 
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDateTime endLimitDate; 
	
}
