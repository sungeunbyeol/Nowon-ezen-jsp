<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
<jsp:useBean id="bdao" class="my.book.BookDAO"/>

<html>
<head>
<title>도서목록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2> 도 서 목 록 보 기</h2>
		<hr color="green" width="300">
		<table border="1" width="650">
			<tr bgcolor="skyblue">
				<th>도서명</th>
				<th>출판사</th>
				<th>지은이</th>
				<th>판매가</th>
				<th>입고일</th>
			</tr>
			
<% // 여기에 DB의 자료를 가져와서 출력시키기 
		ArrayList<BookDTO> list = bdao.listBook();
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###"); 
		if(list == null || list.size()==0){%>
			<tr>
			<td>등록된 도서가 없습니다.</td>
			</tr>

<%} else{
	for(BookDTO dto:list){%>	
	<tr>
	<td align="center"><%=dto.getBookname() %></td>
	<td align="center"><%=dto.getPublisher() %></td>
	<td align="center"><%=dto.getWriter() %></td>
	<td align="right"><%=df.format(dto.getPrice()) %>원</td>
	<td align="right"><%=dto.getIndate() %></td>
	
<%	}
	}%>	
		</table>
	</div>
</body>
</html>