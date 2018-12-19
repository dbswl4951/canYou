<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.menubar li {
	background: #000000;
}

.menubar li ul {
	background: #000000;
	display: none;
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 150px;
	z-index: 200;
	height: 220px;
}

.menubar li:hover ul {
	display: block;
}

.listy{
	margin: 0px 20px 0px 1470px;
}

</style>

<div class="menubar">
	<ul>
		<!-- <li><a href="./">Home</a></li> -->
		<!-- ������ ������ :�α׾ƿ�, ������ ������ : �α���  -->
		<li><a href="projectlook">������Ʈ ����</a>
			<ul>
				<li><a href="AllList">��� ������Ʈ</a></li>

				<li><a href="categoryproject?categoryNo=1">����</a></li>
				<li><a href="categoryproject?categoryNo=2">Ǫ��</a></li>
				<li><a href="categoryproject?categoryNo=3">ķ����</a></li>
				<li><a href="categoryproject?categoryNo=4">������</a></li>
				<li><a href="categoryproject?categoryNo=5">��ȭ/����</a></li>
				<li><a href="categoryproject?categoryNo=6">����</a></li>
				<li><a href="categoryproject?categoryNo=7">�м�</a></li>
				<li><a href="categoryproject?categoryNo=8">��ũ�����</a></li>
				<li><a href="categoryproject?categoryNo=9">��Ÿ</a></li>


				<li><a href="">�Ⱓ �� ����</a></li>
				<li><a href="graph">��� �� ����</a></li>
			</ul></li>
		<li><a href="ProjectUpload">������Ʈ ���ε�</a></li>
		<c:choose>
			<c:when test="${pageContext.request.userPrincipal.name==null }">
				<li class="listy"><a href="login">�α���
				</a></li>
			</c:when>
			<c:otherwise>
				<li class="listy">
				<a href="j_spring_security_logout">�α׾ƿ� </a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="mypage">���� ������</a></li>

	</ul>
</div>
