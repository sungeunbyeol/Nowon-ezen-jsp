<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, shop.admin.dto.*" %>      
<!-- mall_top.jsp -->
<%
		List<CategoryDTO> listCate = (List)session.getAttribute("cateList");
		if (listCate == null || listCate.size() == 0) {%>
		<script type="text/javascript">
			alert("ºÓ«Œ∏Ù ¡ÿ∫Ò¡ﬂ¿‘¥œ¥Ÿ.!!")
			location.href="main.do"
		</script>		
<%		return;
		}
%>
<html>
<head>
	<title>ºÓ«Œ∏Ù»®</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function cateList(cname, code){
			document.f.action = "mall_cgProdList.mall"
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
					<a href="main.do">HOME</a> | 
					<a href="main.shop">∞¸∏Æ¿⁄»®</a> | 
					<a href="main.mall">ºÓ«Œ∏Ù»®</a> | 
					<a href="cartList.mall">¿ÂπŸ±∏¥œ</a>
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
				
				
				
				
				
				
				
				
				
				
				
				
				
				