package cn.it.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.it.domain.Category;
import cn.it.domain.Question;
import cn.it.domain.User;


public interface QuestionMapper {
	
	List<Question> findAll(@Param("page") Integer page);
	List<Question> findOneById(@Param("id") Integer id);
	List<Question> randomQuestion(@Param("user") Integer user,@Param("cate") Integer cate);
	List<Question> randomWrongQuestion(@Param("user") Integer user,@Param("cate") Integer cate);
	Integer updataQuestion(@Param("question") Question question);
	Integer insertQuestion(@Param("question") Question question);
	Integer deleteQuestion(@Param("nid") Integer nid);
	Integer rightQuestion(@Param("user") Integer user,@Param("qid") Integer qid,@Param("rightOrWrong") Integer rightOrWrong);
	Integer wrongQuestionHandle(@Param("user") Integer user,@Param("qid") Integer qid);
	Integer rwQuestionCount(@Param("right") Integer right,@Param("wrong") Integer wrong,@Param("uid") Integer uid,@Param("cid") Integer cid);
	Integer resetQuestion(@Param("user") Integer user,@Param("cate") Integer cate);
	List<Question> findQuestionByTitle(@Param("title") String title,@Param("cate") Integer cate,@Param("page") Integer page);
	List<Category> findAllCategory();
	String findCategoryById(@Param("cid") Integer cid);
	Integer insertCategory(@Param("name") String name);
	Integer countQuestionNum(@Param("title") String title,@Param("cate") Integer cate);
	Integer countWrongQuestionNum(@Param("title") String title,@Param("cate") Integer cate,@Param("uid") Integer uid);
	Integer countFinishQuestion(@Param("title") String title,@Param("cate") Integer cate,@Param("uid") Integer uid);
	Integer deleteCategory(@Param("cid") Integer cid);
	Integer changeCategory(@Param("cid") Integer cid,@Param("name") String name);
}
