package kr.co.doublecome.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.doublecome.repository.mapper.UserMapper;
import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.User;

@Service

public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper mapper;

	@Override
	public void insertUser(User user) {
	mapper.insertUser(user);	
	}

	@Override
	public User selectUserInfo(User user) {
		mapper.selectUserInfo(user);
		return user;
	}

	@Override
	public void updateUser(User user) {
		mapper.updateUser(user);
	}

	@Override
	public User findEmail(User user) {

		return mapper.findEmail(user);
	}
	

	@Override
	public List<Auction> mybidAuction(User user) {
		
		return mapper.mybidAuction(user);
	}

	@Override
	public List<Auction> bidList(String email) {
		
		return mapper.bidList(email);
	}

	
	
	
	
}
