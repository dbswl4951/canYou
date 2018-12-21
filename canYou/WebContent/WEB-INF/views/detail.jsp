<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.left-box {
	float: left;
	width: 700px;
	display: inline-block;
    position: relative;
    margin-right: 400px;
}
/* .left-box:after {
    position: absolute;
    display: block;
    content: "";
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    box-shadow: 
      inset 0 0 20px #fff /* ���� ���� �� */,
      inset 0 0 20px #fff,
      inset 0 0 20px #fff,
      inset 0 0 20px #fff;
} */

td {
	color: black;
}

.tdclass {
	color: black;
	font-size: 35px;
	line-height: 2em;
}

#castyle {
	font-size: 50px;
	font-weight: bold;
	text-align: center;
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

.left-box img{
	width: 100%;
	height: 600px;
}

#proInfo{
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
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
            
			<div align="center" style="font-size: 80px; color: black;">
				<strong>${list.projectName}</strong>
			</div>
			
			<table id="proInfo">
				<tr>
					<td rowspan="12"><div class="left-box">
						<img id="projectMainImage"
						src="resources/images/${list.projectMainImage }">
					</div></td>
					<td>������Ʈ ������</td>
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
						});
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


