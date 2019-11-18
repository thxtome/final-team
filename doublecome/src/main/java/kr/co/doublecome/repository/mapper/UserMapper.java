package kr.co.doublecome.repository.mapper;

import kr.co.doublecome.repository.vo.User;

public interface UserMapper {
	public User selectUserInfo(User user);
	public User selectUserInfoByName(String userName);
	public void insertUser(User user);
	public void updateUser(User user);
	public String findEmail(String userPhnum);
	
}
