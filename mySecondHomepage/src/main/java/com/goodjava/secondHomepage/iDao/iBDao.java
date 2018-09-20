package com.goodjava.secondHomepage.iDao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.goodjava.secondHomepage.Dto.BDto;

public interface iBDao {
	public List<HashMap<String, Object>> AllList(int pagenum, int contentnum);
	public HashMap<String, Object> selectOne(String bId); 
	public void delete(String bId);
	public void insert(HashMap<String, Object> params);
	public void modify(HashMap<String, Object> params);
	public void uphit(HashMap<String, Object> params);
	public void reply(HashMap<String, Object> params);
	public void replyShape(HashMap<String, Object> params);

	public void insertComment(HashMap<String, Object> params);
	public List<HashMap<String, Object>> commentList(String commentId);
	public void commentDel(HashMap<String, Object> params);
	public void commentAllDel(String commentId);

	public List<HashMap<String, Object>> adminAllList();
	public HashMap<String, Object> adminselectOne(String adminId); 
	public void admindelete(String adminId);
	public void admininsert(HashMap<String, Object> params);
	public void adminmodify(HashMap<String, Object> params);
	public void adminupHit(String adminId);
	
	public int pagingcount();
}
