���� Ȩ�������� �����Ͽ����ϴ�.
�� ����δ�
������ ��ũ : ***springframework***, DB : ***oracle***, server : ***Tomcat v9.0***
���� ��� : ***java***, ***jsp***, ***css***, ***javascript***
�� �ֽ��ϴ�.
DB�� mybatis�� �̿��Ͽ� �����ϰ� �����ϵ��� �Ͽ����ϴ�.

##�ֿ� ���
>�α��� �� �Ϲݻ���ڿ� �������� **����** (controller)
'''java
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

>�α��� �� session�� �̿��Ͽ� �����Ͱ� ����� ���� Ȯ�� �� �޼��� ǥ��
(controller)
'''java
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
'''html
<c:if test="${error=='error'}">
	<div class="form-group has-feedback" style="color: red">���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div>
</c:if>
<c:if test="${error=='logout'}">
	<div class="form-group has-feedback" style="color: red">�α׾ƿ� �Ǽ̽��ϴ�.</div>
</c:if>
'''

>�Խ��� **���** ����
(controller)
�Խ��� data�� �Խ��� ��ȣ�� ��� data�� ��� ��ȣ�� ������ �ؼ� ���� ���� ����  �ҷ��� �� �ְ� �Ͽ���. 
'''java
String commentId = (String)params.get("commentId"); //�Խ��� ��ȣ
String commentName = (String)params.get("commentName"); //����� �ۼ��� Id
bService.insertComment(params);
	
HashMap<String, Object> contentparams=bService.selectOne(commentId);
mav.addObject("bDto", contentparams);
mav.addObject("commentboard", bService.commentList(commentId));
session.setAttribute("member", GMService.getGMMember(commentName));
System.out.println("BNAME="+((String)contentparams.get("BNAME"))+", GMId="+commentName);
if(((String)contentparams.get("BNAME")).equals(commentName)) {//�ۼ��ڿ� ������ Id�� �������� Ȯ��
	mav.setViewName("board/contentView");
} else {
	mav.setViewName("board/otherUsersContentView");
}
'''
(view_��� ȭ��)
'''html
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
(view_��� �ۼ�)
'''html
<form action="comment.do" method="post">
	<input type="hidden" name="commentId" value="${bDto.BID}">
	<input type="hidden" name="commentName" value="${member.get('GMID')}">
	<div class="img-push">
		<input type="text" name="commentContent" class="form-control input-sm" placeholder="����� �Է��Ͻ� �� ����Ű�� ���� �ּ���.">
	</div>
</form>
'''

>�Խ��� **���** ����
����� �����ϱ� ���� ������ ����� �����ִ� �����Ϳ� ����� ���̸� ��Ÿ���ִ� �����Ϳ� ����Ʈ���� ����� ǥ�����ִ� �����͸� �Խ���DB�� ������ �� ���� �����Ͽ����ϴ�.
(mybatis_mapper)_�������
'''xml
<insert id="reply" parameterType="java.util.HashMap">
	INSERT INTO MULTIPURPOSEBOARD(bId, bTitle, bContent, bName, bHit, bGroup, bStep, bIndent, bDate) VALUES(boardsequence.nextval, #{bTitle}, #{bContent}, #{GMId}, 0, #{bGroup}, #{bStep}+1, #{bIndent}+1, SYSDATE )
</insert>
'''
�Խ��� ��Ͽ��� ����ؼ� ��ȣ�� �ø��� ���ؼ� �������� ��� �̿��Ͽ��� ������ �������� �����ʹ� �״�� ������ ���� ����� ���̿� �Խ��� �̸��� ����� ǥ�����ִ� �����ʹ� 1�� �߰��Ͽ����ϴ�.

(mybatis_mapper)_����� ���� Ȯ��
'''xml
<update id="replyShape" parameterType="java.util.HashMap">
	UPDATE MULTIPURPOSEBOARD SET BSTEP=BSTEP+1 WHERE BGROUP=#{bGroup} AND BSTEP>#{bStep}
</update>
'''
������ ���� �����ִ� ����̰� ����� ���̸� Ȯ���� �� ������� Ȯ�� �Ǹ� ���̸� 1�����ش�.

>�Խ��� **���������̼�** ����
>�����ڸ� �� �� �ִ� �������� ����
>�����ڸ� Ȯ���ϴ� ȸ������ ����
