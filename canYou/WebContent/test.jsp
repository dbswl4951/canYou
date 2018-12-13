<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>Learn D3 in 5 minutes</title>
</head>

<script src='https://d3js.org/d3.v3.min.js'></script>
<style>
	svg{
		width: :320px;
		height: 240px;
		border: 1px solid black;
	}
	
	.bar {
	    fill: skyblue;
	}
	.bar:hover {
	    fill: blue;
	}

	.text { fill: blue; font-weight:bold; }
</style>
<body>
<svg width="500" height="300"></svg> 
<script>
	var data = [70, 20, 15, 16, 23, 42];
	var barHeight = 200;

	var svg = d3.select("svg");
	
	svg.selectAll("rect") //chart�ȿ� ��� div�� ����
			  .data(data) //������ ���ǵ� ������([4,8,15,16,23,42])�� selection.data()�� ����Ͽ� bar�� �־� ��. �̷ν� bar�� 6���� �����͸� ����  
			  //6���� �����͸� ������ ������, ǥ���� �� �ִ� rect�� ���� ���ǵǾ� ���� ����
			  //���� �Ʒ��� ���� enter().append("rect")�� ����ؼ� 6���� �����͸� ǥ���� �� �ִ� rect 6���� ����
			  .enter().append("rect")
			  .attr("class", "bar")
	          .attr("width",70)
	          .attr("height", function(d,i){return d})
	          .attr("x", function(d, i) {return (80 * i)}) 
	          .attr("y", function(d, i) {return (200 -d)}); //d = data[i]

	svg.selectAll("text") 
		.data(data)
		.enter().append("text")
		.text(function(d) {return d})
		.attr("class", "text")
		.attr("x", function(d, i) {return (80 * i)+25}) 
	    .attr("y", function(d, i) {return (200 -d)});

</script>
</body>
</html>