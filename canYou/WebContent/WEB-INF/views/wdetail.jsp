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



<div>
	<fieldset>
		<form action="admin.ok" method="POST" >	
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
						<tr>
							<td>������Ʈ ��û��</td>
						</tr>
						<tr>
							<td class="tdclass">${list.UDate}</td>
						<tr>
							<td>������Ʈ ���۳�¥</td>
						</tr>
						<tr>
							<td class="tdclass">${list.projectStartDate}</td>
						</tr>
						<tr>
							<td>������Ʈ ������¥</td>
						</tr>
						<tr>
							<td class="tdclass">${list.projectEndDate}</td>
						</tr>
						<tr>
							<td>������Ʈ ���</td>
						</tr>	
						<tr>
							<td>
								<select name="projectStep">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
								</select>
							</td>
						</tr>
				</tbody>
			</table>
			<div align="right">
				<input type="button" id="wordBtn" class="btns" value="����� ����">
				<input type="submit" id="wBtn" class="btns" value="����">	
			</div>
			
			<br>
<%-- 
			<table>
				<tr>
					<td><input type="button" id="wordBtn" value="����� ����"></td>
				</tr>
				<tr>
					<td><a href="story?projectNo=${list.projectNo}">������Ʈ ���丮</a></td>
					<td style="padding-left: 30px"><a
						href="productDetail?projectNo=${list.projectNo}">��ǰ ��</a></td>
					<td style="padding-left: 30px"><a
						href="community?projectNo=${list.projectNo}">Ŀ�´�Ƽ</a></td>
					<td style="padding-left: 30px"><a href="">ȯ�� �� ��ȯ</a></td>
				</tr>
			</table> --%>
			</form>
			</fieldset>	
		</div>
<script>
	$(function() {
		$('#wordBtn').click(function(){
			location.href="download?projectNo="+$('#projectNo').val();
		});
	});
	
	
</script>


