<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="wdetail.jsp" %>
<!-- Nav tabs storypage.jsp = ������Ʈ ���丮 -->
         	<div id="underlinemenu">
         	<ul>
                <li><a class="hoverHolder" href="admin.wstory?projectNo=${list.projectNo}" class="current">������Ʈ ���丮</a></li>
                <li><a href="admin.wproductDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
                <li><a href="">ȯ�� �� ��ȯ</a></li>
            </ul> 
            </div> 
<!-- Nav tabs -->
<!-- ���丮 �κ� -->
<div class="divStory">
<p style="margin:3%">${list.projectStory}</p>
</div>