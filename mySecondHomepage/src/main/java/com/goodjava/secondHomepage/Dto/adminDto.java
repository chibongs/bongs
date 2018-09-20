package com.goodjava.secondHomepage.Dto;

import java.util.Date;

public class adminDto {
	private Integer adminId;
	private String adminTitle;
	private String adminContent;
	private String adminName;
	private Integer adminHit;
	private Date adminDate;
	
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminTitle() {
		return adminTitle;
	}
	public void setAdminTitle(String adminTitle) {
		this.adminTitle = adminTitle;
	}
	public String getAdminContent() {
		return adminContent;
	}
	public void setAdminContent(String adminContent) {
		this.adminContent = adminContent;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public Integer getAdminHit() {
		return adminHit;
	}
	public void setAdminHit(Integer adminHit) {
		this.adminHit = adminHit;
	}
	public Date getAdminDate() {
		return adminDate;
	}
	public void setAdminDate(Date adminDate) {
		this.adminDate = adminDate;
	}
	
	
}
