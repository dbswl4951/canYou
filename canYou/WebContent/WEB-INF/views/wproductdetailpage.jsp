<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="wdetail.jsp" %>
<!-- Nav tabs productdetailpage.jsp = ��ǰ��-->
         	<div id="underlinemenu">
         	<ul>
                <li><a href="admin.wstory?projectNo=${list.projectNo}" class="current">������Ʈ ���丮</a></li>
                <li><a class="hoverHolder" href="admin.wproductDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
                <li><a href="">ȯ�� �� ��ȯ</a></li>
            </ul> 
            </div> 
<!-- Nav tabs -->
<div class="divStory">
<c:forEach var="e2" items="${prodlist}">
	<div class="prodview">
		<div>
			<input type="hidden" name="productNo" id="productNo"
				value="${e2.productNo }">
			<p>${e2.productCost }���̻� ���� ��</p>
			<h2>${e2.productName }</h2>
			<p>${e2.productInfo }</p>
			<p>${e2.productCnt }������</p>
		</div>
	</div>
</c:forEach> 
</div>
