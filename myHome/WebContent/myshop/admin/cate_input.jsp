<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
	<div align="center">
	<form name="f" action="cate_input_ok.jsp" method="post">
		<table border="1" width="500" height="150">
		<caption>ī�װ����</caption>
		<tr>
			<th>ī�װ��ڵ�</th>
			<td><input type="text" name="code"></td>
		</tr>
		<tr>
			<th>ī�װ��̸�</th>
			<td><input type="text" name="cname"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="���">
				<input type="reset" value="���">
			</td>
		</tr>	
	</table>
	</form>
	</div>
<%@ include file="bottom.jsp" %>