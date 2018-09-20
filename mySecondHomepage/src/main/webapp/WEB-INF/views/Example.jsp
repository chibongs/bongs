<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

<script type="text/javascript">
	function page(idx){
		var pagenum = idx;
		var contentnum = ${"#contentnum option:selected"}.val();//안해도 될수도
		location.href="boardList.do?GMId=${member.get('GMID')}&pagenum="+pagenum+"&contentnum="+contentnum;	
	}

</script>
	<select name="contentnum" id="contentnum">
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
	</select>
	
	
	<td colspan="2">
		<c:if test="${page.prev}">
			<a style="text-decoration: none;" href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
		</c:if>
		<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
			<a style="text-decoration: none;" href="javascript:page(${idx});">${idx}</a>
		</c:forEach>	
		<c:if test="${page.next}">
			<a style="text-decoration: none;" href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
		</c:if>
	</td>	
</body>
</html>
