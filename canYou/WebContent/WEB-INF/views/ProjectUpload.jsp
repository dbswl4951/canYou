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
	
	#projectMainImage{
		width:100%;
		height:90%;
		
		margin-top:5%;
	}
	
	.filebox input[type="file"] {
    	position: absolute;
    	width: 1px;
    	height: 1px;
    	padding: 0;
    	overflow: hidden;
		clip:rect(0,0,0,0);
    	border: 0;
	}

	.filebox label {
    	display: inline-block;
    	padding: .5em .75em;
    	color: #999;
    	font-size: inherit;
    	line-height: normal;
    	vertical-align: middle;
    	background-color: #fdfdfd;
    	cursor: pointer;
    	border: 1px solid #ebebeb;
    	border-bottom-color: #e2e2e2;
    	border-radius: .25em;
        margin-bottom: 0
	}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.filebox.bs3-primary label {
  color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}

.modal-body p:hover{
	cursor:pointer;
}
</style>
<div id="pform">
<h1 id="prouptitle">* ������Ʈ ���ε� *</h1>
<nav class="navbar navbar-expand-sm bg-light">
<ul class="upmenu navbar-nav">
	<li class="nav-item"><a id="i1" class="nav-link" href="#">������Ʈ ����</a></li>
	<li class="nav-item"><a id="i2" class="nav-link" href="#">������Ʈ �ݵ� �� ��������</a></li>
	<li class="nav-item"><a id="i3" class="nav-link" href="#">������Ʈ ���丮 �ڸ�</a></li>
	<c:choose>
		<c:when test="${cnt>0}">
			<li class="nav-item"><a id="i4" class="nav-link" href="#" data-toggle="modal" data-target="#myModal">�ӽ�����(${cnt })</a></li>
		</c:when>
	</c:choose>
</ul>
</nav>
<c:choose>
		<c:when test="${cnt>0}">
			<div class="modal" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">�ӽ������ ������Ʈ</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        <c:forEach var="v" items="${tlist}">
						<p data-dismiss="modal"><input type="hidden" id="tpronum" value="${v.projectNo}"/>${v.projectName} ... </p>
    				</c:forEach>
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
			      </div>
			
			    </div>
			  </div>
			</div>
	</c:when>
</c:choose>

<form id="my-form" action="proup" method="post" enctype="multipart/form-data">
<input type="hidden" id="proname" name="proname">
<input type="hidden" id="procnt" name="procnt">
<input type="hidden" id="proinfo" name="proinfo">
<input type="hidden" id="procost" name="procost">
<div id="info1">
<div class="container-fluid">
<div class="row">
	<div class="col-md-8">
	<p><span class="title">������ �̸� : </span>${memberName }</p>
	<p><span class="title">������Ʈ �̸� : </span><input type="text" id="projectName" name="projectName" class="pupinput" required></p>
	<div class="filebox preview-image">
		<p><span class="title">������Ʈ ��ǥ �̹��� : </span>
		<input class="upload-name" value="���ϼ���" disabled="disabled">
		<input type="hidden" class="upload-name" name="upload_name">
		<label for="mfile">���ε�</label> 
		<input type="file" id="mfile" name="mfile" class="upload-hidden">
		
		</p>
		
	</div>
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
	<p><span class="title">������Ʈ ���� ��¥(���� ��¥���� 3�����ĺ��� ���� �����մϴ�.) : </span><input type="date" id="projectStartDate" name="projectStartDate" class="pupdate" required></p>
	<p><span class="title">������Ʈ ���� ��¥(���� ��¥���� 10~60�� ���ķ� ���� ����) : </span><input type="date" id="projectEndDate" name="projectEndDate" class="pupdate" disabled></p> <!-- �������� �ϼ��Ұ� -->
	</div>
	<div class="col-md-4">
		<img id="projectMainImage">
	</div>

</div>
</div>

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
<input type="button" id="tadd" class="btns" value="�ӽ�����">
<input type="submit" id="add" class="btns" value="��û">
</form>
</div>

