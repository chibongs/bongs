<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<a href="main.do?GMId=${bName }" class="logo">
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
						<c:choose>
							<c:when test="${member.GMID eq 'admin'}">
								<a href="allGMinfo.do?GMId=${member.get('GMID')}">회원정보</a>
							</c:when> 
							<c:when test="${member.GMID ne 'admin'}">
								<a href="GMinfo.do?GMId=${member.GMID}">내정보</a>
							</c:when> 
						</c:choose>	
					</li>
				</ul>
			</section> 
		</aside>

		<div class="content-wrapper" style="overflow: auto; max-height: 100vh;">
			<section class="content-header">
				<h1>Free Board</h1>
			</section>

			<section class="content">
				<div class="box box-solid box-primary">
					<div class="box-header" align="center">
						<h3 class="box-title">게시물 작성</h3>
     			  	</div>
       				<div class="box-body container" align="center">
						<form action="writeOk.do" method="post">
							<input type=hidden name="bName" value="${member.get('GMID')}">
							<div align="left">
								<input type="submit" class="btn bg-gray btn-sm btn-flat" value="글쓰기">
							</div>
			     		  	<table class="table table-striped table-bordered" align="center">
								<tr>
									<th>
										<textarea class="textarea" name="bTitle" placeholder="제목을 작성해 주십시오."
                          				style="width: 100%; height: 40px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
									</th>
								</tr>
								<tr>
									<td>
									<textarea class="textarea" name="bContent" placeholder="내용을 작성해 주십시오."
                          				style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
									</td>							
								</tr>
							</table>
						</form>
						<div align="left">
							<button type="button" class="btn btn-link btn-flat" onclick="location.href='boardList.do?GMId=${bName}'">뒤로</button>
						</div>
      		 		</div>		
				</div>	
			</section>
		</div>	
	</div>
</body>
</html>