<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cgProdList.jsp -->
<%@ include file="mall_top.jsp" %>
<div align="center">
	<h2>Welcome to My Mall</h2>
<%	String upPath = (String)request.getAttribute("upPath");
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		String code = request.getParameter("code");
		String cname = request.getParameter("cname");
		List<ProductDTO> plist = (List)request.getAttribute(code);
		if (plist==null || plist.size()==0){%>
		<b><%=cname%> ��ǰ�� �����ϴ�.</b>
<%	} else {
			int count = 0;%>
		<hr color="green" width="80%">
		<font size="3" color="red"><%=cname%></font>
		<hr color="green" width="80%">
		<table border="0" width="100%">
			<tr>
<%			for(ProductDTO pdto : plist) {%>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=<%=code%>">
						<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="60">
					</a>	<br>
					<%=pdto.getPname()%><br>
					<font color="red"><%=df.format(pdto.getPrice())%></font>��<br>
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