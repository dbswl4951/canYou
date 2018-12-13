<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#tv {
    border: 1px solid black;
}
.left-box {
  float: left;
  width: 60%;
}
.right-box {
  float: right;
  width: 40%;
}
td{	
	color: black;	
}
.tdclass{
	color: black;
	font-size: 20px;
	line-height: 2em;
}


</style>
<script>
$(document).ready(function(){
	$('.prodview #donadd').each(function(){
		$(this).click(function(e){
			//console.log($(this).prev().html());
			$('#selprod').html($(this).prev().html());
			$('#selprod').css('border', '1px pink solid');
		});
	});
}); 
</script>
</head>

<div>
		<fieldset>
			<legend>Project</legend>
			<form action="update" method="POST" >	
			<input type="hidden" id="projectNo" name="projectNo" value="${list.projectNo}">
				<h1 style="margin:30px 100px 30px 260px; font-size: 40px; color: black;">������Ʈ �̸� : ${list.projectName}</h1>
				<div class="left-box">
				<img id="projectMainImage"
						src="resources/images/${list.projectMainImage }"
						style="margin: 20px 30px 30px 40px; width: 420px; height: 420px;"></div>
			<table style="margin: 50px 30px 120px 60px;">
				<thead></thead>
				<tbody>
						<tr>
							<td>������Ʈ ������ </td>
						</tr>
						<tr>
							<td class="tdclass">${member.memberName}</td>
						</tr>
						<!--
						<tr>
							<td>ī�װ� �̸� : <b>[${c}]</b>
							<c:choose>
								<c:when test="${sc!=null}">
									-${sc}
                            	</c:when>
                            </c:choose>
							</td>
						</tr>
						  -->
						<tr>
							<td>��ǥ�ݾ�</td>
						</tr>
						<tr>
							<td class="tdclass">${list.projectCost}��</td>
						</tr>
						<!--
						<tr>
							<td>������Ʈ ���۳�¥ : ${list.projectStartDate}</td>
						</tr>
						  -->
						<tr>
							<td>������Ʈ ������¥</td>
						</tr>
						<tr>
							<td class="tdclass">${list.projectEndDate}</td>
						</tr>
						<tr>
							<td>���� �Ŀ� �ݾ�</td>
						</tr>
						<tr>
							<td class="tdclass">${list.projectCurCost}��</td>
						</tr>
						<tr>
							<td>�Ŀ��� ��</td>
						</tr>
						<tr>
							<td class="tdclass">${list.projectFundCnt}��</td>
						</tr>
						<tr>
							<td>������Ʈ ���</td>
						</tr>	
						<tr>
							<td class="tdclass">${list.projectStep}</td>
						</tr>
				</tbody>
			</table>	
			
				<p><a href="storypage">������Ʈ ���丮</a> ${list.projectStory}</p>
				<p><a href="productdetailpage">��ǰ ��</a></p>
				<p><a href="communitypage">Ŀ�´�Ƽ</a></p>
				<p><a href="">ȯ�� �� ��ȯ</a></p>
						
				<c:forEach var="e2" items="${prodlist}">
					<div class="prodview" style="border:1px solid gold;">
						<div>
											<input type="hidden" name="productNo" id="productNo" value="${e2.productNo }">
											<p>${e2.productCost }�� �̻� ���� ��</p>
											<h2>${e2.productName }</h2>
											<p>${e2.productInfo }</p>
											<p>${e2.productCnt }�� ����</p>
										</div>
									<input id="donadd" type="button" value="�̰ɷ� �Ŀ��ϱ�">
									</div>
				</c:forEach>
						
								<h2>���� �������� ����</h2>
								<div id="selprod">
									
								</div>
						
							�߰� �Ŀ� : <input type="text" name="donateMoney" id="donateMoney">
					
						<input type="button" class="donateBtn" value="�Ŀ�">

				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name eq member.memberId }">
					<tr>
						<td colspan="14">
						<input type="submit" id="wBtn" value="����">
						</td>
					</tr>
					</c:when>
				</c:choose>	
			</form>
			
			<form method="post" action="reply1">
			<table>
				<tr>
					<td>
					<c:choose>
						<c:when test="${pageContext.request.userPrincipal.name==null}">
							<textarea rows="3" cols="30" name="replyContent" disabled>�α��� ���ּ���</textarea>
						</c:when>
						<c:when test="${pageContext.request.userPrincipal.name!=null}">
							<textarea rows="3" cols="30" name="replyContent"></textarea>
						</c:when>
					</c:choose>
					</td>
					<td><input type="submit" value="�ۼ�"></td>
				</tr>
				<tr>
					<td><input type="button" id="wordBtn" value="����� ����"></td>
				</tr>
			</table>
		</form>
		</fieldset>
		<table id= "tv">
		
			<c:forEach var="s" items="${replylist}">
			
				<tr>
					<td>�����ȣ : ${s.memberNo}</td>	
					<td>���� : ${s.replyContent}</td>
					<td>��¥ : ${s.replyDate}</td>
				</tr>
				
			</c:forEach>

		</table> 
	</div>

<script>
	$(function() {
		$('#wordBtn').click(function(){
			location.href="download?projectNo="+$('#projectNo').val();
		});
		$('.donateBtn').each(function(index, item) {
			$(this).click(function() {
				var result = confirm('�Ŀ��Ͻðڽ��ϱ�?');

				if (result) {
					var projectNo = $('#projectNo').val();
					var donateMoney = $('#donateMoney').val();
					var productNo = $('#selprod #productNo').val();
					
					
					//console.log("projectNo : "+projectNo+"/ donateMoney : "+donateMoney+"/ productNo:" + productNo);
					
					location.href ='donate?projectNo='+projectNo+'&donateMoney='+donateMoney+'&productNo='+productNo;
				}
			});
		});
	});
</script>

