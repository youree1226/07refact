<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--x
<%@ page import="com.model2.mvc.service.domain.*" %><%-- --%>

<%-- 
<% 
	Purchase purchase = (Purchase)request.getAttribute("purchase"); 
	User user = (User)session.getAttribute("user");
	
	System.out.println("addPurchase.jsp - Purchase : "+purchase);
	System.out.println("addPurchase.jsp - User : "+user);%>--%>



<html>
<head>
<title>��ǰ ���� �Ϸ�</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${purchase.tranNo }" method="get">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchase.purchaseProd.prodNo}</td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
			<c:choose>
				<c:when test="${purchase.paymentOption=='1'}">���ݱ���</c:when>
				<c:when test="${purchase.paymentOption=='2'}">�ſ뱸��</c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${!empty purchase.receiverName ? purchase.receiverName : ''}</td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${!empty purchase.receiverPhone ? purchase.receiverPhone : ''}</td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${!empty purchase.divyAddr ? purchase.divyAddr : ''}</td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${!empty purchase.divyRequest ? purchase.divyRequest : ''}</td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${!empty purchase.divyDate ? purchase.divyDate : ''}</td>
	</tr>
</table>

<input type='submit' value='�����ϱ�'/>
<a href="/purchase/listPurchase"><input type='button' value='��Ϻ���'/></a>
</form>

</body>
</html>