package kr.co.doublecome.auction.service;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.History;

public interface AuctionDetailService {

	Auction auctiondetail(int no);
	History userInfo(String userEmail);
}
