<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="detail.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Nav tabs storypage.jsp = ������Ʈ ���丮 -->
         	<div id="underlinemenu">
         	<ul>
                <li><a class="hoverHolder" href="story?projectNo=${list.projectNo}" class="current">������Ʈ ���丮</a></li>
                <li><a href="productDetail?projectNo=${list.projectNo}">��ǰ ��</a></li>
                <li><a href="community?projectNo=${list.projectNo}" >Ŀ�´�Ƽ</a>
                
                </li>
                  <li>
                	<a href="graph?projectNo=${list.projectNo}" >�׷�������</a>
                </li>
                 <c:choose>
					<c:when test="${pageContext.request.userPrincipal.name!=null }">
                		<li><a href="projectDonateList?projectNo=${list.projectNo}&memberNo=${member.memberNo}">�Ŀ��� ����</a></li>
                	</c:when>
                </c:choose>
                <li><a href="">ȯ�� �� ��ȯ</a></li> 
            </ul> 
            </div> 
<!-- Nav tabs -->
<!-- ���丮 �κ� -->
<div class="divStory">
<p style="margin:3%">${list.projectStory}</p>
</div>
<%@ include file="recommend.jsp"%>
<script>

</script>