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
					style="margin: 20px 30px 30px 270px; width: 420px; height: 420px;"></div>
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
				<input type="button" class="btns" data-toggle="modal" data-target="#myModal" value="���ΰź�">	
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
		
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">�ź� ����</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <textarea id="reason" name="reason" class="form-control" rows="5"></textarea>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id=denied class="btn btn-danger" data-dismiss="modal">���� �ź�</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">�ݱ�</button>
      </div>

    </div>
  </div>
</div>
<script>
	$(function() {
		$('#wordBtn').click(function(){
			location.href="download?projectNo="+$('#projectNo').val();
		});
		
		$('#denied').click(function(){
			var result = confirm('�ش� ������Ʈ�� ������ �ź��մϴ�.');
			
			if(result){
				var form=document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "admin.denied");
				
				var hiddenField=document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "projectNo");
				hiddenField.setAttribute("value", ${list.projectNo});
				form.appendChild(hiddenField);
				
				var hiddenField2=document.createElement("input");
				hiddenField2.setAttribute("type", "hidden");
				hiddenField2.setAttribute("name", "reason");
				hiddenField2.setAttribute("value", $('#reason').val());
				form.appendChild(hiddenField2);
				
				document.body.appendChild(form);
				
				form.submit();
			}
		});
	});
</script>


