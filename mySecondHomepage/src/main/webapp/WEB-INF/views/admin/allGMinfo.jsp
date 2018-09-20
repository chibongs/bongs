<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/_all-skins.min.css">

	<title>BONG's | ALL INFORMATION</title>

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
					<p> <b><h4 style="color: white">${admin.get('GMNAME')}</h4></b></p>
				</div>
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header"><b>MAIN MENU</b></li>
					<li class="list">
						<a href="adminboardList.do?GMId=${admin.get('GMID')}">공지사항</a> 
						<a href="boardList.do?GMId=${admin.get('GMID')}">게시판</a> 
						<a href="allGMinfo.do?GMId=${admin.get('GMID')}">회원정보</a>
					</li>
				</ul>
			</section> 
		</aside>

		<div class="content-wrapper" style="overflow: auto; max-height: 100vh;">
			<section class="content-header">
				<h1>All MEMBER Information</h1>
			</section>

			<section class="content">
				<div class="box box-solid box-primary">
					<div class="box-header" align="center">
						<h3 class="box-title">회원 정보</h3>
     			  	</div>
       				<div class="box-body" align="center" title="Status">
       					<c:forEach items="${members}" var="member">
		     		  		<table class="type03" align="center">
								<tr>
									<td style="width:16%"><b style="color:skyblue">아이디</b></td>
									<td style="width:17%"><b style="color:skyblue">비밀번호</b></td>
									<td style="width:16%"><b style="color:skyblue">이름</b></td>
									<td style="width:17%"><b style="color:skyblue">주소</b></td>
									<td style="width:17%"><b style="color:skyblue">전화번호</b></td>
									<td style="width:17%"><b style="color:skyblue">가입시간</b></td>
								</tr>
								<tr scope="row">
									<td>${member.get("GMID")}</td>
									<td>${member.get("GMPW")}</td>
									<td>${member.get("GMNAME")}</td>
									<td>${member.get("GMADRESS")}</td>
									<td>${member.get("GMPHONE")} - ${member.get("GMPHONE2")} - ${member.get("GMPHONE3")}</td>
									<td>${member.get("SIGNUPDATE")}</td>
								</tr>
							</table>
						</c:forEach>	
						<div align="center">
							<button type="button" class="btn btn-link btn-flat" onclick="location.href='supermain.do'">뒤로</button>
						</div>
      		 		</div>		
				</div>	
			</section>
		</div>	
	</div>
</body>
</html>