<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %>
<%@page import="com.model2.mvc.common.util.CommonUtil"%> --%>


<%--
<%
	User user = (User)session.getAttribute("user");
	String menu = request.getParameter("menu");
	System.out.println("listProduct.jsp - menu : "+menu);
	
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	Search search = (Search)request.getAttribute("search");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	System.out.println("listProduct.jsp - searchCondition : "+searchCondition);
	System.out.println("listProduct.jsp - searchKeyword : "+searchKeyword);
	
%> --%>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

	function fncGetUserList(currentPage){
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
	
	function fncGetProductList(currentPage, ascendingCondition){
		document.getElementById("currentPage").value = currentPage;
		document.getElementById("ascendingCondition").value = ascendingCondition;
	   	document.detailForm.submit();		
	}
	
	function fncGetProductList2(currentPage, onSale){
		document.getElementById("currentPage").value = currentPage;
		document.getElementById("onSale").value = onSale;
	   	document.detailForm.submit();		
	}
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<%--
<%if(searchKeyword.equals("")){ %>
<form name="detailForm" action="/listProduct.do?menu=<%=menu%>" method="post">
<%}else{ %>
<form name="detailForm" action="/listProduct.do?menu=<%=menu%>
&searchCondition=<%=searchCondition %>&searchKeyword=<%=searchKeyword%>" method="post">
<%} %>
 --%>
 
 <%--
<c:if test="${empty search.searchKeyword}">
	<c:choose>
		<c:when test="${empty search.ascendingCondition}">
			<form name="detailForm" action="/listProduct.do?menu=${menu}" method="post">
		</c:when>
		<c:when test="${!empty search.ascendingCondition}">
			<form name="detailForm" action="/listProduct.do?menu=${menu}&ascendingCondition=${search.ascendingCondition}" method="post">
		</c:when>
	</c:choose>	
</c:if>
<c:if test="${!empty search.searchKeyword}">
	<c:choose>
		<c:when test="${empty search.ascendingCondition}">
			<form name="detailForm" action="/listProduct.do?menu=${menu}&searchCondition=${search.searchCondition}
			&searchKeyword=${search.searchKeyword}" method="post">
		</c:when>
		<c:when test="${!empty search.ascendingCondition}">
			<form name="detailForm" action="/listProduct.do?menu=${menu}&searchCondition=${search.searchCondition}
			&searchKeyword=${search.searchKeyword}&ascendingCondition=${search.ascendingCondition}" method="post">
		</c:when>
	</c:choose>
</c:if> --%>

<form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
							��ǰ ����
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">

</table> -->


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<input type="hidden" id="onSale" name="onSale" value="${!empty search.onSale ? search.onSale : ''}"/>
	<td align="right" width="100">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">			
						<a href="javascript:fncGetProductList2('1','1');">�Ǹ��� ��ǰ</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
		<td align="right" width="100">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">		
						<a href="javascript:fncGetProductList2('1','2');">�Ǹ��� ����</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
		<td align="right">	
		���ݹ����˻�
		<input type="text" name="lowPrice"  value="${search.lowPrice}" 
			 class="ct_input_g" style="width:70px; height:19px" />
		~
		<input type="text" name="highPrice"  value="${search.highPrice}" 
			 class="ct_input_g" style="width:70px; height:19px" />
		</td>
	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript: fncGetUserList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
<input type="hidden" id="ascendingCondition" name="ascendingCondition" value="${!empty search.ascendingCondition ? search.ascendingCondition : ''}"/>
	<tr>	
		<td align="right" width="100">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
					
						<a href="javascript:fncGetProductList('1','1');">���ݳ�����</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
		
		<td align="right" width="100">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('1','2');">���ݳ�����</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
		
		<td align="right" width="100">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('1','3');">�̸���</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
		
		<td align="right" width="150">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('1','4');">��ȸ��������</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
		
		<td align="right" width="100">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="/product/listProduct?menu=${menu}">�ʱ�ȭ</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>

		<td align="right">		
		<%-- <select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
			</select>--%>	
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ !empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ !empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<%--<option value="2"  ${ !empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option> --%>
			</select>
			<input type="text" name="searchKeyword"  value="${search.searchKeyword}" 
			 class="ct_input_g" style="width:200px; height:19px" />
		</td>	
	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<%-- --%><td colspan="11" >��ü   ${resultPage.totalCount} �Ǽ�,	����  ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">��ȸ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="200">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- <%
		for(int i=0; i<list.size(); i++) {
			Product product = list.get(i);
	%>		
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
		<%if(menu.equals("manage")){ %>
			<td align="left"><a href="/updateProductView.do?prodNo=<%=product.getProdNo()%>&menu=<%=menu%>"><%= product.getProdName() %></a></td>		
	
		<%}else{%>
			<td align="left"><a href="/getProduct.do?prodNo=<%=product.getProdNo()%>&menu=<%=menu%>"><%= product.getProdName() %></a></td>
		<%}%>		
		
		<td></td>
			<td align="left"><%= product.getPrice() %></td>
			<td></td>
			<td align="left"><%= product.getManuDate() %></td>
			<td></td>
			<td align="left">
			
		
			<%if(product.getProTranCode() != null){%>
				<%if(user.getRole().equals("user")){ %>
					������
				<%}else if(user.getRole().equals("admin")){%>
					<%if(product.getProTranCode().equals("1")){%>
						���ſϷ� &nbsp;<a href="/updateTranCodeByProd.do?prodNo=<%=product.getProdNo()%>&tranCode=2
						&page=<%=resultPage.getCurrentPage()%>">����ϱ�</a>
					<%}else if(product.getProTranCode().equals("2")){%>
						�����
					<%}else if(product.getProTranCode().equals("3")){%>
						��ۿϷ�
					<%}%>
				<%}%>
			<%}else{%>
				�Ǹ���
			<%}%>
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<%}  %>	--%>
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />	
	<tr class="ct_list_pop">
		<td align="center">${ i }</td>
		<td></td>
		<td align="center">${product.view}</td>
		<td></td>
		<c:choose>
			<c:when test="${menu=='manage'}">
				<td align="left"><a href="/product/updateProduct?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a></td>		
			</c:when>
			<c:otherwise>
				<td align="left"><a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a></td>
			</c:otherwise>
		</c:choose>
		<td></td>
		<td align="center">${product.price}</td>
		<td></td>
		<td align="center">${product.manuDate}</td>
		<td></td>
		<td align="center">
			<c:if test="${!empty product.proTranCode}">
				<c:choose>	
					<c:when test="${user.role=='admin'}">
						<c:if test="${product.proTranCode=='1  '}">
							���ſϷ� &nbsp;<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2
							&page=${resultPage.currentPage}">����ϱ�</a>
						</c:if>
						<c:if test="${product.proTranCode=='2  '}">
							�����
						</c:if>
						<c:if test="${product.proTranCode=='3  '}">
							��ۿϷ�
						</c:if>
					</c:when>
					<c:when test="${user.role=='user'}">	
						������
					</c:when>
				</c:choose>
			</c:if>
			<c:if test="${empty product.proTranCode}">
				  �Ǹ���
			</c:if>
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
</table>


<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<%--/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// 		    
				<%if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
				<a href="javascript:fncGetUserList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%for(int i=resultPage.getBeginUnitPage(); i<= resultPage.getEndUnitPage(); i++){%>
				<a href="javascript:fncGetUserList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
				<a href="javascript:fncGetUserList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>				
			<% } %>--%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>

