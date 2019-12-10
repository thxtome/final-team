package kr.co.doublecome.liveauction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.AuctionDetailMapper;
import kr.co.doublecome.repository.vo.Auction;



@Service
public class LiveAuctionServiceImpl implements LiveAuctionService{
	
	@Autowired
	private AuctionDetailMapper mapper;
	
	@Override
	public Auction retrieveAuction(int auctionNo) {
		return mapper.selectAuctionForLive(auctionNo);
	}
}
