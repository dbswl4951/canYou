<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
#t1 {
	text-align: center;
	margin: 0 auto;
	border-spacing: 40px;
}

.imgmar {
	margin: 10px 10px 10px 10px;
	width: 280px;
	height: 240px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: auto;
	height: auto;
	margin-left: 30px;
	margin-top: 20px;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.7);
}

.container {
	padding-top: 3px;
	padding-bottom: 3px;
}
</style>

<div id="mydonateList">
	<h1 style="font-size: 20px">�� �Ŀ���Ȳ</h1>
	<br>
	<div style="float: left; width: 50%;">
		<select id="status" style="width: 300px">
			<option value="">�����ϱ�</option>
			<option value="0"<c:if test="${cno == 0 }"> selected </c:if> >��κ���</option>
			<option value="2"<c:if test="${cno == 2 }"> selected </c:if> >�ݵ�������</option>
			<option value="3"<c:if test="${cno == 3 }"> selected </c:if> >�����Ϸ�</option>
		</select>
	</div>
	<div align="right">
		<form method="POST" action="donatesearch">
			<input type="hidden" name="page" value="1"> 
				<input name="searchValue"
				id="searchIndex" size="80px" pattern=".{2,}"
				title="�ּ��� 2�� �̻��� ���ڰ� �־�� �մϴ�."> <input type="submit"
				value="�˻��ϱ�" class="btns">
		</form>
	</div>
	<br>
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	<table id="t1">
		<thead></thead>
		<tbody>

			<c:forEach var="e" items="${list}">
				<c:if test="${i%j == 0 }">
					<tr>
				</c:if>
				<td class="t2">
					<div class="card">
						<c:choose>
							<c:when test="${e.PROJECTSTATUS==3}">
								<div class="endcontainer">
								<a href="story?projectNo=${e.PROJECTNO }">
									<img class="imgmar endpro" src="resources/images/${e.PROJECTMAINIMAGE }">
								</a>
								<div class="centered">����<br>�Ϸ�</div>
								</div>
							</c:when>
							<c:when test="${e.PROJECTSTATUS==2}">
								<a href="story?projectNo=${e.PROJECTNO  }">
									<img class="imgmar" src="resources/images/${e.PROJECTMAINIMAGE }">
								</a>
							</c:when>
							</c:choose>
						<div class="container">
							<p id="">�Ŀ���¥: ${e.DONATEDAY}</p>
							<p id="">������Ʈ : ${e.PROJECTNAME}</p>
							<p id="">�Ŀ� �ݾ� : ${e.DONATEMONEY}</p>
							<p id=""> 
							<c:choose>
							<c:when test="${e.PROJECTSTATUS==3}">
								�����Ϸ�
							</c:when>
							<c:when test="${e.PROJECTSTATUS==2}">
								������
							</c:when>
							</c:choose>
								<input id="donateNo" type="hidden" value="${e.DONATENO}">
								<input type="button" class="deleteBtn btns" value="��� ���">
								<input type="hidden" class="productNo" value="${e.PRODUCTNO}">
							</p>
						</div>
					</div>
				</td>

				<c:set var="i" value="${i+1 }" />
			</c:forEach>
		</tbody>
		<tfoot>
			<!-- ����¡ -->

			<tr>
				<td colspan="6" style="text-align: center">
					<%--Page ���� ������ ���� --%> <c:choose>
						<c:when test="${searchType == null}">
							<c:choose>
								<c:when test="${pageInfo.currentBlock eq 1}">
                    ��
                           </c:when>
								<c:otherwise>
									<a
										href="mydonate?page=
         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
										��</a>
								</c:otherwise>
							</c:choose>

							<%--Page  ������ ���� --%>
							<c:choose>
								<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
									<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
										varStatus="num">
                        [<a
											href="mydonate?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&projectStatus=${cno}">
											${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach
										begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
										end="${pageInfo.totalPages}" varStatus="num">
                        [<a
											href="mydonate?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&projectStatus=${cno}">
											${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
								</c:otherwise>
							</c:choose>


							<%--Page ���� ������ ���� --%>
							<c:choose>
								<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ��
                </c:when>
								<c:otherwise>
									<a
										href="mydonate?page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }&projectStatus=${cno}">
										��</a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>

							<c:choose>
								<c:when test="${pageInfo.currentBlock eq 1}">
                    ����
                           </c:when>
								<c:otherwise>
									<a
										href="mydonate?searchType=${searchType}&searchValue=${searchValue}&page=
         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }&projectStatus=${cno}">
										��</a>
								</c:otherwise>
							</c:choose>

							<%--Page  ������ ���� --%>
							<c:choose>
								<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
									<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
										varStatus="num">
                        [<a
											href="mydonate?searchType=${searchType}&searchValue=${searchValue}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&projectStatus=${cno}">
											${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach
										begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
										end="${pageInfo.totalPages}" varStatus="num">
                        [<a
											href="mydonate?searchType=${searchType}&searchValue=${searchValue}&page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&projectStatus=${cno}">
											${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
								</c:otherwise>
							</c:choose>


							<%--Page ���� ������ ���� --%>
							<c:choose>
								<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ����
               						 </c:when>
								<c:otherwise>
									<a
										href="mydonate?searchType=${searchType}&searchValue=${searchValue}&page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }&projectStatus=${cno}">
										��</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
<script>
	$(function() {
		$('.deleteBtn').each(
				function(index, item) {
					$(this).click(
							function() {
								var result = confirm('�Ŀ��� ��� �Ͻðڽ��ϱ�?');
								console.log($(this).next().val());

								if (result) {
									location.href = 'cancle?donateNo='
											+ $(this).prev().val()
											+ '&productNo='
											+ $(this).next().val();
								}
							});
				});
	});
	
	$(function() {
		$('#status').on('change', function() {
			let Pstatus = $(this).val();
			 
			 if(Pstatus == 3){
				  location.href="mydonate?projectStatus="+$('#status').val();
			 }else if(Pstatus == 2){
				 location.href="mydonate?projectStatus="+$('#status').val();
			 }else if(Pstatus == 0){
				 location.href="mydonate";
			 }
		});
	});
</script>