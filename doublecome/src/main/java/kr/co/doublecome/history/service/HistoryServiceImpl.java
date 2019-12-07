package kr.co.doublecome.history.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.HistoryMapper;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Deal;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.Review;
import kr.co.doublecome.repository.vo.Search;

@Service("kr.co.doublecome.history.service.HistoryServiceImpl")
public class HistoryServiceImpl implements HistoryService{
	@Autowired
	private HistoryMapper mapper;
	
	public List<Review> receiveReviewList(Search search){
		return mapper.selectReceiveReview(search);
	}
	public List<Review> sendReviewList(Search search){
		return mapper.selectSendReview(search);
	}
	public History receiveUserInfo(String userEmail) {
		History h = mapper.salesInfo(userEmail);
		h.setBuyCnt(mapper.purchaseInfo(userEmail));
		return h;
	}
	public List<Auction> receiveSaleHistory(String userEmail) {
		return mapper.saleHistory(userEmail);
	}
	public List<Auction> receiveBuyHistory(String userEmail){
		return mapper.buyHistory(userEmail);
	}
	public void insertReview(Review review) {
		Deal deal = mapper.dealInfo(review.getAuctionNo());
		review.setDealNo(deal.getDealNo());
		if (deal.getUserEmailBuyer().equals(review.getReviewSender())) {
			review.setReviewReceiver(deal.getUserEmailSeller());
		} else {
			review.setReviewReceiver(deal.getUserEmailBuyer());
		}
		review.setType("insert");
		mapper.insertReview(review);
		mapper.updateUserReviewInfo(review);
	}
	public void deleteReview(Review review) {
		review.setType("delete");
		mapper.deleteReview(review);
		mapper.updateUserReviewInfo(review);
	}
	public Review selectOneReview(Review review) {
		return mapper.selectOneReview(review);
	}
	public void updateReview(Review review) {
		review.setType("update");
		mapper.updateReview(review);
		System.out.println(review);
		mapper.updateUserReviewInfo(review);
	}
}
