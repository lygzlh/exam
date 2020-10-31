package cn.it.domain;

public class Progress {
	private Category cate;
	private Integer qnum;
	private Integer wnum;
	private Integer rnum;
	
	public Progress(Category cate, Integer qnum, Integer wnum,Integer rnum) {
		this.cate = cate;
		this.qnum = qnum;
		this.wnum = wnum;
		this.rnum = rnum;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

	public Integer getQnum() {
		return qnum;
	}

	public void setQnum(Integer qnum) {
		this.qnum = qnum;
	}

	public Integer getWnum() {
		return wnum;
	}

	public void setWnum(Integer wnum) {
		this.wnum = wnum;
	}

	public Integer getRnum() {
		return rnum;
	}

	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "Progress [cate=" + cate + ", qnum=" + qnum + ", wnum=" + wnum + ", rnum=" + rnum + "]";
	}

	
}
