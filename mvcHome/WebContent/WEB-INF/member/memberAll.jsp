<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, memberDTO.*"%>
<!-- memberAll.jsp -->
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="top.jsp"%>
<div align="center">

	<hr color="green" width="300">
	<c:if test="${mode.equals(all)}">
	<h2>회 원 목 록 보 기</h2>
	</c:if>
	<c:if test="${!mode.equals(all)}">
	<h2>회 원 찾 기</h2>
	<form name="f" method="post" action="memberAll.mem">
		<input type="hidden" name="mode" value="find"/>
		<select name="search">
			<option value="id">아이디</option>
			<option value="name">회원명</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="찾기">
	</form>
	</c:if>
	<hr color="green" width="300">
	<table width="100%" class="outline">
		<tr bgcolor="yellow">
			<th class="m3">번호</th>
			<th class="m3">회원명</th>
			<th class="m3">아이디</th>
			<th class="m3">이메일</th>
			<th class="m3">전화번호</th>
			<th class="m3">가입일</th>
			<th class="m3">수정|삭제</th>
		</tr>
		<c:if test="${empty list}">
		<tr>
			<td colspan="7">등록된 회원이 없습니다.</td>
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
			<td><a href="editMember.mem?no=${listMember.no}">수정</a> |
			<a href="deleteMember.mem?no=${listMember.no}">삭제</a></td>
		</tr>	
			</c:forEach>
		</c:if>	
	</table>
</div>
<%@ include file="bottom.jsp"%>








