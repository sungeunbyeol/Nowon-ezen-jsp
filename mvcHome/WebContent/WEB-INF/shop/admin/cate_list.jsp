<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>    
<!-- cate_list.jsp -->
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<c:if test="${clist==null || clist.size()==0 }">
		<tr>
			<td colspan="4">��ϵ� ī�װ��� �����ϴ�.</td>
		</tr>
		</c:if>
		<c:if test="${clist!=null || clist.size()!=0 }">
			<c:forEach var="dto" items="${cateList}">
		<tr>
			<td align="right">${cateList.Cnum}</td>
			<td align="center">${cateList.code}</td>
			<td align="center">${cateList.cname}</td>
			<td align="center"><a href="cate_delete.shop?cnum=${cateList.cnum}">����</a></td>
		</tr>
			</c:forEach>
		</c:if>		
	</table>
</div>
<%@ include file="bottom.jsp"%>
















