package cn.it.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.AdminLoginMapper;
import cn.it.service.AdminLoginService;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{

	@Autowired
	private AdminLoginMapper adminLoginMapper;
	
	
	
	public void setAdminLoginMapper(AdminLoginMapper adminLoginMapper) {
		this.adminLoginMapper = adminLoginMapper;
	}



	@Override
	public boolean findAdmin(String username, String password) {
		// TODO Auto-generated method stub
		return adminLoginMapper.isAdminExist(username, password)>0;
	}

}
