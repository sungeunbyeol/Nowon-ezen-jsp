<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, memberDTO.*"%>
<!-- memberAll.jsp -->
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="top.jsp"%>
<div align="center">

	<hr color="green" width="300">
	<c:if test="${mode.equals(all)}">
	<h2>ȸ �� �� �� �� ��</h2>
	</c:if>
	<c:if test="${!mode.equals(all)}">
	<h2>ȸ �� ã ��</h2>
	<form name="f" method="post" action="memberAll.mem">
		<input type="hidden" name="mode" value="find"/>
		<select name="search">
			<option value="id">���̵�</option>
			<option value="name">ȸ����</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="ã��">
	</form>
	</c:if>
	<hr color="green" width="300">
	<table width="100%" class="outline">
		<tr bgcolor="yellow">
			<th class="m3">��ȣ</th>
			<th class="m3">ȸ����</th>
			<th class="m3">���̵�</th>
			<th class="m3">�̸���</th>
			<th class="m3">��ȭ��ȣ</th>
			<th class="m3">������</th>
			<th class="m3">����|����</th>
		</tr>
		<c:if test="${empty list}">
		<tr>
			<td colspan="7">��ϵ� ȸ���� �����ϴ�.</td>
		</tr>
		</c:if>
		<c:if test="${list != null}">
			<c:forEach var="dto" items="${listMember}">
		<tr>
			<td>${listMember.no}</td>
			<td>${listMember.name}</td>
			<td>${listMember.id}</td>
			<td>${listMember.email}</td>
			<td>${listMember.allhp}</td>
			<td>${listMember.joindate}</td>
			<td><a href="editMember.mem?no=${listMember.no}">����</a> |
			<a href="deleteMember.mem?no=${listMember.no}">����</a></td>
		</tr>	
			</c:forEach>
		</c:if>	
	</table>
</div>
<%@ include file="bottom.jsp"%>








