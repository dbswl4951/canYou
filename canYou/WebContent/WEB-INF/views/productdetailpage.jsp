<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp" %>
<!-- Nav tabs productdetailpage.jsp = ��ǰ��-->
         	<div id="underlinemenu">
         	<ul>
                <li><a href="story?projectNo=${list.projectNo}" class="current">������Ʈ ���丮</a></li>
                <li><a class="hoverHolder" href="productDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
                <li><a href="community?projectNo=${list.projectNo}" >Ŀ�´�Ƽ</a></li>
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
		<input style="width: 150px;" id="donadd" type="button" value="�̰ɷ� �Ŀ��ϱ�" class="btns">
	</div>
</c:forEach> 
</div>
<div class="divStory"><fieldset><legend style="font-size: 20px; font-weight: bold;">���� �������� ����</legend>
<div id="selprod"></div>
<div id="buyBtn"></div>
</fieldset>
</div>
�߰� �Ŀ� :
<input type="text" name="donateMoney" id="donateMoney">

<input type="button" class="donateBtn btns" value="�Ŀ�" >

<!-- ������ ����� �Ǿ����� Ȯ���ϴ� �� -->
<input type="hidden" id="success" value="${success}">
<script>
	$(function() {
		if($('#success').val()==='fail'){
			alert('�ܾ��� �����մϴ�.');
		}
		
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
		

		$('#buyBtn').each(function(index, item) {
			$(this).click(function() {
				var projectNo = $('#projectNo').val();
				var productNo = $('#selprod #productNo').val();
				
				location.href ='donate?projectNo='+projectNo+'&donateMoney=0'+'&productNo='+productNo;
			});
		});
	});
</script>