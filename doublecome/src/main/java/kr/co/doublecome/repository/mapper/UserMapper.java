package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.User;

public interface UserMapper {
	public User selectUserInfo(User user);
	public User selectUserInfoByName(String userName);
	public void insertUser(User user);
	public void updateUser(User user);
	public User findEmail(User userPhnum);
	public List<Auction> mybidAuction(User user);
	public List<Auction> bidList(String email);
	
}
