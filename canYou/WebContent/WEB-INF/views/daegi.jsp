<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.wprolist{
	border: 1px solid gray;
		margin: 10px;
		padding-left:10px;
		padding-right:10px;
		border-radius: 5px;
}
</style>
<div class="container">
	<h1>���� ��� ������Ʈ</h1>

	<c:forEach var="e" items="${list}" varStatus="status">
		<div class="wprolist">
			<p>������Ʈ �� : ${e.PROJECTNAME}</p>
			<hr>
			<p>ī�װ� �з� : ${e.CATEGORYNAME}</p>
			<p>���� ��û ��¥ : ${e.UDATE}</p>
			<p>���� ��¥ : ${e.PROJECTSTARTDATE}</p>
			<p>���� ��¥ : ${e.PROJECTENDDATE}</p>
			<p><a href="admin.wstory?projectNo=${e.PROJECTNO }">�ڼ��� ����</a></p>
		</div>
	</c:forEach>
</div>