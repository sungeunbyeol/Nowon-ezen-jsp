<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- book.jsp -->
<html>
<head>
	<title>�����������α׷�</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="insert"/>
			<table border="1">
				<tr>
					<td>
						������ : <input type="text" name="bookname"><br>
						���ǻ� : <input type="text" name="publisher"><br>
						������ : <input type="text" name="writer"><br>
						�ǸŰ� : <input type="text" name="price"><br>
						<input type="submit" value="�Է�">
						<input type="reset" value="���">
					</td>
				</tr>
			</table>
		</form>
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="delete"/>
			<table border="1">
				<tr>
					<td>
						������ : <input type="text" name="bookname">
						<input type="submit" value="����">
					</td>
				</tr>
			</table>
		</form>
		<hr color="green" width="300">
		<h2>�� �� ã �� �� �� ��</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="find"/>
			<table border="1">
				<tr>
					<td>
						<select name="search">
							<option value="bookname">������</option>
							<option value="publisher">���ǻ�</option>
							<option value="writer">������</option>
						</select>
						<input type="text" name="searchString">
						<input type="submit" value="ã��">
					</td>
				</tr>
			</table>
		</form>
		<hr color="green" width="300">
		<h2>�� �� �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<form name="f" action="book.do" method="post">
			<input type="hidden" name="command" value="list"/>
			<table border="1">
				<tr>
					<td>
						<input type="submit" value="����������������̵�">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>