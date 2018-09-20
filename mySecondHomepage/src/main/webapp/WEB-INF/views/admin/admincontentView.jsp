<%@page import="com.goodjava.secondHomepage.Dto.BDto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/_all-skins.min.css">

	<title>BONG's | NOTICE</title>
</head>

<body class="hold-transition skin-blue fixed sidebar-mini">
	
	<div class="wrapper">
		<header class="main-header">
			<a href="supermain.do?GMId=${member.get('GMID')}" class="logo">
				<span class="logo-lg"><b>BONG's </b>Homepage</span>
    		</a>

			<nav class="navbar navbar-static-top">
				</li>
					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<li class="dropdown user user-menu"><a href="logout.do">로그아웃</a></li>
						</ul>
					</div>
			</nav> 
		</header>

		<aside class="main-sidebar"> 
			<section class="sidebar">
				<div class="user-panel">
					<p> <b><h4 style="color: white">${member.get('GMNAME')}</h4></b></p>
				</div>
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header"><b>MAIN MENU</b></li>
					<li class="list">
						<a href="adminboardList.do?GMId=${member.get('GMID')}">공지사항</a> 
						<a href="boardList.do?GMId=${member.get('GMID')}">게시판</a> 
						<a href="allGMinfo.do?GMId=${member.get('GMID')}">회원정보</a>
					</li>
				</ul>
			</section> 
		</aside>

		<div class="content-wrapper" style="overflow: auto; max-height: 100vh;">
			<section class="content-header">
				<h1>MEMBER Notice</h1>
			</section>

			<section class="content">
				<div class="box box-solid box-primary">
					<div class="box-header" align="center">
						<h3 class="box-title">공지사항</h3>
     			  	</div>
       				<div class="box-body container" align="center">
						<form action="adminmodify.do" method="post">
							<input type="hidden" name="adminId" value="${adminDto.ADMINID}">
							<div align="left">
								<input type="submit" class="btn bg-gray btn-sm btn-flat" value="수정">
								<button type="button" class="btn bg-gray btn-sm btn-flat" onclick="location.href='admindelete.do?adminName=${adminDto.ADMINNAME}&adminId=${adminDto.ADMINID}'">삭제</button>&nbsp; 
							</div>
			     		  	<table class="table table-striped table-bordered" align="center">
								<tr>
									<th colspan="6" align="center">${adminDto.ADMINID}.${adminDto.ADMINTITLE}</th>
								</tr>
								<tr>
									<th style="width:10%">작성자</th>
									<td style="width:25%">${adminDto.ADMINNAME}</td>
									<th style="width:10%">작성시간</th>
									<td style="width:35%">${adminDto.ADMINDATE}</td>
									<th style="width:10%">조회수</th>
									<td style="width:10%">${adminDto.ADMINHIT}</td>
								</tr>
								<tr>
									<td colspan="6">${adminDto.ADMINCONTENT}</td>							
								</tr>
							</table>
						</form>
						<div align="left">
							<button type="button" class="btn btn-link btn-flat" onclick="location.href='adminboardList.do?GMId=${member.get('GMID')}'">뒤로</button>
						</div>
      		 		</div>		
				</div>	
			</section>
		</div>	
	</div>
</body>
</html>