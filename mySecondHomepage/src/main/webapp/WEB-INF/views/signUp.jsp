<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">  
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/blue.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/AdminLTE.min.css">

	<title>BONG's | SIGN UP</title>

</head>
<body class="hold-transition register-page">
<div class="register-box">
	<div class="register-logo">
			<h1 align="center">
				<b>BONG's </b>Homepage
			</h1>
	</div>
	<div class="register-box-body">
	<form action="signUpConfig.do" method="post">
		<div class="form-group">	
			<input type="text" name="GMId" class="form-control" placeholder="id">
		</div>
		<div class="form-group">	
			<input type="password" name="GMPw" class="form-control" placeholder="password">
		</div>
		<div class="form-group">	
			<input type="password" name="GMPw_check" class="form-control" placeholder="password_check">
		</div>
		<div class="form-group">	
			<input type="text" name="GMName" class="form-control" placeholder="name">
		</div>
		<div class="form-group">	
				<select name="GMAdress" class="form-control">
						<option value="광주광역시">광주광역시</option>
						<option value="대구광역시">대구광역시</option>
						<option value="대전광역시">대전광역시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="서울특별시">서울특별시</option>
						<option value="울산광역시">울산광역시</option>
						<option value="인천광역시">인천광역시</option>
				</select>
		</div>
		<div class="row">
			<div class="col-xs-4">	
				<select name="GMPhone" class="form-control">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="019">019</option>
				</select>
			</div>
			<div class="col-xs-4">
				<input type="text" name="GMPhone2" class="form-control" placeholder="0000">
			</div> 	 
			<div class="col-xs-4">
				<input type="text" name="GMPhone3" class="form-control" placeholder="0000">
			</div>
		</div>
		<br/>
		<div align="center">
			<input type="submit" class="btn btn-primary btn-block btn-flat" value="회원가입">
		</div>
		<div align="center">
			<button type="button" class="btn btn-link btn-flat" onclick="javascript:location.href='login.do'" style="color:gray">취소</button>
		</div>
	</form>
	</div>
</div>
</body>
</html>