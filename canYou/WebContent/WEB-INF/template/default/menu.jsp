<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<style>
.menubar li {
	background: #000000;
	font-size: 25px;
}

.menubar li ul {
	background: #000000;
	display: none;
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 150px;
	z-index: 200;
	height: 270px;
}

.menubar li:hover ul {
	display: block;
}

.listy{
	position: absolute;
	left : 1800px;
}

#listy2{
	position: absolute;
	left : 1700px;
}

#cashStyle{
	position: absolute; left : 1630px; font-size: 16px; font-weight: bold;
	margin-top: 10px;
}

.imgStyle{
	width: 40px;height: 35px;
}

</style>

<div class="menubar">
	<ul>
		<!-- <li><a href="./">Home</a></li> -->
		<!-- ������ ������ :�α׾ƿ�, ������ ������ : �α���  -->
		<li><a href="lookaround">������Ʈ ����</a>
			<ul>
				<li><a href="AllList">��� ������Ʈ</a></li>

				<li><a href="categoryproject?categoryNo=1">����</a></li>
				<li><a href="categoryproject?categoryNo=2">Ǫ��</a></li>
				<li><a href="categoryproject?categoryNo=3">ķ����</a></li>
				<li><a href="categoryproject?categoryNo=4">������</a></li>
				<li><a href="categoryproject?categoryNo=5">��ȭ/����</a></li>
				<li><a href="categoryproject?categoryNo=6">����</a></li>
				<li><a href="categoryproject?categoryNo=7">�м�</a></li>
				<li><a href="categoryproject?categoryNo=8">��ũ�����</a></li>
				<li><a href="categoryproject?categoryNo=9">��Ÿ</a></li>

			</ul></li>
		<li><a href="ProjectUpload">������Ʈ ���ε�</a>
		<%
	
			Object sid = session.getAttribute("memberGrant");
		
			if(sid != null){
				request.setAttribute("sidv", sid.toString());
			}
		%>
		
		</li>
		
		<c:choose>
			<c:when test="${pageContext.request.userPrincipal.name!=null }">
					<c:choose>
						<c:when test="${sidv=='1'}">
							<li style="position: absolute; left : 1740px;">
								<a href="admin.daegi">
								<img src="resources/images/${sessionScope.memberImage}" class="imgStyle"></a></li>
						</c:when>
						
						<c:otherwise>
							<c:choose>
									<c:when test="${dealarm>0 }">
										<li style="position: absolute; left : 1550px;">
										<div class="dropdown">
											<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
												(${dealarm })
    										</button>
											<div class="dropdown-menu">
												 <c:forEach var="v" items="${delist}">
													<a class="dropdown-item" href="story?projectNo=${v.projectNo }">���� ������Ʈ!</a>
 												</c:forEach>
    										</div>
										</div>
										</li>
									</c:when>
								</c:choose>
						
							<li id="cashStyle">${sessionScope.memberCash} ĳ��</li>
								<li style="position: absolute; left : 1740px;">
								
								<a href="mypage">
								<img src="resources/images/${sessionScope.memberImage}" class="imgStyle"></a></li>
						</c:otherwise>
					</c:choose>
					
				
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${pageContext.request.userPrincipal.name==null }">
				<li class="listy"><a href="login">�α���</a></li>
			</c:when>
			<c:otherwise>
				<li class="listy"><a href="j_spring_security_logout">�α׾ƿ� </a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>


