package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Review;

public interface HistoryMapper {
	public List<Review> selectReceiveReview();
}
