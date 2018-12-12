<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#tv {
    border: 1px solid black;
}
</style>
<meta charset="EUC-KR">
<title>detail.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
<body>
<div>
		<fieldset>
			<legend>Project List</legend>
			<form action="update" method="POST" >
			<input type="hidden" id="projectNo" name="projectNo" value="${list.projectNo}">
			<table>
				<thead></thead>
				<tbody>
						<tr>
							<td>������Ʈ ��ȣ : ${list.projectNo}</td>
						</tr>
						<tr>
							<td>ȸ���̸� : ${member.memberName}</td>
						</tr>
						<tr>
							<td>������Ʈ �� : ${list.projectName}</td>
						</tr>
						<tr>
							<td>��ǥ�ݾ� : ${list.projectCost}</td>
						</tr>
						<tr>
							<td>������Ʈ ���۳�¥ : ${list.projectStartDate}</td>
						</tr>
						<tr>
							<td>������Ʈ ������¥ : ${list.projectEndDate}</td>
						</tr>
						<tr>
							<td>���� �Ŀ� �ݾ�: ${list.projectCurCost}</td>
						</tr>
						<tr>
							<td>�Ŀ��� �� : ${list.projectFundCnt}</td>
						</tr>
						<tr>
							<td>������Ʈ �̹��� :</td>
							<td><img id="projectMainImage"
								src="resources/images/${list.projectMainImage }"
								style="margin: 60px 10px 10px 10px; width: 260px; height: 280px;">
							</td>
							</tr>

						<tr>
							<td>������Ʈ ���丮 : ${list.projectStory}</td>
						</tr>
						<tr>
							<td>������Ʈ ��� : ${list.projectStep}</td>
						</tr>
						<tr>
							<td>���࿩�� : ${list.projectStatus}</td>
						</tr>
						<tr>
							<td>ī�װ� ��ȣ : ${list.categoryNo}</td>
						</tr>
						<tr>
							<td>
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
							</td>
						</tr>
						<tr>
							<td>
								<h2>���� �������� ����</h2>
								<div id="selprod">
									
								</div>
							</td>
						</tr>
						<tr>
							<td>�߰� �Ŀ� : <input type="text" name="donateMoney" id="donateMoney"></td>
						</tr>
						<tr>
							<td><input type="button" class="donateBtn" value="�Ŀ�"></td>
						</tr>
						
				</tbody>
					
				<tfoot>
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name eq member.memberId }">
					<tr>
						<td colspan="14">
						<input type="submit" id="wBtn" value="����">
						</td>
					</tr>
					</c:when>
				</c:choose>
				</tfoot>
			</table>
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
</body>
<script>
	$(function() {
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
</html>

