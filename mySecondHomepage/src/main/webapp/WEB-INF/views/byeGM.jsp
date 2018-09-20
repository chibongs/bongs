<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/_all-skins.min.css">

	<title>BONG's | MODIFY</title>
</head>
<body class="hold-transition skin-blue fixed sidebar-mini">
	
	<div class="wrapper">
		<header class="main-header">
			<a href="main.do" class="logo">
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
					<p> <b><h4 style="color: white">${params.get('GMNAME')}</h4></b></p>
				</div>
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header"><b>MAIN MENU</b></li>
					<li class="list">
						<a href="adminboardList.do?GMId=${params.get('GMID')}">공지사항</a> 
						<a href="boardList.do?GMId=${params.get('GMID')}">게시판</a> 
						<a href="GMinfo.do?GMId=${params.get('GMID')}">내정보</a>
					</li>
				</ul>
			</section> 
		</aside>

		<div class="content-wrapper">
			<section class="content-header">
				<h1>MEMBER Changing Infomation</h1>
			</section>

			<section class="content">
				<div class="box box-solid box-primary">
					<div class="box-header" align="center">
						<h3 class="box-title">회원 탈퇴</h3>
     			  	</div>
       				<div class="box-body" align="center">
						<form action="byeGMOk.do" method="post">
							<input type="hidden" name="GMId" value=${params.get("GMID")}>
		     		  		<table class="type03" align="center">
								<tr>
									<th scope="row">탈퇴 하시겠습니까?</th>
									<td>
										<input type="radio" name="byeGM" value="byeGMOk">예
										<input type="radio" name="byeGM" value="byeGMNo" checked="checked">아니오
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td><input type="password" name="GMPw" size="20"></td>
								</tr>
							</table>
							<div class="row" align="center">
								<input type="submit" value="회원탈퇴" class="btn bg-gray"> 
							</div>
							<div align="center">
								<button type="button" class="btn btn-link btn-flat" onclick="location.href='GMinfo.do?GMId=${params.get('GMID')}'">뒤로</button>
							</div>
						</form>	
      		 		</div>		
				</div>	
			</section>
		</div>	
	</div>
</body>
</html>