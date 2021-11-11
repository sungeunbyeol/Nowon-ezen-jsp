<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cgProdList.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		String code = request.getParameter("code");
		String cname = request.getParameter("cname");
		if (code == null || cname==null || code.trim().equals("") || cname.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		
%>
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="proList" class="my.shop.mall.ProductList" scope="session" />
<jsp:setProperty property="pool" name="proList" value="<%=dbPool%>"/>

<div align="center">
	<h2>Welcome to My Mall</h2>
<%	String upPath = request.getServletContext().getRealPath("/myshop/images");	
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		List<ProductDTO> plist = proList.selectByCode(code);
		if (plist==null || plist.size()==0){%>
		<b><%=cname%> 상품이 없습니다.</b>
<%	} else {
			int count = 0;%>
		<hr color="green" width="80%">
		<font size="3" color="red"><%=cname%></font>
		<hr color="green" width="80%">
		<table border="0" width="100%">
			<tr>
<%			for(ProductDTO pdto : plist) {%>
				<td align="center">
					<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="60"><br>
					<%=pdto.getPname()%><br>
					<font color="red"><%=df.format(pdto.getPrice())%></font>원<br>
					<font color="blue"><%=pdto.getPoint()%></font>point
				</td>	
<%			count++;
				if (count == 3){
					count = 0;%>
				</tr><tr>	
<%			}
			} %>			
			</tr>
		</table>
<%	}%>	
</div>	
<%@ include file="mall_bottom.jsp"%>	