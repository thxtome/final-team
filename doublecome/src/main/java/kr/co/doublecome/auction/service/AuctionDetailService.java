package kr.co.doublecome.auction.service;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.Review;

public interface AuctionDetailService {

	Auction auctiondetail(int no);
	History userInfo(String userEmail);
	List<Review> selectReceiveReview(String userEmail);
	List<Auction> retrieveinquiry(int no);
}
