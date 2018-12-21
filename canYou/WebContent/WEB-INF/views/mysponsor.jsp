<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp" %>

<style>
.thStyle2{
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	padding: 10px 20px 10px 20px;
	margin: 20px 30px 20px 30px;
	border:1px solid white;
	background-color: black;
	color: white;
}

tr .thStyle{
	font-size: 17px;
	text-align: center;
	padding: 5px 10px 5px 10px;
	border:1px solid gray;
	font-weight: nomal;
}

</style>

<!-- Nav tabs storypage.jsp = ������Ʈ ���丮 -->
         	<div id="underlinemenu">
         	<ul>
                <li><a href="story?projectNo=${list.projectNo}" class="current">������Ʈ ���丮</a></li>
                <li><a href="productDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
                <li><a href="community?projectNo=${list.projectNo}" >Ŀ�´�Ƽ</a></li>
                 <c:choose>
                	<c:when test="${pageContext.request.userPrincipal.name!=null }">
                		<li><a href="projectDonateList?projectNo=${list.projectNo}&memberNo=${member.memberNo}">�Ŀ��� ����</a></li>
                	</c:when>
                </c:choose>
                <li><a href="">ȯ�� �� ��ȯ</a></li>
            </ul> 
            </div> 
<!-- Nav tabs --> 
<!-- ���丮 �κ� -->
<div class="divStory">
	<table id="proInfo">
		<tr>
			<th class="thStyle2">��ȣ</th>
			<th class="thStyle2">���̵�</th>
			<th class="thStyle2">�̸�</th>
			<th class="thStyle2">�ּ�</th>
			<th class="thStyle2">�ڵ��� ��ȣ</th>
			<th class="thStyle2">�̸���</th>
			<th class="thStyle2">����</th>
			<th class="thStyle2">����</th>
			<th class="thStyle2">����</th>
			<th class="thStyle2">�̹���</th>
		</tr>
		<c:forEach var="list" items="${mList}" varStatus="status">
			<tr>
				<th class="thStyle">${status.count}</th>
				<th class="thStyle">${list.memberId}</th>
				<th class="thStyle">${list.memberName}</th>
				<th class="thStyle">${list.memberAddr}</th>
				<th class="thStyle">${list.memberPhone} ��ȣ</th>
				<th class="thStyle">${list.memberEmail}</th>
				<th class="thStyle">${list.memberGender}</th>
				<th class="thStyle">${list.memberAge}</th>
				<th class="thStyle">${list.memberAccount}</th>
				<th class="thStyle"><img id="projectMainImage" src="resources/images/${list.memberImage}" style="width: 50px; height: 50px;"></th>
			</tr>
		</c:forEach>
	</table>
</div>

