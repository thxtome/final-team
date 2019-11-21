package kr.co.doublecome.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.AuctionMapper;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Category;
import kr.co.doublecome.repository.vo.SearchAuction;

@Service("kr.co.doublecome.auction.service.AuctionService")
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private AuctionMapper mapper;
	// 카테고리 리스트 담아서 넘김
	public List<Category> listCategory() { return mapper.categoryList();}
	// 선택한 리스트 뿌리기
	public List<Auction> auctionList(SearchAuction search) {
		return mapper.listAuction(search);
	}
}
