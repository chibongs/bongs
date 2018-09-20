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

	<title>BONG's | BOARD</title>
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
						<c:choose>
							<c:when test="${member.get('GMID') eq 'admin'}">
								<a href="allGMinfo.do?GMId=${member.get('GMID')}">회원정보</a>
							</c:when> 
							<c:when test="${member.get('GMID') ne 'admin'}">
								<a href="GMinfo.do?GMId=${member.get('GMID')}">내정보</a>
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
						<h3 class="box-title">자유게시판</h3>
     			  	</div>
       				<div class="box-body container" align="center">
			     		<table class="table table-striped table-bordered" align="center">
			     			<div align="left">
			     				<button type="button" class="btn bg-gray btn-sm btn-flat" onclick="location.href='reply.do?bId=${bDto.BID}&bName=${member.get('GMID')}'">답글</button>
			     			</div>
							<tr>
								<th colspan="6" align="center">${bDto.BID}.${bDto.BTITLE}</th>
							</tr>
							<tr>
								<th style="width:10%">작성자</th>
								<td style="width:25%">${bDto.BNAME}</td>
								<th style="width:10%">작성시간</th>
								<td style="width:35%">${bDto.BDATE}</td>
								<th style="width:10%">조회수</th>
								<td style="width:10%">${bDto.BHIT}</td>
							</tr>
							<tr>
								<td colspan="6">${bDto.BCONTENT}</td>							
							</tr>
							
						</table>
						<div align="left">
							<button type="button" class="btn btn-link btn-flat" onclick="location.href='boardList.do?GMId=${member.get('GMID')}'">뒤로</button>
						</div>
						<div class="box-footer container" style="width:50%">
							<form action="comment.do" method="post">
								<input type="hidden" name="commentId" value="${bDto.BID}">
								<input type="hidden" name="commentName" value="${member.get('GMID')}">
			                	<div class="img-push">
									<input type="text" name="commentContent" class="form-control input-sm" placeholder="댓글을 입력하신 후 엔터키를 눌러 주세요.">
									<!-- <input type="submit" class="btn bg-gray btn-sm" value="댓글달기"> -->
								</div>
							</form>
						</div>
						<c:forEach items="${commentboard }" var="comment">
							<div class="box-footer box-comments container" style="width:50%">
								<div class="box-comment">
									<div class="comment-text" align="left">
										<span class="username">
					                        ${comment.COMMENTNAME}
											<span class="text-muted pull-right">${comment.COMMENTDATE}</span>
										</span><!-- /.username -->
										<span class="row" align="left">
											${comment.COMMENTCONTENT}
											<span class="pull-right">
												<c:if test="${comment.COMMENTNAME eq member.GMID}">
													<%-- <a href="commentDel.do?commentId=${comment.COMMENTID}&commentName=${comment.COMMENTNAME}&commentContent=${comment.COMMENTCONTENT}&commentDate=${comment.COMMENTDATE}">x</a> --%>
													<form action="commentDel.do" method="post">
														<input type="hidden" name="commentId" value="${comment.COMMENTID}">
														<input type="hidden" name="commentName" value="${comment.COMMENTNAME}">
														<input type="hidden" name="commentContent" value="${comment.COMMENTCONTENT}">
														<input type="hidden" name="commentDate" value="${comment.COMMENTDATE}">
														<input type="submit" class="btn btn-link btn-sm" value="X">
													</form>
												</c:if>
											</span>	
										</span>
									</div>
								</div>
							</div>
						</c:forEach>	
      		 		</div>		
				</div>	
			</section>
		</div>	
	</div>
</body>
</html>