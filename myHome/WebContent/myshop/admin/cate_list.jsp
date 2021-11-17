<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*, java.util.*" %>
<%@ include file = "top.jsp" %>
<div align="center">
<jsp:useBean id="ctdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="ctdao" value="<%=pool%>"/>
	<table border="1" width="600">
		<caption>ī �� �� �� �� ��</caption>
		<tr> 
			<th>��ȣ</th>
			<th>ī�װ��ڵ�</th>
			<th>ī�װ��̸�</th>
			<th>����</th>
		</tr>
<% 
		List<CategoryDTO> list = ctdao.listCate(); 
		if (list == null || list.size()==0){%>
		<tr>
			<td colspan="4">
				��ϵ� ī�װ��� �����ϴ�.
			</td>
		</tr>
<%	}else {
			for(CategoryDTO dto : list){%>
		<tr>
			<td><%=dto.getCnum()%></td>	
			<td><%=dto.getCode()%></td>
			<td><%=dto.getCname()%></td>
			<td><a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">����</a>
<%		}
		}%>					
	</table>
</div>	
<%@ include file = "bottom.jsp" %>









