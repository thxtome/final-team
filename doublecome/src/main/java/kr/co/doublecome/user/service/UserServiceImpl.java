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
	
	//회원가입
	@Override
	public void insertUser(User user) {
	mapper.insertUser(user);	
	}

	
	//마이페이지
	@Override
	public User selectUserInfo(User user) {
		mapper.selectUserInfo(user);
		return user;
	}
	//마이페이지 - 개인정보 수정
	@Override
	public void updateUser(User user) {
		mapper.updateUser(user);
	}
	//마이페이지 - 입찰 리스트
	@Override
	public List<Auction> mybidAuction(User user) {
		return mapper.mybidAuction(user);
	}
	@Override
	public List<Auction> bidList(String email) {	
		return mapper.bidList(email);
	}

	
	//메일 찾기
	@Override
	public User findEmail(User user) {
		return mapper.findEmail(user);
	}
	//비밀번호 찾기
	@Override
	public String findPass(String email) {
		return mapper.findPass(email);
	}

	
	
	
	
}
