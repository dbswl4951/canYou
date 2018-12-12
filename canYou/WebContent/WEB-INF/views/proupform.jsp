<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>canYou</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.4.7/full/ckeditor.js"></script>
<script>
$(document).ready(function(){
	var d = new Date();
	var min = new Date();	// �ּ���
	var max = new Date();	// �ִ���
	min.setDate(d.getDate()+10);
	max.setDate(d.getDate()+60);
	
	var mon=min.getMonth()+1;
	var mon2=max.getMonth()+1;
	
	var day=min.getDate();
	var day2=max.getDate();
	
	if(mon<10){
		mon="0"+mon;
	}
	if(mon2<10){
		mon2="0"+mon2;
	}
	
	if(day<10){
		day="0"+day;
	}
	if(day2<10){
		day2="0"+day2;	
	}
	
	$('#projectEndDate').attr("min", min.getFullYear()+"-"+mon+"-"+day);
	$('#projectEndDate').attr("max", max.getFullYear()+"-"+mon2+"-"+day2);
	
	var data=Array();
	var data2=Array();
	var data3=Array();
	var data4=Array();
	
	CKEDITOR.replace('cont', {
		height: '500px' ,
		filebrowserImageUploadUrl: 'imageUpload'
	})
	
	$("#preadd").click(function(){
		var tr = "<tr><td id=\"pname\">"+$("#productName").val()+"</td><td id=\"pcnt\">"+$("#productCnt").val()+"</td><td id=\"pinfo\">"+$("#productInfo").val()+"</td><td id=\"pcost\">"+$("#productCost").val()+"</td></tr>";
		$("tbody").append(tr);
	});
	
	$("#add").click(function(){
		$("tbody tr #pname").each(function(i, v){
			data[i]=$(this).text();
		});
		$("tbody tr #pcnt").each(function(i, v){
			data2[i]=$(this).text();
		});
		$("tbody tr #pinfo").each(function(i, v){
			data3[i]=$(this).text();
		});
		$("tbody tr #pcost").each(function(i, v){
			data4[i]=$(this).text();
		});
		$("#proname").val(data);
		$("#procnt").val(data2);
		$("#proinfo").val(data3);
		$("#procost").val(data4);
	});
	
	$('#projectCost').keypress(function(event){ 
		if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){ 
			event.preventDefault(); 
		}
	});
	
	$('#productCnt').keypress(function(event){ 
		if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){ 
			event.preventDefault(); 
		}
	});
});
</script>
</head>
<body>
<h1>������Ʈ ���ε�</h1>
<form action="proup" method="post" enctype="multipart/form-data">
<input type="hidden" id="proname" name="proname">
<input type="hidden" id="procnt" name="procnt">
<input type="hidden" id="proinfo" name="proinfo">
<input type="hidden" id="procost" name="procost">
<ul>
	<li>������ �̸� : ${memberName }</li>
	<li>������Ʈ �̸� : <input type="text" name="projectName" required></li>
	<li>������Ʈ ��ǥ �̹��� : <input type="file" name="mfile"></li>
	<li>������Ʈ ī�װ� : <select name="categoryNo" required>
					<option value="" selected>����</option>
					<c:forEach var="v" items="${category}">
						<option value="${v.categoryNo}">${v.categoryName}</option>
    				</c:forEach>
				  </select></li>
	<li>������Ʈ ���� ��¥(���� ��¥���� 10~60�� ���ķ� ���� ����) : <input type="date" id="projectEndDate" name="projectEndDate"></li> <!-- �������� �ϼ��Ұ� -->
	<li>���� ����
		<ul>
			<li><h2>���� �߰��ϱ�</h2></li>
			<li>���� ���� : <textarea id="productName" rows="5" cols="30"></textarea></li>
			<li>���� ���� : <input type="number" id="productCnt" min=1></li>
			<li>���� ���� : <textarea id="productInfo" rows="5" cols="30"></textarea></li>
			<li>�Ŀ� �ݾ� : <input type="text" id="productCost"></li>
			<li><input type="button" id="preadd" value="���� �߰�"></li>
		</ul>
		<table>
			<thead>
				<tr>
					<th>���� ����</th>
					<th>���� ����</th>
					<th>���� ����</th>
					<th>�Ŀ� �ݾ�</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</li>
	
	<li>��ǥ �ݾ� : <input type="text" id="projectCost" name="projectCost" required></li>
	<li>������Ʈ ���丮 : <br><textarea rows="20" cols="20" name="projectStory" id="cont"></textarea></li>
	
	<li><input type="submit" id="add" value="��û"></li>
</ul>
</form>
</body>
</html>