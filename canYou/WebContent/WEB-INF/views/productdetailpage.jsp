<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp" %>
<style>
.left-box {
   float: left;
   width: 50%;
}
 
.right-box {
   float: right;
   width: 50%;
}

#p{
	font-size: 25px;
	font-weight: bold;
}
</style>

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
	<div class="left-box">
		<c:forEach var="e2" items="${prodlist}">
			<div class="prodview">
				<div>
					<input type="hidden" name="productNo" id="productNo" value="${e2.productNo }">
					<input type="hidden" class="productCost" value="${e2.productCost}">
					<p>${e2.productCost }���̻󱸸� ��</p>
					<h2>${e2.productName }</h2>
					<p>${e2.productInfo }</p>
					<p>${e2.productCnt }������</p>
				</div>
				<input style="width: 150px;" id="donadd" type="button"
					value="��ǰ ����" class="btns">
				
			</div>
		</c:forEach>
		�߰� �Ŀ� : <input type="text" name="donateMoney" id="donateMoney">
		<input type="button" class="donateBtn btns" value="�Ŀ� ����">
	</div>
</div>

<div class="right-box">
	<div class="divStory">
		<fieldset>
			<legend style="font-size: 20px; font-weight: bold;">���� �������� ����</legend>
			<hr>
			<div id="selprod"></div>
			<hr>
			<p id="p">�� �Ŀ� �ݾ� : </p><div id="allDonate"></div>
			<div id="buyBtn"></div>
		</fieldset>
	</div>
</div>

<!-- ������ ����� �Ǿ����� Ȯ���ϴ� �� -->
<input type="hidden" id="success" value="${success}">
<script>
	$(function() {
		if($('#success').val()==='fail'){
			alert('�ܾ��� �����մϴ�.');
		}
		
		$('.prodview #donadd').each(function(){
			$(this).click(function(e){
				var donateBtn = '<input type="button" value="�� �����ϱ�" class="btns dona"/>';
				
				$('#selprod').html($(this).prev().html());
				$('#buyBtn').html(donateBtn);
				//$('#selprod').css('border', '1px solid black');
				
				var allCost = Number($('#selprod .productCost').val());
				//var allCost = $(this).next().val();
				console.log($('#selprod .productCost').val());
					
				$('#allDonate').html('<p style="font-size: 25px; font-weight: bold;">'+allCost+'</p>');
			});
		});

		$('.donateBtn').each(function(index, item) { //�߰� �Ŀ� ����
			$(this).click(function() {
				var projectNo = $('#projectNo').val();
				var productNo = $('#selprod #productNo').val();
				var allCost = Number($('#donateMoney').val())+Number($('#selprod .productCost').val());
				console.log(allCost);
				$('#allDonate').html('<p style="font-size: 25px; font-weight: bold;">'+allCost+'</p>');
			});
		});
		
		$('#buyBtn').each(function(index, item) { //�� ��ǰ ����
			$(this).click(function() {
				var result = confirm('�Ŀ��Ͻðڽ��ϱ�?');

				if (result) {
					var projectNo = $('#projectNo').val();
					var donateMoney = $('#donateMoney').val();
					var productNo = $('#selprod #productNo').val();
				
					if(productNo===undefined){ //�߰� �Ŀ��� ���� ���
						location.href ='donate?projectNo='+projectNo+'&donateMoney='+donateMoney+'&productNo=0';
					} else{ //��ǰ����, �߰� �Ŀ� �� �� ���� ���
						location.href ='donate?projectNo='+projectNo+'&donateMoney='+donateMoney+'&productNo='+productNo;	
					} 
				}
			});
		});
		
		if(${list.projectStatus}!=2){
			$('.dona').attr('disabled', true);
		}
});
</script>