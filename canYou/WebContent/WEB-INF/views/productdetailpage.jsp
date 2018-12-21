<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp" %>
<style>
.left-box2 {
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
.popup {
  position: relative;
  display: inline-block;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* The actual popup */
.popup .popuptext {
  visibility: hidden;
  width: 160px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 8px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
  visibility: visible;
  -webkit-animation: fadeIn 1s;
  animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
  from {opacity: 0;} 
  to {opacity: 1;}
}

@keyframes fadeIn {
  from {opacity: 0;}
  to {opacity:1 ;} 
}
</style>

<!-- Nav tabs productdetailpage.jsp = ��ǰ��-->
         	<div id="underlinemenu">
         	<ul>
                <li><a href="story?projectNo=${list.projectNo}" class="current">������Ʈ ���丮</a></li>
                <li><a class="hoverHolder" href="productDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
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
<div class="divStory">
	<div class="left-box2">
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
			<div class="popup">
			�߰� �Ŀ� : <input type="text" name="donateMoney" id="donateMoney">
			<span class="popuptext" id="zero">�ݾ��� �Է��� �ּ���!</span>
			<span class="popuptext" id="illegal">1000�� ������ �Է� ���ּ���</span>
			</div> <input type="button" class="donateBtn" value="�Ŀ� ����">
		
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
<%@ include file="recommend.jsp"%>
<!-- ������ ����� �Ǿ����� Ȯ���ϴ� �� -->
<input type="hidden" id="success" value="${success}">
<script>
	$(function() {
		$('.prodview #donadd').each(function(){
			$(this).click(function(e){
				var donateBtn = '<input type="button" value="�� �����ϱ�" class="btns dona"/>';
				
				$('#selprod').html($(this).prev().html());
				$('#buyBtn').html(donateBtn);
				
				var allCost = Number($('#selprod .productCost').val())+Number($('#donateMoney').val());
					
				$('#allDonate').html('<p style="font-size: 25px; font-weight: bold;">'+allCost+'</p>');
			});
		});

		$('.donateBtn').each(function(index, item) { //�߰� �Ŀ� ����
			$(this).click(function() {
				// ���� �ƿ� �Է� ���� ���
				if($('#donateMoney').val()===''){
					var popup = document.getElementById('zero');
					popup.classList.toggle("show");
				} else if($('#donateMoney').val()%1000 != 0){
					var popup = document.getElementById('illegal');
					popup.classList.toggle("show");
				} else{
				var donateBtn = '<input type="button" value="�� �����ϱ�" class="btns dona"/>';
				$('#buyBtn').html(donateBtn);
				console.log($('#selprod .productCost').val());
				
				if($('#selprod .productCost').val()!=undefined){
					var allCost = Number($('#selprod .productCost').val())+Number($('#donateMoney').val());
					console.log(allCost);
				}else{
					var allCost = Number($('#donateMoney').val());
				}
				
				$('#allDonate').html('<p style="font-size: 25px; font-weight: bold;">'+allCost+'</p>');
				
				}
			});
		});
		
		$('#buyBtn').each(function(index, item) { //�� ��ǰ ����
			$(this).click(function() {
				var result = confirm('�Ŀ��Ͻðڽ��ϱ�?');

				if (result) {
					var projectNo = $('#projectNo').val();
					var donateMoney = $('#allDonate').children().text();
					var productNo = $('#selprod #productNo').val();
					
					if(productNo===undefined){
						var vo = {projectNo:projectNo, donateMoney:donateMoney, productNo:0};
					} else{
						var vo = {projectNo:projectNo, donateMoney:donateMoney, productNo:productNo};
					}
					$.ajax({
						type : "POST",
						data : vo,
						dataType : "json",
						url : "donate",
						success : function(data){
							if(data=='1'){
								var con = confirm('�Ŀ��� ���������� �Ϸ�ƽ��ϴ�. ������������ �̵��Ͻðڽ��ϱ�?');
								if(con){
									location.href='mypage';
								}
							} else{
								alert('�ܾ��� �����մϴ�.');
							}
						},
						error : function(){
							location.href="login";
						}
					});	
				}
			});
		});
		
		if(${list.projectStatus}!=2){
			$('.dona').attr('disabled', true);
		}
});
</script>