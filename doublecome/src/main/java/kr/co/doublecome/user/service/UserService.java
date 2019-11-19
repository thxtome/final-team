package kr.co.doublecome.user.service;

import kr.co.doublecome.repository.vo.User;

public interface UserService {
	public void insertUser(User user);
	public void updateUser(User user);
	public User selectUserInfo(User user);
	public User findEmail(User user);
}
