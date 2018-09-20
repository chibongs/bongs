package com.goodjava.secondHomepage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodjava.secondHomepage.iDao.iGMDao;

@Service
public class GoodMemberService {

	@Autowired
	private iGMDao GMDao;

	public void signUpMember(HashMap<String, Object> params) {
		System.out.println("signUpMember()");
		if (params.get("GMId") != "" && params.get("GMPw") != "" && params.get("GMName") != ""&& params.get("GMPhone2") != "" && params.get("GMPhone3") != "") {
			if (params.get("GMPw").equals(params.get("GMPw_check"))) {
				GMDao.insertMember(params);
			}
		}
	}
	
	public boolean searchGMId(String GMId, String GMPw) {
		System.out.println("searchGMId()");
		boolean config = false;
		HashMap<String, Object> result = GMDao.selectOneGM(GMId);
		if (result == null) {
			config = false;
		} else {
			String serverGMPw = (String)result.get("GMPW");
			if (serverGMPw.equals(GMPw)) {
				config = true;
			} else config = false;
		}
		return config;
	}

	public HashMap<String, Object> getGMMember(String GMId){
		System.out.println("getGMMember()");
		return GMDao.selectOneGM(GMId);
	}
	
	public List<HashMap<String, Object>> allGMMember(){
		System.out.println("allGMMember()");
		return GMDao.allGMMember();
	}
	
	public boolean updateGM(HashMap<String, Object> params) {
		System.out.println("updateGM()");
		boolean config = false;
		HashMap<String, Object> result = GMDao.selectOneGM((String)params.get("GMId"));

		if (result == null) {
			config = false;
		} else {
			String GMPw = (String)params.get("GMPw");
			String serverGMPw = (String)result.get("GMPW");
			if (serverGMPw.equals(GMPw)) {
				GMDao.updateMember(params);
				config = true;
			} else config = false;
		}
		return config;
	}
	
	public boolean updateGMPW(HashMap<String, Object> params) {
		System.out.println("updateGMPW()");
		boolean config = false;
		HashMap<String, Object> result = GMDao.selectOneGM((String)params.get("GMId"));

		String GMId = (String)params.get("GMId");
		String GMPw = (String)params.get("GMPw");
		String serverGMPw = (String)result.get("GMPW");
		String NewGMPw = (String)params.get("NewGMPw");
		String NewGMPw_check = (String)params.get("NewGMPw_check");

		System.out.println("params="+params);
		System.out.println("GMId="+GMId+", GMPw="+GMPw+", NewGMPw="+NewGMPw+", NewGMPw_check="+NewGMPw_check+", serverGMPw="+serverGMPw);
		
		if (serverGMPw.equals(GMPw)) {
			if (NewGMPw.equals(NewGMPw_check)) {
				GMDao.updateMemberPw(NewGMPw, GMId);
				config = true;
			}
		}
		return config;
	}
	
	public void deleteGM(HashMap<String, Object> params) {
		System.out.println("deleteGM()");
		GMDao.deleteGM(params);
	}
}
