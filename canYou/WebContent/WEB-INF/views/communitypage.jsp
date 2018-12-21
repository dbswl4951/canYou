<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="detail.jsp"%>


<style>
.rday {
	font-size: x-small;
}

.comment {
	border: 1px solid #DFDFDF;
	width: 50%;
	height: 50%;
	margin: 50px auto;
}

.modelbtn {
	text-align: right;
	border-bottom: 2px dashed gray;
	padding-bottom: 4px;
}

.cont {
	width: 800px;
	height: 150px;
	border: 1px solid #DFDFDF;
	margin: auto;
}
</style>
<!-- Nav tabs communitypage = Ŀ�´�Ƽ -->
<div id="underlinemenu">
	<ul>
		<li><a href="story?projectNo=${list.projectNo}" class="current">������Ʈ
				���丮</a></li>
		<li><a href="productDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
		<li><a class="hoverHolder"
			href="community?projectNo=${list.projectNo}">Ŀ�´�Ƽ</a></li>
		  <c:choose>
                	<c:when test="${pageContext.request.userPrincipal.name!=null }">
                		<li><a href="projectDonateList?projectNo=${list.projectNo}&memberNo=${member.memberNo}">�Ŀ��� ����</a></li>
                	</c:when>
                </c:choose>
		<li><a href="">ȯ�� �� ��ȯ</a></li>
	</ul>
</div>
<!-- Nav tabs -->

<form method="post" action="reply1">
	<div align="center">
		<table>
			<tr>
				<td><c:choose>
						<c:when test="${pageContext.request.userPrincipal.name==null}">
							<textarea rows="7" cols="80" name="replyContent" disabled>�α��� ���ּ���</textarea>
						</c:when>
						<c:when test="${pageContext.request.userPrincipal.name!=null}">
							<textarea rows="7" cols="80" name="replyContent"></textarea>
						</c:when>
					</c:choose></td>
				<td><input type="submit" value="�ۼ�" class="btns"></td>
			</tr>
		</table>
	</div>

	<!-- ��� ��ºκ� -->

	<table class="comment">

		<c:forEach var="s" items="${replylist}">
			<td><img id="memberImage "
				src="resources/images/${s.mvo_Result.memberImage }"
				style="border: 1px solid; border-radius: 70px; -moz-border-radius: 70px; -khtml-border-radius: 70px; -webkit-border-radius: 70px; width: 35px; height: 35px;">

				${s.mvo_Result.memberName}</td>
			<tr>
				<td class="rday">${s.replyDate}</td>
			</tr>
			<tr>
			<tr>
				<td><div class="cont">${s.replyContent}</div></td>
			</tr>
			<tr>
				<td class="modelbtn"><input type="button" class="mobtn"
					value="����"> 
					<input type="hidden" class="replyNo" value="${s.replyNo}"> 
					<input type="hidden" id="projectNo"value="${s.projectNo}"> 
					<input type="button" class="delbtn"
					value="����"></td>
			</tr>
		</c:forEach>
	</table>
</form>
<script>
	$(function() {
		$('.delbtn').each(
				function(index, item) {
					$(this).click(

							function() {
								console.log();
								var result = confirm('�����Ͻðڽ��ϱ�?');
								if (result) {
									location.href = "commentdelete?replyNo="
											+ $(this).prev().prev().val()
											+ "&projectNo="
											+ $('#projectNo').val();
									console.log($('#projectNo').val());
									console.log($('.replyNo').val());
								}
							});
				});
	});
	$(function() {
		$('.mobtn').click(function() {
			location.href = "communityModify?replyNo="+ $(this).next().val()+ "&projectNo="
			+ $('#projectNo').val();
		});
	});
</script>
