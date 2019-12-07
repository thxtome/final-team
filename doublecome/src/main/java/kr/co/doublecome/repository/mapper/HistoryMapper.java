package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Deal;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.Review;
import kr.co.doublecome.repository.vo.Search;
import kr.co.doublecome.repository.vo.UtilFile;

public interface HistoryMapper {
	public int receiveReviewCnt(String userEmail);					// 받은 후기 개수
	public int sendReviewCnt(String userEmail);						// 보낸 후기 개수
	public List<Review> selectReceiveReview(Search search);			// 받은 후기 목록
	public List<Review> selectSendReview(Search search);			// 보낸 후기 목록
	public History userInfo(String userEmail);						// 구매/판매 횟수, 후기갯수
	public List<Auction> saleHistory(String userEmail);				// 판매 내역 목록
	public List<Auction> buyHistory(String userEmail);				// 구매 내역 목록
	public Deal dealInfo(int auctionNo);							// 후기등록시 거래정보
	public void insertReview(Review review);						// 후기등록
	public void deleteReview(Review review);						// 후기 삭제
	public UtilFile selectOneFile(UtilFile uFile);					// 파일 정보
	public Review selectOneReview(Review review);					// 후기 한개
	public void updateReview(Review review);						// 후기 수정
	public void updateUserReviewInfo(Review review);				// 후기 등록/수정/삭제시 평점,후기개수 수정
}
