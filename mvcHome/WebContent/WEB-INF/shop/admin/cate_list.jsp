<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, shop.admin.dto.*" %>    
<!-- cate_list.jsp -->
<%@ include file="top.jsp"%>
<div align="center">
	<table border="1" width="700">
		<caption><h3>ī�װ� ���</h3></caption>
		<tr>
			<th>��ȣ</th>
			<th width="30%">ī�װ��ڵ�</th>
			<th width="50%">ī�װ���</th>
			<th>����</th>
		</tr>
<%
		List<CategoryDTO> clist = (List)request.getAttribute("cateList");
		if (clist==null || clist.size()==0){%>
		<tr>
			<td colspan="4">��ϵ� ī�װ��� �����ϴ�.</td>
		</tr>
<%	}else {
			for(CategoryDTO dto : clist){%>
		<tr>
			<td align="right"><%=dto.getCnum()%></td>
			<td align="center"><%=dto.getCode()%></td>
			<td align="center"><%=dto.getCname()%></td>
			<td align="center"><a href="cate_delete.shop?cnum=<%=dto.getCnum()%>">����</a></td>
		</tr>
<%		}
		}	%>		
	</table>
</div>
<%@ include file="bottom.jsp"%>
















