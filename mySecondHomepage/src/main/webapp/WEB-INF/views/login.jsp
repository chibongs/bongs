<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">  
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/blue.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.min.css">

	<title>BONG's | LOG IN</title>
	
</head>
<body class="hold-transition login-page">
	<div class="login-box" align="center">
		<div class="login-logo">
			<h1 align="center">
				<b>BONG's </b>Homepage
			</h1>
		</div>
		<div class="login-box-body">
			<form action="loginOk.do" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="GMId" placeholder="Id" />
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="GMPw" class="form-control" placeholder="password" />
				</div>
				<c:if test="${error=='error'}">
					<div class="form-group has-feedback" style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
				</c:if>
				<c:if test="${error=='logout'}">
					<div class="form-group has-feedback" style="color: red">로그아웃 되셨습니다.</div>
				</c:if>
				<div align="center">
					<input type="submit" class="btn btn-primary btn-block btn-flat" value="로그인">
				</div>
			</form>
			<div>
				<button type="button" class="btn btn-link btn-flat" onclick="location.href='signUp.do'" style="color:gray">회원 가입</button>
			</div>
		</div>
	</div>
<!-- 	<script>
//글쓰기
function fn_write(){
    
    var form = document.getElementById("boardForm");
    
    form.action = "<c:url value='/board/writeForm.do'/>";
    form.submit();
    
}
 
//글조회
function fn_view(code){
    
    var form = document.getElementById("boardForm");
    var url = "<c:url value='/board/viewContent.do'/>";
    url = url + "?code=" + code;
    
    form.action = url;    
    form.submit(); 
}
</script> -->
</body>
</html>