package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.UserMapper;
import cn.it.domain.Admin;
import cn.it.domain.User;
import cn.it.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	
	public List<User> findAll(Integer cpage) {
		// TODO Auto-generated method stub
		return userMapper.findAll(cpage);
	}

	public User findOneByName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.findOneByName(userName);
	}

	public boolean insert(User user) {
		// TODO Auto-generated method stub
		try {
			return userMapper.addOne(user)>0;
		}catch(Exception e) {
			return false;
		}
		
		
	}

	@Override
	public Integer countUserNum(String name) {
		// TODO Auto-generated method stub
		return userMapper.countUserNum(name);
	}

	@Override
	public List<User> findAllByName(String name,Integer cpage) {
		// TODO Auto-generated method stub
		return userMapper.findAllByName(name,cpage);
	}

	@Override
	public boolean delUserById(Integer cid) {
		// TODO Auto-generated method stub
		return userMapper.delUserById(cid)>0;
	}

	@Override
	public boolean adminChangePassword(String nPwd) {
		// TODO Auto-generated method stub
		return userMapper.adminChangePassword(nPwd)>0;
	}

	@Override
	public Admin adminPwdIsRight(String pwd) {
		// TODO Auto-generated method stub
		return userMapper.adminPwdIsRight(pwd);
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user)>0;
	}

	@Override
	public boolean changeInfo(Integer id, String nickname, String phone, String gender) {
		// TODO Auto-generated method stub
		return userMapper.changeInfo(id, nickname, phone, gender)>0;
	}

	@Override
	public boolean changePassword(Integer id, String newPassword) {
		// TODO Auto-generated method stub
		return userMapper.changePassword(id, newPassword)>0;
	}

	@Override
	public boolean isExistsUser(String username) {
		// TODO Auto-generated method stub
		return userMapper.isExistsUser(username)>0;
	}

}
