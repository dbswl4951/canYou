<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	#content{
		margin-top : 10px;
		margin-left:auto;
		margin-right:auto;
		width: 40%;
	}
	
	#content > h1{
		font-weight: bold;
		font-size:35px;
		margin-bottom:10px;
		color: gray;
		text-align: center;
	}
	
	#cardform{
		border: 1px solid gray;
		padding-left:20px;
		padding-right:10px;
		border-radius: 5px;
	}
	
	#pay{
		margin-left:80%;
	}
	
	.title{
		borer-bottom: 1px dotted gray;
		color: gray;
		font-weight: bold;
	}
	
	.pupinput{
		border: 1px solid #999;
		border-radius: 5px;
	}
	
	.category{
		 width: 100px; /* ���ϴ� �ʺ��� */
	    padding: .2em .3em; /* �������� ���� ���� */
	    font-family: inherit;  /* ��Ʈ ��� */
	    background: url('resources\images\down.png') no-repeat 95% 50%; /* ����Ƽ�� ȭ��ǥ�� Ŀ���� ȭ��ǥ�� ��ü */
	    border: 1px solid #999;
	    -webkit-appearance: none; /* ����Ƽ�� ���� ���߱� */
	    -moz-appearance: none;
	    appearance: none;
		border-radius: 5px;
		text-align:right;
		margin-right:5px;
	}
</style>
<script>
$(document).ready(function(){
	
});
</script>
<div id="content">
	<h1>ī�� ����</h1>		
	<div id="cardform">
		<form action="donate2" method="post">
			<p><span class="title">ī�� ��ȣ : </span><input type="text" class="pupinput"></p>
			<p><span class="title">ī�� ��ȿ �Ⱓ : 
			<select class="category" id="categoryNo" name="categoryNo" required>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
			</select>�� 
			
			<input type="text" class="pupinput">��</span></p>
			<p><span class="title">ī�� ��й�ȣ : </span><input type="password" size="2" class="pupinput">**</p>
			<p><span class="title">������ ������� : </span><input type="text" class="pupinput"></p>
			<p><input type="submit" id="pay" class="btns" value="����"></p>
		</form>
	</div>
</div>