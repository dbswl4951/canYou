<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp" %>
<c:forEach var="e2" items="${prodlist}">
	<div class="prodview" style="border: 1px solid gold;">
		<div>
			<input type="hidden" name="productNo" id="productNo"
				value="${e2.productNo }">
			<p>${e2.productCost }���̻� ���� ��</p>
			<h2>${e2.productName }</h2>
			<p>${e2.productInfo }</p>
			<p>${e2.productCnt }������</p>
		</div>
		<input id="donadd" type="button" value="�̰ɷ� �Ŀ��ϱ�">
	</div>
</c:forEach>

<h2>���� �������� ����</h2>
<div id="selprod"></div>

�߰� �Ŀ� :
<input type="text" name="donateMoney" id="donateMoney">

<input type="button" class="donateBtn" value="�Ŀ�">

<c:choose>
	<c:when
		test="${pageContext.request.userPrincipal.name eq member.memberId }">
		<tr>
			<td colspan="14"><input type="submit" id="wBtn" value="����">
			</td>
		</tr>
	</c:when>
</c:choose>

<script>
	$(function() {
		$('.donateBtn').each(function(index, item) {
			$(this).click(function() {
				var result = confirm('�Ŀ��Ͻðڽ��ϱ�?');

				if (result) {
					var projectNo = $('#projectNo').val();
					var donateMoney = $('#donateMoney').val();
					var productNo = $('#selprod #productNo').val();
					if(productNo===undefined){
						location.href ='donate?projectNo='+projectNo+'&donateMoney='+donateMoney+'&productNo=0';
					} else{
						location.href ='donate?projectNo='+projectNo+'&donateMoney='+donateMoney+'&productNo='+productNo;	
					}
					
				}
			});
		});
	});
</script>