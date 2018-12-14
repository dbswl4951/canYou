<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
#t1 {
	text-align: center;
	margin: 0 auto;
	border-spacing: 40px;
	/* border-collapse: separate; */
}

.t2 {
	border: 3px double black;
	padding: 0px;
	width: 280px;
	height: 260px;
}
</style>
<div id="mydonateList">
	<h1 style="font-size: 20px">�� �Ŀ���Ȳ</h1>
	<br>
	<div style="float: left; width: 50%;">
	<select id="exam"  style="width:320px">
	<option value="1">��κ���</option>
	<option value="2">�ݵ�������</option>
	<option value="3">�����Ϸ�</option>
	</select>
	</div>
	
	<div style="float: left; width: 50%;">
		<input type="text" size="50px" />
		<input type="submit" value="�˻�"></input>
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
					<div id="">
						<a href="list?num=${e.PROJECTNO}"> 
						<img id="projectMainImage"
							src="resources/images/${e.PROJECTMAINIMAGE}"
							style="margin: 0px 0px 0px 0px; width: 100%; height: 240px;">
						</a>
					</div>
					<p id="">�Ŀ���¥: ${e.DONATEDAY}</p>
					<p id="">������Ʈ : ${e.PROJECTNAME}</p>
					<p id="">�Ŀ� �ݾ� : ${e.DONATEMONEY}</p>
					<p id="">
						<input id="donateNo" type="hidden" value="${e.DONATENO}">
						<input type="button" class="deleteBtn" value="��� ���"> <input
							type="hidden" class="productNo" value="${e.PRODUCTNO}">
					</p> <!-- ��ǰ ��ȣ -->
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
										<c:when
											test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
											<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
												varStatus="num">
                        [<a
													href="mydonate?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
													${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach
												begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
												end="${pageInfo.totalPages}" varStatus="num">
                        [<a
													href="mydonate?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
													${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
										</c:otherwise>
									</c:choose>


									<%--Page ���� ������ ���� --%>
									<c:choose>
										<c:when
											test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ��
                </c:when>
										<c:otherwise>
											<a
												href="mydonate?page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
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
         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
												��</a>
										</c:otherwise>
									</c:choose>

									<%--Page  ������ ���� --%>
									<c:choose>
										<c:when
											test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
											<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
												varStatus="num">
                        [<a
													href="mydonate?searchType=${searchType}&searchValue=${searchValue}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
													${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach
												begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
												end="${pageInfo.totalPages}" varStatus="num">
                        [<a
													href="mydonate?searchType=${searchType}&searchValue=${searchValue}&page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
													${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
										</c:otherwise>
									</c:choose>


									<%--Page ���� ������ ���� --%>
									<c:choose>
										<c:when
											test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ����
               						 </c:when>
										<c:otherwise>
											<a
												href="mydonate?searchType=${searchType}&searchValue=${searchValue}&page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
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
					$('.deleteBtn')
							.each(
									function(index, item) {
										$(this)
												.click(
														function() {
															var result = confirm('�Ŀ��� ��� �Ͻðڽ��ϱ�?');
															console.log($(this)
																	.next()
																	.val());

															if (result) {
																location.href = 'cancle?donateNo='
																		+ $(
																				this)
																				.prev()
																				.val()
																		+ '&productNo='
																		+ $(
																				this)
																				.next()
																				.val();
															}
														});
									});
				});
			</script>