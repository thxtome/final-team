package kr.co.doublecome.history.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.HistoryMapper;
import kr.co.doublecome.repository.vo.Review;

@Service("kr.co.doublecome.history.service.HistoryServiceImpl")
public class HistoryServiceImpl implements HistoryService{
	@Autowired
	private HistoryMapper mapper;
	
	public List<Review> receiveReviewList(String userEmail){
		return mapper.selectReceiveReview(userEmail);
	}
	
}
