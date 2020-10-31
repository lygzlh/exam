package cn.it.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import cn.it.dao.QuestionMapper;
import cn.it.domain.User;


public class test {

	public static void main(String[] args) throws IOException {
        InputStream in = Resources.getResourceAsStream("mybatis/mysqlConfig.xml");
        // ����SqlSessuibFactory����
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        // ͨ���Ự���������Ự
        SqlSession session = factory.openSession();
        //��ȡ�������
        QuestionMapper dao = session.getMapper(QuestionMapper.class);


	}
}
