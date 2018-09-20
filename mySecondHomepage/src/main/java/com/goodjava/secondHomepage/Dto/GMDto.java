package com.goodjava.secondHomepage.Dto;

import java.util.Date;

public class GMDto {
	private String GMId;
	private String GMPw;
	private String GMName;
	private String GMAdress;
	private String GMPhone;
	private String GMPhone2;
	private String GMPhone3;
	private Date SIGNUPDate;
	
	public String getGMId() {
		return GMId;
	}
	public void setGMId(String gMId) {
		GMId = gMId;
	}
	public String getGMPw() {
		return GMPw;
	}
	public void setGMPw(String gMPw) {
		GMPw = gMPw;
	}
	public String getGMName() {
		return GMName;
	}
	public void setGMName(String gMName) {
		GMName = gMName;
	}
	public String getGMAdress() {
		return GMAdress;
	}
	public void setGMAdress(String gMAdress) {
		GMAdress = gMAdress;
	}
	public String getGMPhone() {
		return GMPhone;
	}
	public void setGMPhone(String gMPhone) {
		GMPhone = gMPhone;
	}
	public String getGMPhone2() {
		return GMPhone2;
	}
	public void setGMPhone2(String gMPhone2) {
		GMPhone2 = gMPhone2;
	}
	public String getGMPhone3() {
		return GMPhone3;
	}
	public void setGMPhone3(String gMPhone3) {
		GMPhone3 = gMPhone3;
	}
	public Date getSIGNUPDate() {
		return SIGNUPDate;
	}
	public void setSIGNUPDate(Date sIGNUPDate) {
		SIGNUPDate = sIGNUPDate;
	}
	@Override
	public String toString() {
		return "GMDto [GMId=" + GMId + ", GMPw=" + GMPw + ", GMName=" + GMName + ", GMAdress=" + GMAdress + ", GMPhone="
				+ GMPhone + ", GMPhone2=" + GMPhone2 + ", GMPhone3=" + GMPhone3 + ", SIGNUPDate=" + SIGNUPDate + "]";
	}
	
	
}
