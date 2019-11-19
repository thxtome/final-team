package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.Review;

public interface HistoryMapper {
	public List<Review> selectReceiveReview(String userEmail);		// 받은 후기 목록
	public List<Review> selectSendReview(String userEmail);			// 보낸 후기 목록
	public History userInfo(String userEmail);						// 구매/판매 횟수, 후기갯수
	public List<Auction> saleHistory(String userEmail);				// 판매 내역 목록
	public List<Auction> buyHistory(String userEmail);				// 구매 내역 목록
}
