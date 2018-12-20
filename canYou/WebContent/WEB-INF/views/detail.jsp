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

#castyle{
	font-size: 50px;
	font-weight: bold;
	text-align: center;
}

#castyle2{
	font-size: 33px;
	font-weight: bold;
	text-align: center;
}

</style>
 
<div>
		<fieldset>
			<form action="update" method="POST" >	
			<input type="hidden" id="projectNo" name="projectNo" value="${list.projectNo}">
			<p id="castyle">[ ${c} ]</p>
				<c:choose>
						<c:when test="${sc!=null}">
								<p id="castyle2">${sc}</p>
	                     </c:when>
	            </c:choose>
            
				<h1 style="margin:30px 100px 30px 260px; font-size: 40px; color: black;">������Ʈ �̸� : ${list.projectName}</h1>
				<div class="left-box">
				<img id="projectMainImage"
						src="resources/images/${list.projectMainImage }"
						style="margin: 20px 30px 30px 300px; width: 420px; height: 420px;"></div>
			<table style="margin: 50px 30px 120px 60px;">
				<thead></thead>
				<tbody>
						<tr>
							<td>������Ʈ ������ </td>
						</tr>
						<tr>
							<td class="tdclass">${member.memberName}</td>
						</tr>
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
			<div align="right">
				<input type="button" id="wordBtn" value="����� ����" class="btns">	
				<c:choose>
				<c:when
					test="${pageContext.request.userPrincipal.name eq member.memberId }">
					<input type="submit" id="wBtn" class="btns" value="����">
				</c:when>
				</c:choose>
				<c:choose>
				<c:when
					test="${pageContext.request.userPrincipal.name eq member.memberId && list.projectStatus==4}">
					<input type="button" id="request" class="btns" value="����� ��û">
					<script>
						$('#request').click(function(){
							var form=document.createElement("form");
							form.setAttribute("method", "post");
							form.setAttribute("action", "request");
							
							var hiddenField=document.createElement("input");
							hiddenField.setAttribute("type", "hidden");
							hiddenField.setAttribute("name", "projectNo");
							hiddenField.setAttribute("value", ${list.projectNo});
							form.appendChild(hiddenField);
							
							document.body.appendChild(form);
							
							form.submit();
						})
					</script>
				</c:when>
				</c:choose>
				<c:choose>
				<c:when
					test="${pageContext.request.userPrincipal.name eq member.memberId && list.projectStatus==4}">
					<input type="button" id="prodel" class="btns" value="����">
					<script>
					$('#prodel').click(function(){
						var form=document.createElement("form");
						form.setAttribute("method", "post");
						form.setAttribute("action", "prodel");
						
						var hiddenField=document.createElement("input");
						hiddenField.setAttribute("type", "hidden");
						hiddenField.setAttribute("name", "projectNo");
						hiddenField.setAttribute("value", ${list.projectNo});
						form.appendChild(hiddenField);
						
						document.body.appendChild(form);
						
						form.submit();
					})
					</script>
				</c:when>
				</c:choose>
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


