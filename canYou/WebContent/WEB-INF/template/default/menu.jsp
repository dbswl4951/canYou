<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>
	<li><a href="./">Home</a></li>
	<!-- ������ ������ :�α׾ƿ�, ������ ������ : �α���  -->

	<c:choose>
		<c:when test="${pageContext.request.userPrincipal.name==null }">
			<li><a href="login">�α��� </a></li>
		</c:when>
		<c:otherwise>
			<li><a href="j_spring_security_logout">�α׾ƿ� </a></li>
		</c:otherwise>
	</c:choose>
	<li><a href="ProjectUpload">������Ʈ ���ε�</a></li>
	<li><a href="projectlook">������Ʈ �ѷ�����</a></li>
	<li><a href="mypage">���� ������</a></li>

</ul>
<input type="hidden" id="session" value="${sessionScope.logInOut}">

</ul>
