<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div>
	<div id="header2">
		<h1> uri : jQuery : </h1>
		<p id="time">2018-11-20</p>
	</div>
	<div id="content">
		<p>����� ���� ������</p>
		<form method="post" action="upsave2" 
  enctype="multipart/form-data">
   <table>
    <tr><th colspan="2">���� ���ε� ��������</th></tr>
    
    <tr>
     <td>�ۼ���</td>
     <td><input type="text" name="writer">
     </td>
    </tr>
    
    <tr>
    <td>��ǰ�̹���</td>
    <td>
     <input type="file" name="multipartFile">
    </td>
    </tr>
    
    <tr><td colspan="2">
     <input type="submit" value="Send"></td></tr>
     
   </table>
  </form>
	</div>
</div>
<style>
	#cont{width:500px; margin: auto;}
	#cont table {width: 100%; border: 1px dotted #000;
	text-align: center; height: 150px}
	#cont table th{ font-size: 20px; color:gray;}
</style>