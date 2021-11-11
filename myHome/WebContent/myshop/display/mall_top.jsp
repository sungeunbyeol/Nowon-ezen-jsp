<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.shop.*" %>      
<!-- mall_top.jsp -->
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=dbPool%>"/>
<%
		List<CategoryDTO> listCate = cdao.listCate();
		if (listCate == null || listCate.size() == 0) {%>
		<script type="text/javascript">
			alert("쇼핑몰 준비중입니다.!!")
			location.href="<%=request.getContextPath()%>/index.jsp"
		</script>		
<%		return;
		}
%>
<html>
<head>
	<title>쇼핑몰홈</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function cateList(cname, code){
			document.f.action = "mall_cgProdList.jsp"
			document.f.cname.value = cname
			document.f.code.value = code
			document.f.submit()
		}
	</script>
</head>
<body>
	<div align="center">
		<table border="1" width="800" height="650">
			<tr height="50">
				<td colspan="2" align="center">
					<a href="<%=request.getContextPath()%>/index.jsp">HOME</a> | 
					<a href="<%=request.getContextPath()%>/myshop/admin/main.jsp">관리자홈</a> | 
					<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">쇼핑몰홈</a> | 
					장바구니 | 
					<a href="<%=request.getContextPath()%>/company.jsp">회사소개</a>
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top" align="center">
					tree/view
					<table border="1" width="100%">
<%				for (CategoryDTO dto : listCate){ %>
						<tr>
							<td><a href="javascript:cateList('<%=dto.getCname()%>','<%=dto.getCode()%>')">
								<%=dto.getCname()%>[<%=dto.getCode()%>]
							</a></td>
						</tr>
<%				} %>						
					</table>
					<form name="f" method="post">
						<input type="hidden" name="cname">
						<input type="hidden" name="code">
					</form>
				</td>
				<td width="80%">
				
				
				
				
				
				
				
				
				
				
				
				
				
				