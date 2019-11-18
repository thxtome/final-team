package kr.co.doublecome.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.doublecome.repository.mapper.AuctionDetailMapper;
import kr.co.doublecome.repository.vo.Auction;

@Service("kr.co.doublecome.auction.service.AucitonDetailServiceImpl")
public class AucitonDetailServiceImpl implements AuctionDetailService {
	
	@Autowired
	private AuctionDetailMapper mapper;
	
	public Auction auctiondetail(int no) {
		return mapper.auctiondetail(no);
	}
	
}
