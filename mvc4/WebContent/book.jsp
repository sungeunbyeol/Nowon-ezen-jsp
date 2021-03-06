<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- book.jsp -->
<html>
<head>
	<title>도서관리프로그램</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>도 서 입 력 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="insert"/>
			<table border="1">
				<tr>
					<td>
						도서명 : <input type="text" name="bookname"><br>
						출판사 : <input type="text" name="publisher"><br>
						지은이 : <input type="text" name="writer"><br>
						판매가 : <input type="text" name="price"><br>
						<input type="submit" value="입력">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		<hr color="green" width="300">
		<h2>도 서 삭 제 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="delete"/>
			<table border="1">
				<tr>
					<td>
						도서명 : <input type="text" name="bookname">
						<input type="submit" value="삭제">
					</td>
				</tr>
			</table>
		</form>
		<hr color="green" width="300">
		<h2>도 서 찾 기 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="find"/>
			<table border="1">
				<tr>
					<td>
						<select name="search">
							<option value="bookname">도서명</option>
							<option value="publisher">출판사</option>
							<option value="writer">지은이</option>
						</select>
						<input type="text" name="searchString">
						<input type="submit" value="찾기">
					</td>
				</tr>
			</table>
		</form>
		<hr color="green" width="300">
		<h2>도 서 목 록 페 이 지</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="list"/>
			<table border="1">
				<tr>
					<td>
						<input type="submit" value="도서목록페이지로이동">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>