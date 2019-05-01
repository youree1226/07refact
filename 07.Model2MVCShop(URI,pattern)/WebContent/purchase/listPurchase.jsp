<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %> --%>


<%--
<%
	User user = (User)session.getAttribute("user");
	String menu = request.getParameter("menu");
	System.out.println("listPurchase.jsp - menu : "+menu);
	
	List<Purchase> list= (List<Purchase>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	Search search = (Search)request.getAttribute("search");
%> --%>


<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList() {
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listUser.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü  ${resultPage.totalCount } �Ǽ�, ����  ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="250">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="350">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="20" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />	
	
	<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td></td>
		<td align="center">
			<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a>
		</td>
		<td></td>
		<td align="left">
			<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
		</td>
		<td></td>
		<td align="left">
			${!empty purchase.receiverName? purchase.receiverName : ''}
		</td>
		<td></td>
		<td align="left">
			${!empty purchase.receiverPhone? purchase.receiverPhone: ''}
		</td>
		<td></td>
		<td align="left">����
			<c:if test="${purchase.tranCode=='1  '}">
				���ſϷ�
			</c:if>
			<c:if test="${purchase.tranCode=='2  '}">
				�����
			</c:if>
			<c:if test="${purchase.tranCode=='3  '}">
				��ۿϷ�
			</c:if>					
				���� �Դϴ�.</td>
		<td></td>
		<td align="left">			
			<c:if test="${purchase.tranCode=='2  '}">
				<a href="/purchase/updateTranCode?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3&page=${search.currentPage}">���ǵ���</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">		
		<%--/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// 	
		<%if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
		<% }else{ %>
				<!-- <a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a> -->
				<a href="/listPurchase.do?page=<%=resultPage.getCurrentPage()-1%>">�� ����</a>
		<% } %>
		
		<%for(int i=resultPage.getBeginUnitPage(); i<=resultPage.getEndUnitPage(); i++){%>
				<a href="/listPurchase.do?page=<%=i %>"><%=i %></a>
		<% 	}  %>
		
		<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
		<% }else{ %>
				<a href="/listPurchase.do?page=<%=resultPage.getEndUnitPage()+1%>">���� ��</a>				
		<% } %>		--%>
		
		<jsp:include page="../common/pageNavigator.jsp"/>	
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>