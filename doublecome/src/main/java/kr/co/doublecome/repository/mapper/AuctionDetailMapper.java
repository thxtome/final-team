package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.Inquiry;

public interface AuctionDetailMapper {
	
	Auction auctiondetail(int no);
	List<Auction> retrieveinquiry(int no);
	void insertInquiry(Inquiry inquiry);
}
