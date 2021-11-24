<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall.jsp -->
<%@ include file="mall_top.jsp" %>  
<div align="center">
	<h2>Welcome to My Mall</h2>
<%	String upPath = (String)request.getAttribute("upPath");	
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		List<ProductDTO> plist = (List)request.getAttribute("hit");
		if (plist==null || plist.size()==0){%>
		<b>HIT 상품이 없습니다.</b>
<%	} else {
			int count = 0;%>
		<hr color="green" width="80%">
		<font size="3" color="red">HIT</font>
		<hr color="green" width="80%">
		<table border="0" width="100%">
			<tr>
<%			for(ProductDTO pdto : plist) {%>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=hit">
						<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="60">
					</a>	<br>
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
<%
		List<ProductDTO> plist2 = (List)request.getAttribute("new");
		if (plist2==null || plist2.size()==0){%>
		<b>NEW 상품이 없습니다.</b>
		<%	} else {
			int count = 0;%>
		<hr color="green" width="80%">
		<font size="3" color="red">NEW</font>
		<hr color="green" width="80%">
		<table border="0" width="100%">
			<tr>
		<%			for(ProductDTO pdto : plist2) {%>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=new">
						<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="60">
					</a>	<br>
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
<%
		List<ProductDTO> plist3 = (List)request.getAttribute("best");
		if (plist3==null || plist3.size()==0){%>
		<b>BEST 상품이 없습니다.</b>
		<%	} else {
			int count = 0;%>
		<hr color="green" width="80%">
		<font size="3" color="red">BEST</font>
		<hr color="green" width="80%">
		<table border="0" width="100%">
			<tr>
		<%			for(ProductDTO pdto : plist3) {%>
				<td align="center">
					<a href="mall_prodView.mall?pnum=<%=pdto.getPnum()%>&select=best">
						<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="60">
					</a>	<br>
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
				









