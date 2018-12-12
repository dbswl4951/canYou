<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>myProject.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="resources/css/mypage.css" type="text/css" />
</head>
<body>
	<div>
		<fieldset>
			<legend>�������� ������Ʈ</legend>


			<c:set var="i" value="0" />
			<c:set var="j" value="3" />
			<table>
				<c:forEach  var="e" items="${list}">
					<c:if test="${i%j == 0 }">
						<tr>
					</c:if>
					<td style="border: 2px solid black; padding: 10px;">
						<div id="">
							<img id="projectMainImage"
								src="resources/images/${e.projectMainImage }"
								style="margin: 60px 10px 10px 10px; width: 260px; height: 280px;">
						</div>
						<div id="">������Ʈ �� : ${e.projectName}</div>
						<div id="">������Ʈ ��� : ${e.projectStep}</div>
						<div id="">���࿩�� : ${e.projectStatus}</div>
						<div id="">��ǥ�ݾ� : ${e.projectCost}</div>
						<div id="">������Ʈ ���۳�¥ : ${e.projectStartDate}</div>
						<div id="">������Ʈ ������¥ : ${e.projectEndDate}</div>
						<div id="">�Ŀ��� �� : ${e.projectFundCnt}</div>
								
					</td>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</table>





		</fieldset>
	</div>
</body>
</html>

