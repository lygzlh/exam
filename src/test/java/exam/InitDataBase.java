package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;



public class InitDataBase {
    private static final String url = "jdbc:mysql://localhost:3306/test";
    private static final String name = "com.mysql.jdbc.Driver";
    private static final String username = "root";
    private static final String password = "lin000";
	
    @Test
	public void dbManager() throws SQLException {
		String sql ="CREATE table question(\r\n" + 
				"id integer primary key auto_increment,\r\n" + 
				"title varchar(255) not null,\r\n" + 
				"answerA VARCHAR(255) not null,\r\n" + 
				"answerB VARCHAR(255) not null,\r\n" + 
				"answerC VARCHAR(255) not null,\r\n" + 
				"answerD VARCHAR(255) not null,\r\n" + 
				"rightAnswer VARCHAR(255) not null\r\n" + 
				")";
		
		String sql1 = "create table userinfo("
				+ "id integer primary key auto_increment,"
				+ "username varchar(16) not null,"
				+ "password varchar(16) not null)";
		
		String sql2 = "create table admin("
				+ "id integer primary key auto_increment,"
				+ "username varchar(16) not null,"
				+ "password varchar(16) not null)";
		
		String sql3 = "insert into question(title,answerA,answerB,answerC,answerD,rightAnswer) \r\n" + 
				"values('题目1','A. 答案1','B. 答案1','C. 答案1','D. 答案1','A'),\r\n" + 
				"('题目2','A. 答案1','B. 答案1','C. 答案1','D. 答案1','B'),\r\n" + 
				"('题目3','A. 答案1','B. 答案1','C. 答案1','D. 答案1','C'),\r\n" + 
				"('题目4','A. 答案1','B. 答案1','C. 答案1','D. 答案1','D'),\r\n" + 
				"('题目5','A. 答案1','B. 答案1','C. 答案1','D. 答案1','A')";
		
		String sql4 = "insert into admin(username,password) values('root','root')";
		
		Connection connection = null;
		Statement statement = null;
		try {
			Class.forName(name);
			connection = DriverManager.getConnection(url, username, password);
            statement = connection.createStatement();
			statement.execute(sql);
			statement.execute(sql1);
			statement.execute(sql2);
			statement.execute(sql3);
			statement.execute(sql4);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			connection.close();
			statement.close();
		}
		
		
		
	}
	
	
}
