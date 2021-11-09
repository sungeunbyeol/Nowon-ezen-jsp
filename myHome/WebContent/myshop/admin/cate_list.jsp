<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.shop.*" %>    
<!-- cate_list.jsp -->
<%@ include file="top.jsp"%>
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=dbPool%>"/>

<div align="center">
	<table border="1" width="700">
		<caption><h3>카테고리 목록</h3></caption>
		<tr>
			<th>번호</th>
			<th width="30%">카테고리코드</th>
			<th width="50%">카테고리명</th>
			<th>삭제</th>
		</tr>
<%
		List<CategoryDTO> clist = cdao.listCate();
		if (clist==null || clist.size()==0){%>
		<tr>
			<td colspan="4">등록된 카테고리가 없습니다.</td>
		</tr>
<%	}else {
			for(CategoryDTO dto : clist){%>
		<tr>
			<td align="right"><%=dto.getCnum()%></td>
			<td align="center"><%=dto.getCode()%></td>
			<td align="center"><%=dto.getCname()%></td>
			<td align="center"><a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">삭제</a></td>
		</tr>
<%		}
		}	%>		
	</table>
</div>
<%@ include file="bottom.jsp"%>
















