<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="shop.dto.*, shop.dao.*, java.util.*" %>
<%@ include file = "top.jsp" %>
<div align="center">
	<table border="1" width="600">
		<caption>카 테 고 리 목 록</caption>
		<tr> 
			<th>번호</th>
			<th>카테고리코드</th>
			<th>카테고리이름</th>
			<th>삭제</th>
		</tr>
<% 
		List<CategoryDTO> list = new CategoryBean.listCate(); 
		if (list == null || list.size()==0){%>
		<tr>
			<td colspan="4">
				등록된 카테고리가 없습니다.
			</td>
		</tr>
<%	}else {
			for(CategoryDTO dto : list){%>
		<tr>
			<td><%=dto.getCnum()%></td>	
			<td><%=dto.getCode()%></td>
			<td><%=dto.getCname()%></td>
			<td><a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">삭제</a>
<%		}
		}%>					
	</table>
</div>	
<%@ include file = "bottom.jsp" %>









