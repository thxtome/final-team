package kr.co.doublecome.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.AuctionDetailMapper;
import kr.co.doublecome.repository.mapper.HistoryMapper;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.History;

@Service("kr.co.doublecome.auction.service.AucitonDetailServiceImpl")
public class AucitonDetailServiceImpl implements AuctionDetailService {
	
	@Autowired
	private AuctionDetailMapper mapper;
	
	@Autowired 
	private HistoryMapper Hmapper;
	
	public Auction auctiondetail(int no) {
		return mapper.auctiondetail(no);
	}
	
	public History userInfo(String userEmail) {
		return Hmapper.userInfo(userEmail);
	}
}
