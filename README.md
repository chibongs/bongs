개인 홈페이지를 개발하였습니다.
들어간 기술로는
프레임 워크 : ***springframework***, DB : ***oracle***, server : ***Tomcat v9.0***
사용된 언어 : ***java***, ***jsp***, ***css***, ***javascript***
가 있습니다.
DB는 mybatis를 이용하여 용이하게 접근하도록 하였습니다.

##주요 기능

>로그인 시 일반사용자와 관리자의 **구별** 

(controller)

'''java:
if(GMService.searchGMId((String)params.get("GMId"),(String)params.get("GMPw"))&&!((String)params.get("GMId")).equals("admin")) {
	session.setAttribute("GMId", (String)params.get("GMId"));
	session.setAttribute("member", GMService.getGMMember((String)params.get("GMId")));
	mav.setViewName("redirect:main.do");
}  else if(GMService.searchGMId((String)params.get("GMId"),(String)params.get("GMPw"))&&((String)params.get("GMId")).equals("admin")) {
	session.setAttribute("member", GMService.getGMMember((String)params.get("GMId")));
	session.setAttribute("GMId", (String)params.get("GMId"));
	mav.setViewName("redirect:supermain.do");
} else {
	session.setAttribute("error", "error");
	mav.setViewName("redirect:login.do");
}
'''

>로그인 시 session을 이용하여 데이터가 제대로 들어갔나 확인 후 메세지 표시

(controller)

'''java:
if(session.getAttribute("error")==null) {
	session.setAttribute("error", "NoError");
} else if(((String)session.getAttribute("error")).equals("error")) {
	session.setAttribute("error", "error");
} else if(((String)session.getAttribute("error")).equals("logout")){
	session.setAttribute("error", "logout");
} else {
	session.setAttribute("error", "NoError");
}
'''
(view)
'''html:
<c:if test="${error=='error'}">
	<div class="form-group has-feedback" style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
</c:if>
<c:if test="${error=='logout'}">
	<div class="form-group has-feedback" style="color: red">로그아웃 되셨습니다.</div>
</c:if>
'''

>게시판 **댓글** 구현

(controller)

게시판 data의 게시판 번호를 댓글 data의 댓글 번호에 저장을 해서 같은 내용 내에  불러올 수 있게 하였다. 

'''java:
String commentId = (String)params.get("commentId"); //게시판 번호
String commentName = (String)params.get("commentName"); //댓글을 작성한 Id
bService.insertComment(params);
	
HashMap<String, Object> contentparams=bService.selectOne(commentId);
mav.addObject("bDto", contentparams);
mav.addObject("commentboard", bService.commentList(commentId));
session.setAttribute("member", GMService.getGMMember(commentName));
System.out.println("BNAME="+((String)contentparams.get("BNAME"))+", GMId="+commentName);
if(((String)contentparams.get("BNAME")).equals(commentName)) {//작성자와 접속자 Id가 동일한지 확인
	mav.setViewName("board/contentView");
} else {
	mav.setViewName("board/otherUsersContentView");
}
'''
(view_댓글 화면)

'''html:
<c:forEach items="${commentboard}" var="comment">
	<div class="box-footer box-comments container" style="width:50%">
		<div class="box-comment">
			<div class="comment-text" align="left">
				<span class="username">
					${comment.COMMENTNAME}
				<span class="text-muted pull-right">${comment.COMMENTDATE}</span>
				</span>
				<span class="row" align="left">
					${comment.COMMENTCONTENT}
					<span class="pull-right">
						<c:if test="${comment.COMMENTNAME eq member.GMID}">
							<form action="commentDel.do" method="post">
								<input type="hidden" name="commentId" value="${comment.COMMENTID}">
								<input type="hidden" name="commentName" value="${comment.COMMENTNAME}">
								<input type="hidden" name="commentContent" value="${comment.COMMENTCONTENT}">
								<input type="hidden" name="commentDate" value="${comment.COMMENTDATE}">
								<input type="submit" class="btn btn-link btn-sm" value="X">												</form>
							</form>
						</c:if>
					</span>	
				</span>
			</div>
		</div>
	</div>
</c:forEach>
'''
(view_댓글 작성)

'''html:
<form action="comment.do" method="post">
	<input type="hidden" name="commentId" value="${bDto.BID}">
	<input type="hidden" name="commentName" value="${member.get('GMID')}">
	<div class="img-push">
		<input type="text" name="commentContent" class="form-control input-sm" placeholder="댓글을 입력하신 후 엔터키를 눌러 주세요.">
	</div>
</form>
'''

>게시판 **답글** 구현

답글을 구현하기 위해 본문과 답글을 묶어주는 데이터와 답글의 깊이를 나타내주는 데이터와 리스트에서 답글을 표시해주는 데이터를 게시판DB를 생성할 때 같이 생성하였습니다.

(mybatis_mapper)_답글저장

'''xml:
<insert id="reply" parameterType="java.util.HashMap">
	INSERT INTO MULTIPURPOSEBOARD(bId, bTitle, bContent, bName, bHit, bGroup, bStep, bIndent, bDate) VALUES(boardsequence.nextval, #{bTitle}, #{bContent}, #{GMId}, 0, #{bGroup}, #{bStep}+1, #{bIndent}+1, SYSDATE )
</insert>
'''

게시판 목록에는 계속해서 번호를 늘리기 위해서 시쿼스를 계속 이용하였고 본문과 묶여지는 데이터는 그대로 가져다 쓰고 답글의 깊이와 게시판 이름에 댓글을 표시해주는 데이터는 1씩 추가하였습니다.

(mybatis_mapper)_답글의 깊이 확인
'''xml:
<update id="replyShape" parameterType="java.util.HashMap">
	UPDATE MULTIPURPOSEBOARD SET BSTEP=BSTEP+1 WHERE BGROUP=#{bGroup} AND BSTEP>#{bStep}
</update>
'''
본문과 같이 묵여있는 답글이고 답글의 깊이를 확인한 후 답글임이 확인 되면 깊이를 1더해준다.

>게시판 **페이지네이션** 구현

>관리자만 들어갈 수 있는 공지사항 구현

>관리자만 확인하는 회원정보 구현
