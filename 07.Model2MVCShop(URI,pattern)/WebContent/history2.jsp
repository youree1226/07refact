<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>열어본 상품 보기</title>
</head>
<body>
	당신이 열어본 상품을 알고 있다
<br>
<br>
<c:out value="출력1"/>
<%	
	String history = null;
	String[] h = null;
	Cookie[] cookies = request.getCookies(); 
	
	request.setAttribute("cookies",cookies);%>
	
	<c:if test="${!empty cookies and cookies.length>0}">
		<c:forEach var="i" items="<%=cookies%>" begin="0" step="1">
			<c:set var="cookie" value="${cookies[i]}"/>
			<c:if test="${cookie.name=='history'}">
				<c:set name="history" value="${cookie}"/>
			</c:if>
		</c:forEach>
		<c:if test="${!empty history}">
		<c:out value="history != null"/>
		<%h = history.split(",");%>
			<c:forEach var="j" items="<%=h%>" begin="0" step="1">
				<c:if test="${!empty h[j]}">
<a href="/product/getProduct?prodNo=${h[j]}&menu=search" 	target="rightFrame">${h[j]}</a>
<br>
				</c:if>
			</c:forEach>
		</c:if>
	</c:if>
	



</body>
</html>