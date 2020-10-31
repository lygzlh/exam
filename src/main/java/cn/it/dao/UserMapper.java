package cn.it.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.it.domain.Admin;
import cn.it.domain.User;

public interface UserMapper {
	
	List<User> findAll(@Param("cpage") Integer cpage);
	 List<User> findAllByName(@Param("name") String name,@Param("cpage") Integer cpage);
	User findOneByName(@Param("username") String userName);
	Integer addOne(@Param("user") User user);
	Integer delUserById(@Param("cid") Integer cid);
	Integer countUserNum(@Param("name") String name);
	Integer updateUser(@Param("user") User user);
	Integer changeInfo(@Param("id") Integer id,@Param("nickname") String nickname,@Param("phone") String phone,@Param("gender") String gender);
	Integer changePassword(@Param("id") Integer id,@Param("newPassword") String newPassword);
	Integer isExistsUser(@Param("username") String username);
	
	Integer adminChangePassword(@Param("npwd")  String nPwd);
	Admin adminPwdIsRight(@Param("pwd") String pwd);
}
