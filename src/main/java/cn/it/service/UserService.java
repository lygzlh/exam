package cn.it.service;

import java.util.List;

import cn.it.domain.Admin;
import cn.it.domain.User;

public interface UserService {
	
	List<User> findAll(Integer cpage);
	List<User> findAllByName(String name,Integer cpage);
	User findOneByName(String userName);
	boolean insert(User user);
	boolean delUserById(Integer cid);
	Integer countUserNum(String name);
	boolean updateUser(User user);
	boolean changeInfo(Integer id,String nickname,String phone,String gender);
	boolean changePassword(Integer id,String newPassword);
	boolean isExistsUser(String username);
	
	boolean adminChangePassword(String nPwd);
	Admin adminPwdIsRight(String pwd);
}
