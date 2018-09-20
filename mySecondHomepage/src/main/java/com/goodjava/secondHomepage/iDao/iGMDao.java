package com.goodjava.secondHomepage.iDao;

import java.util.HashMap;
import java.util.List;

public interface iGMDao {
	public void insertMember(HashMap<String, Object> params);
	public HashMap<String, Object> selectOneGM(String GMId);
	public List<HashMap<String, Object>> allGMMember();
	public void updateMember(HashMap<String, Object> params);
	public void updateMemberPw(String NewGMPw, String GMId);
	public void deleteGM(HashMap<String, Object> params);

}
