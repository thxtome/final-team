package kr.co.doublecome.history.service;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.Review;
import kr.co.doublecome.repository.vo.Search;

public interface HistoryService {
	public List<Review> receiveReviewList(Search search);
	public List<Review> sendReviewList(Search search);
	public History receiveUserInfo(String userEmail);
	public List<Auction> receiveSaleHistory(String userEmail);
	public List<Auction> receiveBuyHistory(String userEmail);
	public void insertReview(Review review);
	public void deleteReview(Review review);
	public Review selectOneReview(Review review);
	public void updateReview(Review reivew);
}
