<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
	#searchType{
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
</style>
<div align="center">
	<h1>������Ʈ �ѷ�����</h1>
	<form method="POST" action="search">
		<input type="hidden" name="page" value="1">
		<select name="searchType" id="searchType">
			<option value="1">�ۼ���</option>
			<option value="2">������Ʈ��</option>
		</select>&nbsp; <input name="searchValue" id="searchIndex" size="100px"
		pattern=".{2,}"
		title="�ּ��� 2�� �̻��� ���ڰ� �־�� �մϴ�."> 
		
		
		<input type="submit" value="�˻��ϱ�" class="btns">
	</form>
	<table>
		<tr align="center">
			<td style="padding-top: 30px"><h3>
					<a href="lookaround">��� ������Ʈ ����</a>
				</h3></td>
			<td style="padding-top: 30px"><h3>
					<a href="">�Ⱓ�� �ѷ�����</a>
				</h3></td>
			<td style="padding-top: 30px"><h3>
					<a href="graph">��躰 �ѷ�����</a>
				</h3></td>
		</tr>
		<tr align="center">
			<td><img src="resources/images/category.PNG"
				style="margin: 60px 10px 10px 10px; width: 250px; height: 300px;"></td>
			<td><img src="resources/images/12cal.jpg"
				style="margin: 60px 10px 10px 10px; width: 250px; height: 300px;"></td>
			<td><img src="resources/images/graph1.png"
				style="margin: 60px 10px 10px 10px; width: 250px; height: 300px;"></td>
		</tr>
	</table>
</div>
<script>

</script>