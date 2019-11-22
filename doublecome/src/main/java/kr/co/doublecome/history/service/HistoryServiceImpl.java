package kr.co.doublecome.history.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.HistoryMapper;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Deal;
import kr.co.doublecome.repository.vo.History;
import kr.co.doublecome.repository.vo.InfinitePage;
import kr.co.doublecome.repository.vo.Review;

@Service("kr.co.doublecome.history.service.HistoryServiceImpl")
public class HistoryServiceImpl implements HistoryService{
	@Autowired
	private HistoryMapper mapper;
	
	public List<Review> receiveReviewList(String userEmail){
		return mapper.selectReceiveReview(userEmail);
	}
	public List<Review> sendReviewList(InfinitePage ip){
		return mapper.selectSendReview(ip);
	}
	public History receiveUserInfo(String userEmail) {
		return mapper.userInfo(userEmail);
	}
	public List<Auction> receiveSaleHistory(String userEmail) {
		return mapper.saleHistory(userEmail);
	}
	public List<Auction> receiveBuyHistory(String userEmail){
		return mapper.buyHistory(userEmail);
	}
	public void addReview(Review review) {
		Deal deal = mapper.dealInfo(review.getAuctionNo());
		review.setDealNo(deal.getDealNo());
		if (deal.getUserEmailBuyer().equals(review.getReviewSender())) {
			review.setReviewReceiver(deal.getUserEmailSeller());
		} else {
			review.setReviewReceiver(deal.getUserEmailBuyer());
		}
		mapper.addReview(review);
	}
}
