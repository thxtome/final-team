package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Category;

public interface AuctionMapper {
	//카테고리 리스트 받아옴
	List<Category> categoryList();
	
}
