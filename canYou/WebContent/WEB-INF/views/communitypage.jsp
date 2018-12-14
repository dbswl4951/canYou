<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp" %>
<form method="post" action="reply1">
	<table>
		<tr>
			<td><c:choose>
					<c:when test="${pageContext.request.userPrincipal.name==null}">
						<textarea rows="3" cols="30" name="replyContent" disabled>�α��� ���ּ���</textarea>
					</c:when>
					<c:when test="${pageContext.request.userPrincipal.name!=null}">
						<textarea rows="3" cols="30" name="replyContent"></textarea>
					</c:when>
				</c:choose></td>
			<td><input type="submit" value="�ۼ�"></td>
		</tr>
	</table>
	<!-- ��� ��ºκ� -->
	<table id="tv">
		<c:forEach var="s" items="${replylist}">
			<tr>
				<td>�����ȣ : ${s.memberNo}</td>
				<td>���� : ${s.replyContent}</td>
				<td>��¥ : ${s.replyDate}</td>
			</tr>
		</c:forEach>
	</table>
</form>