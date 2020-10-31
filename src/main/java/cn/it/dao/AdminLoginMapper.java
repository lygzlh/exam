package cn.it.dao;

import org.apache.ibatis.annotations.Param;


public interface AdminLoginMapper {

	Integer isAdminExist(@Param("username") String username,@Param("password") String password);
}
