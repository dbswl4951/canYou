<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1>ĳ�� ������</h1>
</div>
<div class="cash" align="center">
	<form action="cashcharge" method="POST">>
			<p>
				<input type="text" name="memberName" value="${list.memberName}"
					readonly="readonly"><label>��</label>
			</p>
			<p>
				<label>���� �ݾ� : </label><input type="text" name="currentmemberCash"
					value="${list.memberCash }" readonly="readonly">
			</p>
			<p>
				<label>���� �ݾ� : </label><input type="text" name="memberCash">
			</p>
			<p>
				<input type="submit" class="btns" value="�����ϱ�">
			</p>
	</form>
</div>