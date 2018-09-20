package com.goodjava.secondHomepage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodjava.secondHomepage.Dto.BDto;
import com.goodjava.secondHomepage.iDao.iBDao;

@Service
public class BoardService {

	@Autowired
	private iBDao BDao;
	
	public List<HashMap<String, Object>> AllList(int pagenum, int contentnum){
		System.out.println("service_AllList()");
		return BDao.AllList(pagenum, contentnum); 
	}
	
	public HashMap<String, Object> selectOne(String bId) {
		System.out.println("service_selectOne()");
		return BDao.selectOne(bId);
	}
	
	public boolean delete(String bId) {
		System.out.println("service_delete()");
		boolean result = false;
			if(BDao.selectOne(bId) == null) {
				result=false;
			} else {	
				BDao.delete(bId);
				result = true;
			}
		return result;
	}
	
	public boolean insert(HashMap<String, Object> params) {
		System.out.println("service_insert()");
		boolean result = false;
		if (params.get("bName")!=""&&params.get("bTitle")!=""&&params.get("bContent")!="") {
			BDao.insert(params);
			result = true;
		}
		return result;
	}
	
	public boolean modify(HashMap<String, Object> params) {
		System.out.println("service_modify()");
		boolean result = false;
		if (params.get("bName") != "" && params.get("bTitle") != ""&&params.get("bContent") != "") {
			BDao.modify(params);
			result = true;
		}
		return result;
	}
	
	public boolean reply(HashMap<String, Object> params) {
		System.out.println("service_reply()");
		boolean result = false;
		if (params.get("bName")!=""&&params.get("bTitle")!=""&&params.get("bContent")!="") {
			replyShape(params);
			BDao.reply(params);
			result = true;
		}
		return result;
	}
	
	public void upHit(HashMap<String, Object> params) {
		System.out.println("service_upHit()");
		//String bId = (String)params.get("bId");
		BDao.uphit(params);
	}
	
	public void replyShape(HashMap<String, Object> params) {
		System.out.println("service_replyShape()");
		BDao.replyShape(params); 
	}

//---------------------------------------------------comment--------------------------------------------------------------------
	
	public void insertComment(HashMap<String, Object> params) {
		System.out.println("service_insertComment()");
		BDao.insertComment(params);
	}
	
	public List<HashMap<String, Object>> commentList(String commentId){
		System.out.println("service_commentList()");
		return BDao.commentList(commentId); 
	}
	
	public void commentDel(HashMap<String, Object> params) {
		System.out.println("service_commentDel()");
		BDao.commentDel(params);
	}
	
	public void commentAllDel(String commentId) {
		System.out.println("service_commentAllDel()");
		BDao.commentAllDel(commentId);
	}
	
//---------------------------------------------------admin--------------------------------------------------------------------
	
	public List<HashMap<String, Object>> adminAllList(){
		System.out.println("service_adminAllList()");
		return BDao.adminAllList(); 
	}
	
	public HashMap<String, Object> adminselectOne(String adminId) {
		System.out.println("service_adminselectOne()");
		return BDao.adminselectOne(adminId);
	}
	
	public boolean admindelete(String adminId) {
		System.out.println("service_admindelete()");
		boolean result = false;
		if(BDao.adminselectOne(adminId) == null) {
			result=false;
		} else {	
			BDao.admindelete(adminId);
			result = true;
		}
		return result;
	}
	
	public boolean admininsert(HashMap<String, Object> params) {
		System.out.println("service_admininsert()");
		boolean result = false;
		if (params.get("adminName")!=""&&params.get("adminTitle")!=""&&params.get("adminContent")!="") {
			BDao.admininsert(params);
			result = true;
		}
		return result;
	}
	
	public boolean adminmodify(HashMap<String, Object> params) {
		System.out.println("service_adminmodify()");
		boolean result = false;
		if (params.get("adminName") != "" && params.get("adminTitle") != ""&&params.get("adminContent") != "") {
			BDao.adminmodify(params);
			result = true;
		}
		return result;
	}
	
	public void adminupHit(String adminId) {
		System.out.println("service_adminupHit()");
		//String bId = (String)params.get("bId");
		BDao.adminupHit(adminId);
	}

	public int pagingcount() {
		System.out.println("pagingcount()");
		return BDao.pagingcount();
	}
}
