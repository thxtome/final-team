package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;

public interface AuctionDetailMapper {
	
	Auction auctiondetail(int no);
	List<Auction> retrieveinquiry(int no);
}
