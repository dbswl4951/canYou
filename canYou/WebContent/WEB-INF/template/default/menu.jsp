<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<!-- <li><a href="./">Home</a></li> -->
	<!-- ������ ������ :�α׾ƿ�, ������ ������ : �α���  -->
	<li><a href="projectlook">������Ʈ ����</a></li>
	<li><a href="ProjectUpload">������Ʈ ���ε�</a></li>
	
	<c:choose>
		<c:when test="${pageContext.request.userPrincipal.name==null }">
			<li style="margin:0px 20px 0px 720px;"><a href="login">�α��� </a></li>
		</c:when>
		<c:otherwise>
			<li style="margin:0px 20px 0px 720px;"><a href="j_spring_security_logout">�α׾ƿ� </a></li>
		</c:otherwise>
	</c:choose>
	<li style="margin:0px 0px 0px 0px;"><a href="mypage">���� ������</a></li>

</ul>
