<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function page(idx){
		var pagenum = idx;
		var contentnum = $("#contentnum option:selected").val();
		location.href="boardList.do?GMId=${member.get('GMID')}&pagenum="+pagenum+"&contentnum="+contentnum;
	}						
</script>
	
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
			<a href="main.do?GMId=${bName}" class="logo">
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
					<p><b><h4 style="color: white">${member.GMNAME}</h4></b></p>
				</div>
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header"><b>MAIN MENU</b></li>
					<li class="list">
						<a href="adminboardList.do?GMId=${member.GMID}">공지사항</a> 
						<a href="boardList.do?GMId=${member.GMID}">게시판</a>
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
						<h3 class="box-title">자유게시판</h3>
     			  	</div>
       				<div class="box-body container" align="center">
       				</script>
						<div align="right">
							<select name="contentnum" id="contentnum">
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
							</select>개씩 보기
						</div>
						<div align="left">
							<button type="button" class="btn bg-gray btn-sm btn-flat" onclick="location.href='write.do?GMId=${member.GMID}'">글쓰기</button>
						</div>
		     		  	<table class="table table-hover table-striped table-bordered" align="center">
							<thead>
								<tr>
									<th style="width: 10%">번호</th>
									<th style="width: 30%">제목</th>
									<th style="width: 20%">작성자</th>
									<th style="width: 25%">작성시간</th>
									<th style="width: 15%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="bdto">
									<tr>
										<td>${bdto.BID}</td>
										<td>
											<c:forEach begin="1" end="${bdto.BINDENT }">&nbsp;-</c:forEach>
											<a href="content_view.do?bId=${bdto.BID}&bName=${member.GMID}">${bdto.BTITLE}</a>
										</td>
										<td>${bdto.BNAME}</td>
										<td>${bdto.BDATE}</td>
										<td>${bdto.BHIT}</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="5" align="center">
										<c:if test="${page.prev}">
											<a style="text-decoration: none;" href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
										</c:if>
										<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
											<a style="text-decoration: none;" href="javascript:page(${idx})">${idx}</a>
										</c:forEach>	
										<c:if test="${page.next}">
											<a style="text-decoration: none;" href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
										</c:if>
									</td>	
								</tr>
							</tfoot>
						</table>
						<div align="left">
							<button type="button" class="btn btn-link btn-flat" onclick="location.href='main.do?GMId=${member.GMID}'">뒤로</button>
						</div>
      		 		</div>		
				</div>	
			</section>
		</div>	
	</div>
</body>
</html>