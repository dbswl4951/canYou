<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>�������� ����</h2>
<form action="success" method="POST">
	<p><label>Pwd : </label><input type="password" name="memberPwd"></p>
	<p><label>�̸� : </label><input type="text" name="memberName"></p>
	<p><label>�ּ� : </label><input type="text" name="memberAddr"></p>
	<p><label>�޴��� ��ȣ : </label><input type="text" name="memberPhone"></p>
	<p><label>�̸��� : </label><input type="text" name="memberEmail"></p>
	<p><label>���� : </label><input type="text" name="memberAge"></p>
	<p><label>���� : </label><input type="text" name="memberAccount"></p>
	<!--<p><label>������ �̹��� : </label><input name="mfile" type="file"></p>-->
	
	<p><input type="submit" value="�����ϱ�"></p>
</form>
</body>
</html>