<script>
$(document).ready(function(){
	var d = new Date();
	var checkUnload = true;
	
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
	
	$(window).on("beforeunload", function(){	// �������� ��� �� ���â�� ��
		if(checkUnload) return "�ۼ����� ������Ʈ�� �ֽ��ϴ�. �� �������� ����ðڽ��ϱ�?";
	});
	
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
		if ($("#productName").val()=='' || $("#productCnt").val()=='' || $("#productInfo").val()=='' || $("#productCost").val()==''){
			alert("�� �׸��� �ֽ��ϴ�. �Է����ּ���");
		}else{
			var tr = "<tr><td id=\"pname\">"+$("#productName").val()+"</td><td id=\"pcnt\">"+$("#productCnt").val()+"</td><td id=\"pinfo\">"+$("#productInfo").val()+"</td><td><span id=\"pcost\">"+$("#productCost").val()+"</span>��</td></tr>";
			$("tbody").append(tr);
		}
	});
	
	$("#add").click(function(){
		checkUnload = false;
		
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
	
	function subcategoryajax(){
		$.ajax({
			url: 'subcasel',
			async:false,
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
	}

	$('#categoryNo').click(function(){
		if($(this).val()!=''){
			subcategoryajax();
		}else{
			$('#subCategoryNo').empty();
			$('#subCategoryNo').append("<option value=''>����</option>");
		}
	});
	
	$('#projectStartDate').on('change', {}, date_change);
	
	function date_change(){	// ���۳�¥�� ������
		var min = new Date($('#projectStartDate').val());	// ���� ��¥ �ּ���(~10��)
		var max = new Date($('#projectStartDate').val());	// ���� ��¥ �ִ���(~60��)
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
	};
	
	$('#i1').click(function () {
		if($("#info1").is(":visible")){
            $("#info1").slideUp();
        }else{
            $("#info1").slideDown();
            $("#info2").slideUp();
            $("#info3").slideUp();
        }
	});
	
	$('#i2').click(function () {
		if($("#info2").is(":visible")){
            $("#info2").slideUp();
        }else{
            $("#info2").slideDown();
            $("#info1").slideUp();
            $("#info3").slideUp();
        }
	});
	
	$('#i3').click(function () {
		if($("#info3").is(":visible")){
            $("#info3").slideUp();
        }else{
            $("#info3").slideDown();
            $("#info2").slideUp();
            $("#info1").slideUp();
        }
	});
	
	$('#tadd').click(function(){
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
		
		//var form = $('form')[0];
        var formData = new FormData();
        var value=CKEDITOR.instances['cont'].getData();
        
        
        // ajax�� �⺻ ���ڵ��� UTF-8�̹Ƿ� �̸� ���ڵ��� ���� (���� euc-kr)
        value=encodeURI(value);
        
        if($('#categoryNo').val()!=''){ formData.append('categoryNo', $('#categoryNo').val()) };
        if($('#subCategoryNo').val()!=''){ formData.append('subCategoryNo', $('#subCategoryNo').val()) };
        if($('#projectName').val()!=''){ formData.append('projectName', encodeURI($('#projectName').val())) };
        if($('#projectCost').val()!=''){ formData.append('projectCost', $('#projectCost').val()) };
        if($('#projectStartDate').val()!=''){ formData.append('projectStartDate', $('#projectStartDate').val()) };
        if($('#projectEndDate').val()!=''){ formData.append('projectEndDate', $('#projectEndDate').val()) };
        formData.append('mfile', $('#mfile')[0].files[0]);
        if(value!='') { formData.append('projectStory', value); }

        if($('#proname').val()!=''){ 
        	formData.append('proname', encodeURI($('#proname').val()));
        	formData.append('procnt', $('#procnt').val());
        	formData.append('proinfo', encodeURI($('#proinfo').val()));
        	formData.append('procost', $('#procost').val());
        }
        
        console.log(formData.has('projectName'));
		
		$.ajax({
			url: 'tadd',
			type:'POST',
			data: formData,
			contentType: false,
			processData: false,
			success: function(jqXHR){
				alert('�ӽ������� �Ϸ�Ǿ����ϴ�.');
				
			},
			error:function(request,status,error){
		        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
		    },
		})
	});
	
	$('.modal-body p').click(function(){		// �ӽ������ ������Ʈ ������ ������ ��
		$.ajax({
			url: 'seltpro',
			type:'POST',
			data: {
				projectNo:$(this).children('#tpronum').val(),
			},
			dataType:'text',
			success: function(jqXHR){
				var obj = JSON.parse(jqXHR);
				console.log(obj)
				
				$('#projectName').val(obj.project.projectName);
				$('#projectCost').val(obj.project.projectCost);
				CKEDITOR.instances.cont.setData(obj.project.projectStory);
				
				if(obj.project.projectMainImage!='null.jpg'){
					$('.upload-name').val(obj.project.projectMainImage);
					$('#projectMainImage').attr('src', 'resources/images/'+obj.project.projectMainImage);
					$('#projectMainImage').show();
				}
				
				if(obj.project.categoryNo!=0){
					$('#categoryNo option').attr('selected', false);
					$('#categoryNo option').each(function(){
						if($(this).val()==obj.project.categoryNo){
							$(this).attr('selected', true);
							return false; // break���� ����
						}
					})
					
					subcategoryajax();
					
					console.log("ī�װ� ��ȣ : " + obj.project.subCategoryNo);
					
					$('#subCategoryNo > option').each(function(){
						console.log($(this).val());
						
						if($(this).val()==obj.project.subCategoryNo){
							$(this).attr('selected', true);
							return false; // break���� ����
						}
					})
					
				}else{
					$('#categoryNo option').attr('selected', false);
					$('#categoryNo option').each(function(){
						if($(this).val()==''){
							
							$(this).attr('selected', true);
							return false; // break���� ����
						}
					})
					
					$('#subCategoryNo').empty();
					$('#subCategoryNo').append("<option value='-1'>����</option>");
				}
				if(obj.project.projectStartDate!=null){
					$('#projectStartDate').val(obj.project.projectStartDate);
					date_change();
					$('#projectEndDate').val(obj.project.projectEndDate);
				}
				
				$("tbody").empty();
				$.each(obj.product, function(key, val){		// ��ǰ�� �ҷ��ͼ� ���
					var tr = "<tr><td id=\"pname\">"+val.productName+"</td><td id=\"pcnt\">"+val.productCnt+"</td><td id=\"pinfo\">"+val.productInfo+"</td><td><span id=\"pcost\">"+val.productCost+"</span>��</td></tr>";
					
					$("tbody").append(tr);
				})
			}
		})
	});
	
	/* ���ڸ� �Է��ؾ��ϴ� �� ���� */
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
	/***********************************************************************************/
});
</script>

<!-- �̹��� ���ε� �� ���� �ּҿ��� �̹��� �ּҸ� ���ͼ� ���������� ������ -->
<script>
$('#projectMainImage').hide();

function readURL(input) {
	
    if (input.files && input.files[0]) {
        var reader = new FileReader();
 		
        $('.upload-name').val(input.files[0].name);
        reader.onload = function (e) {
            $('#projectMainImage').attr('src', e.target.result);
            
           
        }
 
        reader.readAsDataURL(input.files[0]);
       
    }
   
    $('#projectMainImage').show();
}
 
$("#mfile").change(function(){
    readURL(this);
});
</script>

