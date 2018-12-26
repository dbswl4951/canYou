<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
#t1 {
	text-align: center;
	margin: 0 auto;
	border-spacing: 40px;
}
.imgmar{
	margin: 10px 10px 10px 10px;
	width: 280px; 
	height: 240px;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: auto;
  height: auto;
  margin-left: 30px;
  margin-top: 20px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.7);
}

.container {
  padding-top: 3px;
  padding-bottom: 3px;
}

#exam{
	 width: 200px; /* ���ϴ� �ʺ��� */
    padding: .2em .3em; /* �������� ���� ���� */
    font-family: inherit;  /* ��Ʈ ��� */
    background: url('resources\images\down.png') no-repeat 95% 50%; /* ����Ƽ�� ȭ��ǥ�� Ŀ���� ȭ��ǥ�� ��ü */
    border: 1px solid #999;
    -webkit-appearance: none; /* ����Ƽ�� ���� ���߱� */
    -moz-appearance: none;
    appearance: none;
	border-radius: 5px;
}

#searchIndex{
	border: 1px solid #999;
	border-radius: 5px;
}

h1{
	font-size: 40px;
	font-weight: bold;
	color: gray;
	margin-top:10px;
}

</style>
<div id="mydonateList">
	<div align="center">
	<h1>���� ���� ������Ʈ �˻�  ���</h1>
	</div>
	<br>
	<div style="float: left; width: 50%;">
	<select id="exam"  style="width:320px">
	<option value="1">������</option>
	<option value="2">������</option>
	<option value="3">�Ŀ�����</option>
	<option value="3">����ݷ�</option>
	</select>
	</div>
	<div align="right">
		<form method="POST" action="myprojectearch">
			<input type="hidden" name="page" value="1"> 
				<input name="searchValue"
				id="searchIndex" size="80px" pattern=".{2,}"
				title="�ּ��� 2�� �̻��� ���ڰ� �־�� �մϴ�."> <input type="submit"
				value="�˻��ϱ�" class="btns">
		</form>
	</div>
	<br>
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
				<td>
				<div class="card">
						<c:choose>
							<c:when test="${e.projectStatus==2}">
								<a href="story?projectNo=${e.projectNo }">
									<img class="imgmar" src="resources/images/${e.projectMainImage }">
								</a>
							</c:when>
							<c:when test="${e.projectStatus==3}">
								<div class="endcontainer">
								<a href="story?projectNo=${e.projectNo }">
										<img class="imgmar endpro" src="resources/images/${e.projectMainImage }">
								</a>
								<div class="centered">����<br>����</div>
								</div>
							</c:when>
						</c:choose>
					<div class="container">
							<p id="">������Ʈ �� : ${e.projectName}</p>
							<hr>
							<p id="">������Ʈ ��� : ${e.projectStep}</p>
							<p id="">���࿩�� : 
							<c:choose>
							<c:when test="${e.projectStatus==1}">
								������
							</c:when>
							<c:when test="${e.projectStatus==2}">
								������
							</c:when>
							<c:when test="${e.projectStatus==3}">
								���� ����
							</c:when>
							<c:when test="${e.projectStatus==4}">
								�ɻ� �ź�
							</c:when>
						</c:choose>
							</p>
							<p id="">��ǥ�ݾ� : ${e.projectCost}</p>
							<p id="">������Ʈ ���۳�¥ : ${e.projectStartDate}</p>
							<p id="">������Ʈ ������¥ : ${e.projectEndDate}</p>
							<p id="">�Ŀ��� �� : ${e.projectFundCnt}</p>
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
										href="myprojectearch?page=
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
											href="myprojectearch?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
											${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach
										begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
										end="${pageInfo.totalPages}" varStatus="num">
                        [<a
											href="myprojectearch?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
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
										href="myprojectearch?page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
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
										href="myprojectearch?searchType=${searchType}&searchValue=${searchValue}&page=
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
											href="myprojectearch?searchType=${searchType}&searchValue=${searchValue}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
											${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach
										begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
										end="${pageInfo.totalPages}" varStatus="num">
                        [<a
											href="myprojectearch?searchType=${searchType}&searchValue=${searchValue}&page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
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
										href="myprojectearch?searchType=${searchType}&searchValue=${searchValue}&page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
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

