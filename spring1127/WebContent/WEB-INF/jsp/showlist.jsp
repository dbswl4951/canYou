<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content">
		<p>����� ���� ������</p>
		<div>
			<fieldset>
				<legend></legend>
				<table>
					<thead>
					<tr>
						<td>��ȣ</td>
						<td>�̹���</td>
						<td>�ۼ���</td>
						<td>��¥</td>
						<td>down</td>
					</tr>
					</thead>
					<tbody>
						<c:forEach var="listv" items="${list }">
							<tr>
								<td>${listv.num }</td>
								<td>${listv.img }</td>
								<td>${listv.writer }</td>
								<td>${listv.rdate }</td>
								<td><a href="fileDown?fileName=${listv.img}" style="color:black"
								>down</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					<tr><td colspan="5">
						<input type="button" id="btn1" value="writer">
					</td></tr>
					<tr><td colspan="5">
						<a href="downloadExcel" style="color:black">download Excel</a>
					</td></tr>
					</tfoot>
				</table>
			</fieldset>
		</div>
	</div>
</div>