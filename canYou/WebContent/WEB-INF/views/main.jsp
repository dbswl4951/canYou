<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="resources/js/myplugin.js"></script>

<style>
.subject{
	color: black;
	font-size: 18px;
	line-height: 4em;
	font-weight: bold;
}
.proimg{
	margin: 5px 35px 10px 70px; 
	width: 180px; 
	height: 140px;
}

div.scrollmenu {
  background-color: white;
  overflow: auto;
  white-space: nowrap;
  width: 1200px;
}

div.scrollmenu a {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px;
  text-decoration: none;
}

div.scrollmenu a:hover {
  background-color: #777;
}

</style>    

<div><img src="resources/images/1.jpg" id="g"
		style="margin: 40px 30px 30px 280px; width: 580px; height: 250px;">
</div>
			
<table>
		<thead>
			<tr>
				<td class="subject">
					�α� ������Ʈ
				</td>
			</tr>
			<tr>
				<td>
					<div class="scrollmenu">
						<a href=""><img src="resources/images/campaign.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/music1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/campaign2.jpg" class="proimg"></a> 
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="subject">
					���ο� ������Ʈ
				</td>
			</tr>
			<tr>
				<td>
					<div class="scrollmenu">
						<a href=""><img src="resources/images/food.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/fashion1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/campaign3.jpg" class="proimg"></a> 
						<a href=""><img src="resources/images/food3.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="subject">
					���� �ӹ� ������Ʈ
				</td>
			</tr>
			<tr>
				<tr>
				<td>
					<div class="scrollmenu">
						<a href=""><img src="resources/images/fashion3.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/opps2.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/video1.jpg" class="proimg"></a> 
						<a href=""><img src="resources/images/tech2.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
						<a href=""><img src="resources/images/game1.jpg" class="proimg"></a>
					</div>
				</td>
			</tr>
		</thead>
</table>

<div style="float: left; width: 50%"><img src="resources/images/11.jpg" 
		style="margin: 80px 30px 30px 60px; width: 460px; height: 120px;"></div>
<div style="float: right; width: 50%"><img src="resources/images/22.jpg" class="rightimg"
		style="margin: 80px 30px 30px 60px; width: 460px; height: 120px;"></div>
		
<script>

$(document).ready(function(){
	$('#g').myPluginFn();
})

</script>