<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	h1{
		font-size: 40px;
		font-weight: bold;
		color: gray;
		margin-top:10px;
	}
	
	.title{
		borer-bottom: 1px dotted gray;
		color: gray;
		font-weight: bold;
	}
	
	input{
		border: 1px solid #999;
		border-radius: 5px;
	}
</style>

<div align="center">
	<h1>ĳ�� ������</h1>
</div>
<div class="cash" align="center">
	<form action="cashcharge" method="POST">
			<p>
				${list.memberName}��
			</p>
			<p>
				<span class="title">���� �ݾ� : </span><input type="text" name="currentmemberCash"
					value="${list.memberCash }" readonly="readonly">
			</p>
			<p>
				<span class="title">���� �ݾ� : </span><input type="text" name="memberCash">
			</p>
			<p>
				<input type="submit" class="btns" value="�����ϱ�">
			</p>
	</form>
</div>