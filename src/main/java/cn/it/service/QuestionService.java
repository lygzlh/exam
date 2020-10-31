package cn.it.service;

import java.util.List;

import cn.it.domain.Category;
import cn.it.domain.Question;

public interface QuestionService {
	
	List<Question> findAll(Integer page);
	List<Question> findOneById(Integer id);
	List<Question> randomQuestion(Integer user,Integer cate);
	List<Question> randomWrongQuestion(Integer user,Integer cate);
	boolean updataQuestion(Question question);
	boolean insertQuestion(Question question);
	boolean deleteQuestion(Integer nid);
	boolean rightQuestion(Integer user,Integer qid,Integer rightOrWrong);
	boolean wrongQuestionHandle(Integer user,Integer qid);
	boolean resetQuestion(Integer user,Integer cate);
	Integer rwQuestionCount(Integer right,Integer wrong,Integer uid,Integer cid);
	List<Question> findQuestionByTitle(String title,Integer cate,Integer page);
	List<Category> findAllCategory();
	String findCategoryById(Integer cid);
	boolean insertCategory(String name);
	Integer countQuestionNum(String title,Integer cate);
	Integer countWrongQuestionNum(String title,Integer cate,Integer uid);
	Integer countFinishQuestion(String title,Integer cate,Integer uid);
	boolean deleteCategory(Integer cid);
	boolean changeCategory(Integer cid,String name);
}
