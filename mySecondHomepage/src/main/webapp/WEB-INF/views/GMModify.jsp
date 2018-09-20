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
						<h3 class="box-title">내 정보 수정</h3>
     			  	</div>
       				<div class="box-body" align="center">
					</div>						
							
							<form action="GMModifyOk.do" method="post">
							<input type="hidden" name="GMId" value=${params.get('GMID')} >
							<table class="type03" align="center">
							    <tr>
							        <th scope="row">아이디</th>
							        <td>${params.get("GMID")}</td>
							    </tr>
							    <tr>
							        <th scope="row">비밀번호</th>
							        <td><input type="password" name="GMPw" size="20"></td>
							    </tr>
							    <tr>
							        <th scope="row">이름</th>
							        <td><input type="text" name="GMName" size="20" value="${params.get('GMNAME')}"></td>
							    </tr>
							    <tr>
							        <th scope="row">주소</th>
							        <td>
										<select name="GMAdress">
											<c:choose>
												<c:when test="${params.get('GMADRESS') eq '광주광역시'}">
													<option value="광주광역시" selected="selected">광주광역시</option>
												</c:when>
												<c:when test="${params.get('GMADRESS') ne '광주광역시'}">
													<option value="광주광역시">광주광역시</option>
												</c:when>
											</c:choose>	
											<c:choose>
												<c:when test="${params.get('GMADRESS') eq '대구광역시'}">
													<option value="대구광역시" selected="selected">대구광역시</option>
												</c:when>
												<c:when test="${params.get('GMADRESS') ne '대구광역시'}">
													<option value="대구광역시">대구광역시</option>
												</c:when>
											</c:choose>	
											<c:choose>
												<c:when test="${params.get('GMADRESS') eq '대전광역시'}">
													<option value="대전광역시" selected="selected">대전광역시</option>
												</c:when>
												<c:when test="${params.get('GMADRESS') ne '대전광역시'}">
													<option value="대전광역시">대전광역시</option>
												</c:when>
											</c:choose>	
											<c:choose>
												<c:when test="${params.get('GMADRESS') eq '부산광역시'}">
													<option value="부산광역시" selected="selected">부산광역시</option>
												</c:when>
												<c:when test="${params.get('GMADRESS') ne '부산광역시'}">
													<option value="부산광역시">부산광역시</option>
												</c:when>
											</c:choose>	
											<c:choose>
												<c:when test="${params.get('GMADRESS') eq '서울특별시'}">
													<option value="서울특별시" selected="selected">서울특별시</option>
												</c:when>
												<c:when test="${params.get('GMADRESS') ne '서울특별시'}">
													<option value="서울특별시">서울특별시</option>
												</c:when>
											</c:choose>	
											<c:choose>
												<c:when test="${params.get('GMADRESS') eq '울산광역시'}">
													<option value="울산광역시" selected="selected">울산광역시</option>
												</c:when>
												<c:when test="${params.get('GMADRESS') ne '울산광역시'}">
													<option value="울산광역시">울산광역시</option>
												</c:when>
											</c:choose>	
											<c:choose>
												<c:when test="${params.get('GMADRESS') eq '인천광역시'}">
													<option value="인천광역시" selected="selected">인천광역시</option>
												</c:when>
												<c:when test="${params.get('GMADRESS') ne '인천광역시'}">
													<option value="인천광역시">인천광역시</option>
												</c:when>
											</c:choose>	
<!-- 											<option value="광주광역시">광주광역시</option>
											<option value="대구광역시">대구광역시</option>
											<option value="대전광역시">대전광역시</option>
											<option value="부산광역시">부산광역시</option>
											<option value="서울특별시">서울특별시</option>
											<option value="울산광역시">울산광역시</option>
											<option value="인천광역시">인천광역시</option> -->
										</select>	
									</td>
							    </tr>
							    <tr>
							        <th scope="row">전화번호</th>
							        <td>
										<select name="GMPhone">
											<c:choose>
												<c:when test="${params.get('GMPHONE') eq '010'}">
													<option value="010" selected="selected">010</option>
												</c:when>
												<c:when test="${params.get('GMPHONE') ne '010'}">
													<option value="010">010</option>
												</c:when>
											</c:choose>		
											<c:choose>
												<c:when test="${params.get('GMPHONE') eq '011'}">
													<option value="011" selected="selected">011</option>
												</c:when>
												<c:when test="${params.get('GMPHONE') ne '011'}">
													<option value="011"">011</option>
												</c:when>
											</c:choose>		
											<c:choose>
												<c:when test="${params.get('GMPHONE') eq '017'}">
													<option value="017" selected="selected">017</option>
												</c:when>
												<c:when test="${params.get('GMPHONE') ne '017'}">
													<option value="017">017</option>
												</c:when>
											</c:choose>		
											<c:choose>
												<c:when test="${params.get('GMPHONE') eq '019'}">
													<option value="019" selected="selected">019</option>
												</c:when>
												<c:when test="${params.get('GMPHONE') ne '019'}">
													<option value="019">019</option>
												</c:when>
											</c:choose>		
										</select> - <input type="text" name="GMPhone2" size="2" value="${params.get('GMPHONE2')}"> - <input type="text" name="GMPhone3" size="2" value="${params.get("GMPHONE3")}">
							        </td>
							    </tr>
							</table>
							<div class="row" align="center">
								<input type="submit" value="정보수정" class="btn bg-gray"> 
								<button type="button" class="btn bg-gray" onclick="location.href='GMPwModify.do?GMId=${params.get('GMID')}'">비밀번호변경</button>
							</div>
							<div align="center">
								<button type="button" class="btn btn-link btn-flat" onclick="location.href='main.do'">취소</button>
							</div>							
							</form>
				
				</div>
			</section>
		</div>
		
	</div>
</body>
</html>
