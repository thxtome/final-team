package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.Inquiry;
import kr.co.doublecome.repository.vo.UtilFile;

public interface AuctionDetailMapper {
	
	Auction auctiondetail(int no);
	List<Auction> retrieveinquiry(int no);
	void insertInquiry(Inquiry inquiry);
	void addFile(UtilFile file);
	int maxFileGroupCode();
	void addAuction(Auction auction);
}
