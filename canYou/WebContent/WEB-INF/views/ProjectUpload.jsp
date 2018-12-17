<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#pform{
		margin: 10px;
	}

	#info1{
		border: 1px solid gray;
		margin: 10px;
		padding-left:10px;
		padding-right:10px;
		border-radius: 5px;
	}
	
	#info2{
		
		border: 1px solid gray;
		margin: 10px;
		padding: 10px;
		border-radius: 5px;
	}
	
	#info3{
		border: 1px solid gray;
		margin: 10px;
		padding-top:10px;
		padding-left:10px;
		padding-right:10px;
		border-radius: 5px;
		padding-bottom: 10px;
	}
	
	.title{
		borer-bottom: 1px dotted gray;
		color: gray;
		font-weight: bold;
	}
	
	#prouptitle{
		font-weight: bold;
		font-size:35px;
		margin-bottom:10px;
		color: gray;
		text-align: center;
	}
	
	#add{	/* �߰� ��ư */
		font-weight: bold;
		float: right;
		border-right:10px;
		border-bottom:10px;
	}
	
	.category{
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
	
	.pupinput{
		border: 1px solid #999;
		border-radius: 5px;
	}
	
	.pupdate{
		border: 1px solid #999;
		border-radius: 5px;
	}
	
	#prostory{
		borer-bottom: 1px dotted gray;
		color: gray;
		font-weight: bold;
		font-size:20px;
	}
	
	#present > li{
		magin: 5px;
	}
	
	#pretitle{
		font-weight: bold;
		font-size:20px;
		margin-bottom:10px;
		color: gray;
		text-align: center;
	}
	
	#pretable{
		text-align: center;
		width: 100%;
	}
	
	#pretable > th, td{
		
		border-bottom: 1px solid #ddd;
	}
	
</style>
<div id="pform">
<h1 id="prouptitle">* ������Ʈ ���ε� *</h1>
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
	<p><span class="title">������ �̸� : </span>${memberName }</p>
	<p><span class="title">������Ʈ �̸� : </span><input type="text" name="projectName" class="pupinput" required></p>

	<div class="custom-file mb-3"><span class="title">������Ʈ ��ǥ �̹��� : </span><input type="file" class="custom-file-input" id="mfile" name="mfile" >
			<label class="custom-file-label" for="mfile">���� ÷��</label>
			<img id="projectMainImage" style="margin: 60px 10px 10px 10px; width: 260px; height: 280px;"></div>
	<p><span class="title">������Ʈ ī�װ� : </span><select class="category" id="categoryNo" name="categoryNo" required>

					<option value="" selected>����</option>
					<c:forEach var="v" items="${category}">
						<option value="${v.categoryNo}">${v.categoryName}</option>
    				</c:forEach>
				  </select>
				  <select class="category" id="subCategoryNo" name="subCategoryNo">
				     <option value="" selected>����</option>
				  </select>
	</p>
	<p><span class="title">������Ʈ ���� ��¥(���� ��¥���� 3�����ĺ��� ���� �����մϴ�.) : </span><input type="date" id="projectStartDate" name="projectStartDate" class="pupdate"></p>
	<p><span class="title">������Ʈ ���� ��¥(���� ��¥���� 10~60�� ���ķ� ���� ����) : </span><input type="date" id="projectEndDate" name="projectEndDate" class="pupdate" disabled></p> <!-- �������� �ϼ��Ұ� -->
</div>
<div id="info2" style="display: none;">
	<h2 id="pretitle">���� ����</h2>
	<hr>

	<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<div id="addpre">
				<span class="title" style="font-size:20px;">���� �߰��ϱ�</span>
				<p><span class="title">���� ���� : </span></p>
				<p><textarea id="productName" class="pupinput" rows="5" cols="50"></textarea></p>
			
				<p><span class="title">���� ���� : </span><input type="number" class="pupinput" id="productCnt" min=1></p>
				<p><span class="title">���� ���� : </span></p>
				<p><textarea id="productInfo" class="pupinput" rows="5" cols="50"></textarea></p>
		
				<span class="title">�Ŀ� �ݾ� : </span><input type="text" class="pupinput" id="productCost">
				<input type="button" id="preadd" class="btn btn-default" value="���� �߰�">
				<p><span class="title">��ǥ �ݾ� : </span><input type="text" id="projectCost" name="projectCost" class="pupinput" required></p>
			</div>	
		</div>
	
		<div  class="col-md-6">
			<div id="preinfo">	
				<table id="pretable">
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
			</div>
		</div>
	</div>
</div>
</div>
<div id="info3" style="display: none;">	
	<span id="prostory">������Ʈ ���丮 <img src="resources/images/down.png" width=30px height=30px> </span><br><textarea rows="20" cols="20" name="projectStory" id="cont"></textarea>
</div>
<input type="submit" id="add" class="btns" value="��û">
</form>
</div>

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
		var tr = "<tr><td id=\"pname\">"+$("#productName").val()+"</td><td id=\"pcnt\">"+$("#productCnt").val()+"</td><td id=\"pinfo\">"+$("#productInfo").val()+"</td><td id=\"pcost\">"+$("#productCost").val()+"��</td></tr>";
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

