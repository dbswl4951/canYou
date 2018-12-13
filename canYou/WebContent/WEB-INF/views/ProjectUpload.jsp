<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>������Ʈ ���ε�</h1>
<nav class="navbar navbar-expand-sm bg-light">
<ul class="upmenu navbar-nav">
	<li class="nav-item"><a id="i1" class="nav-link" href="#">������Ʈ ����</a></li>
	<li class="nav-item"><a id="i2" class="nav-link" href="#">������Ʈ �ݵ� �� ��������</a></li>
	<li class="nav-item"><a id="i3" class="nav-link" href="#">������Ʈ ���丮 �ڸ�</a></li>
</ul>
</nav>
<form action="proup" method="post" enctype="multipart/form-data">
<input type="hidden" id="proname" name="proname">
<input type="hidden" id="procnt" name="procnt">
<input type="hidden" id="proinfo" name="proinfo">
<input type="hidden" id="procost" name="procost">
<div id="info1">
	<p>������ �̸� : ${memberName }</p>
	<p>������Ʈ �̸� : <input type="text" name="projectName" required></p>

	<div class="custom-file mb-3">������Ʈ ��ǥ �̹��� : <input type="file" class="custom-file-input" id="mfile" name="mfile" >
			<label class="custom-file-label" for="mfile">���� ÷��</label>
			<img id="projectMainImage" style="margin: 60px 10px 10px 10px; width: 260px; height: 280px;"></div>
	<p>������Ʈ ī�װ� : <select id="categoryNo" name="categoryNo" required>

					<option value="" selected>����</option>
					<c:forEach var="v" items="${category}">
						<option value="${v.categoryNo}">${v.categoryName}</option>
    				</c:forEach>
				  </select>
				  <select id="subCategoryNo" name="subCategoryNo">
				     <option value="" selected>����</option>
				  </select>
	</p>
	<p>������Ʈ ���� ��¥(���� ��¥���� 3�����ĺ��� ���� �����մϴ�.) : <input type="date" id="projectStartDate" name="projectStartDate"></p>
	<p>������Ʈ ���� ��¥(���� ��¥���� 10~60�� ���ķ� ���� ����) : <input type="date" id="projectEndDate" name="projectEndDate" disabled></p> <!-- �������� �ϼ��Ұ� -->
</div>
<div id="info2" style="display: none;">
<ul>

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
</ul>
</div>
<div id="info3" style="display: none;">
<ul>	
	<li>������Ʈ ���丮 : <br><textarea rows="20" cols="20" name="projectStory" id="cont"></textarea></li>
</ul>

</div>
<input type="submit" id="add" value="��û">
</form>

<script>
$(document).ready(function(){
	var d = new Date();
	
	var smin=new Date();
	smin.setDate(d.getDate()+3);
	var smon=smin.getMonth()+1;
	var sday=smin.getDate();
	if(smon<10){
		smon="0"+smon;
	}
	if(sday<10){
		sday="0"+sday;
	}
	
	
	
	$('#projectStartDate').attr("min", smin.getFullYear()+"-"+smon+"-"+sday);
	
	
	
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
	

	$('#categoryNo').click(function(){
		if($(this).val()!=''){
			$.ajax({
				url: 'subcasel',
				async:true,
				type:'POST',
				data:{
					categoryNo: $('#categoryNo').val()
				},
				dataType:'text',
				success: function(jqXHR){
					var obj = JSON.parse(jqXHR);
					$('#subCategoryNo').empty();
					$('#subCategoryNo').append("<option value='-1'>����</option>");
					$.each(obj,function(index,item){
	                   var option=$("<option value="+item.subcategoryNo+">"+item.subcategoryName+"</option>")
	                   $('#subCategoryNo').append(option);
	                });
					
				}
			})
		}else{
			$('#subCategoryNo').empty();
			$('#subCategoryNo').append("<option value=''>����</option>");
		}
	});
	
	$('#projectStartDate').change(function(){	// ���۳�¥�� ������
			var min = new Date($(this).val());	// ���� ��¥ �ּ���(~10��)
			var max = new Date($(this).val());	// ���� ��¥ �ִ���(~60��)
			min.setDate(min.getDate()+10);
			max.setDate(max.getDate()+60);
			
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
			$('#projectEndDate').val(min.getFullYear()+"-"+mon+"-"+day);
			$('#projectEndDate').removeAttr("disabled");
	});
	
	$('#i1').click(function () {
		if($("#info1").is(":visible")){
            $("#info1").slideUp();
        }else{
            $("#info1").slideDown();
            $("#info2").slideUp();
            $("#info3").slideUp();
        }
	})
	
	$('#i2').click(function () {
		if($("#info2").is(":visible")){
            $("#info2").slideUp();
        }else{
            $("#info2").slideDown();
            $("#info1").slideUp();
            $("#info3").slideUp();
        }
	})
	
	$('#i3').click(function () {
		if($("#info3").is(":visible")){
            $("#info3").slideUp();
        }else{
            $("#info3").slideDown();
            $("#info2").slideUp();
            $("#info1").slideUp();
        }
	})
});
</script>

<script type="text/javascript">
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

$('#productCost').keypress(function(event){ 
	if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8){ 
		event.preventDefault(); 
	}
});
</script>

<script>
$(function() {
	$('#projectMainImage').hide(0,function(){});
	$('#mfile').on('change', function() {
		let mfile = $(this).val();
		 let pass = mfile.substr(12);
		 if(mfile != null){
			 $('#projectMainImage').attr('src', 'resources/images/' + pass).show(0,function(){});
			 
		 } else{
			 $('#projectMainImage').attr('src', 'resources/images/' + pass).hide(0,function(){});
			 
		 }
	});
});
</script>
