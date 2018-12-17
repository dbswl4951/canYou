<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp"%>


<style>

.rday {
	font-size: x-small;
}

.cont {
	width: 800px;
	height: 150px;
	border: 1px solid #DFDFDF;
	margin: auto;
}
</style>
<!-- Nav tabs communitypage = Ŀ�´�Ƽ -->
<div id="underlinemenu">
	<ul>
		<li><a href="story?projectNo=${list.projectNo}" class="current">������Ʈ
				���丮</a></li>
		<li><a href="productDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
		<li><a class="hoverHolder"
			href="community?projectNo=${list.projectNo}">Ŀ�´�Ƽ</a></li>
		<li><a href="">ȯ�� �� ��ȯ</a></li>
	</ul>
</div>
<!-- Nav tabs -->

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
			<td><input type="submit" value="�ۼ�"  class="btns"></td>
		</tr>
	</table>

	<!-- ��� ��ºκ� -->
	
	<table class="divStory">

		<c:forEach var="s" items="${replylist}">
			<td><img id="memberImage "
				src="resources/images/${s.mvo_Result.memberImage }"
				style="border: 1px solid; border-radius: 70px; -moz-border-radius: 70px; -khtml-border-radius: 70px; -webkit-border-radius: 70px; width: 35px; height: 35px;">

				${s.mvo_Result.memberName}</td>
			<tr>
				<td class="rday">${s.replyDate}</td>
			</tr>
			<tr>
				<td><div class="cont">${s.replyContent}</div></td>
			</tr>
		</c:forEach>
	</table>
</form>
