<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1>Ŀ�´�Ƽ����</h1>
</div>
<style>
table {
	margin: "0 auto";
}

h1 {
	align-self: center;
}
</style>
<div class="comment" align="center">
	<!-- ���� ���������� �޾ƿ� ���� �Ⱥ��̰� �������� �־� �� -->
	<input type="hidden" name="projectNo" value="${list.projectNo}">
	<input type="hidden" name="replyNo" value="${list.replyNo}">
	<form action="commentmodify" method="POST">
		<table>
			<tr>
				<td><h1>��� ����</h1></td>
			</tr>
			<tr>
				<td><textarea rows="50" cols="200" name="replyContent"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="����"> <input
					type="hidden" name="projectNo" value="${list.projectNo}"> 
					<input type="hidden" name="replyNo" value="${list.replyNo}"></td>
			</tr>
		</table>
	</form>
</div>
