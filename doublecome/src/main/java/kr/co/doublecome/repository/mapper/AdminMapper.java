package kr.co.doublecome.repository.mapper;

import java.util.List;

import kr.co.doublecome.repository.vo.SearchUser;
import kr.co.doublecome.repository.vo.User;

public interface AdminMapper {
	public List<User> selectUserForAdmin(SearchUser su);
}
