package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.QuestionMapper;
import cn.it.domain.Category;
import cn.it.domain.Question;
import cn.it.service.QuestionService;


@Service("problemService")
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionMapper questionMapper;

	public void setProblemMapper(QuestionMapper questionMapper) {
		this.questionMapper = questionMapper;
	}

	@Override
	public List<Question> findOneById(Integer id) {
		// TODO Auto-generated method stub
		return questionMapper.findOneById(id);
	}

	@Override
	public boolean updataQuestion(Question question) {
		// TODO Auto-generated method stub
		return questionMapper.updataQuestion(question)>0;
	}

	@Override
	public boolean insertQuestion(Question question) {
		// TODO Auto-generated method stub
		return questionMapper.insertQuestion(question)>0;
	}

	@Override
	public boolean deleteQuestion(Integer nid) {
		// TODO Auto-generated method stub
		return questionMapper.deleteQuestion(nid)>0;
	}

	@Override
	public List<Question> findQuestionByTitle(String title,Integer cate,Integer page) {
		// TODO Auto-generated method stub
		return questionMapper.findQuestionByTitle(title,cate,page);
	}

	@Override
	public List<Question> findAll(Integer page) {
		// TODO Auto-generated method stub
		return questionMapper.findAll(page);
	}

	@Override
	public List<Question> randomQuestion(Integer user,Integer cate) {
		// TODO Auto-generated method stub
		return questionMapper.randomQuestion(user,cate);
	}

	@Override
	public boolean rightQuestion(Integer user, Integer qid, Integer rightOrWrong) {
		// TODO Auto-generated method stub
		return questionMapper.rightQuestion(user, qid,rightOrWrong)>0;
	}

	@Override
	public List<Category> findAllCategory() {
		// TODO Auto-generated method stub
		return questionMapper.findAllCategory();
	}

	@Override
	public boolean insertCategory(String name) {
		// TODO Auto-generated method stub
		return questionMapper.insertCategory(name)>0;
	}

	@Override
	public Integer countQuestionNum(String title,Integer cate) {
		// TODO Auto-generated method stub
		return questionMapper.countQuestionNum(title,cate);
	}

	@Override
	public Integer countFinishQuestion(String title, Integer cate,Integer uid) {
		// TODO Auto-generated method stub
		return questionMapper.countFinishQuestion(title, cate,uid);
	}

	@Override
	public boolean wrongQuestionHandle(Integer user, Integer qid) {
		// TODO Auto-generated method stub
		return questionMapper.wrongQuestionHandle(user, qid)>0;
	}

	@Override
	public Integer rwQuestionCount(Integer right, Integer wrong,Integer uid,Integer cid) {
		// TODO Auto-generated method stub
		return questionMapper.rwQuestionCount(right, wrong, uid,cid);
	}

	@Override
	public String findCategoryById(Integer cid) {
		// TODO Auto-generated method stub
		return questionMapper.findCategoryById(cid);
	}

	@Override
	public List<Question> randomWrongQuestion(Integer user, Integer cate) {
		// TODO Auto-generated method stub
		return questionMapper.randomWrongQuestion(user, cate);
	}

	@Override
	public Integer countWrongQuestionNum(String title, Integer cate, Integer uid) {
		// TODO Auto-generated method stub
		return questionMapper.countWrongQuestionNum(title, cate, uid);
	}

	@Override
	public boolean resetQuestion(Integer user, Integer cate) {
		// TODO Auto-generated method stub
		return questionMapper.resetQuestion(user, cate)>0;
	}

	@Override
	public boolean deleteCategory(Integer cid) {
		// TODO Auto-generated method stub
		return questionMapper.deleteCategory(cid)>0;
	}

	@Override
	public boolean changeCategory(Integer cid, String name) {
		// TODO Auto-generated method stub
		return questionMapper.changeCategory(cid, name)>0;
	}







}
