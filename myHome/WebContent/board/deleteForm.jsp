<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deleteForm.jsp -->
<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css"> 
<div align="center">
<b>�ۻ���</b>
<br><br>
<form name="f" action="deletePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num%>"/>
	<table border="1" width="300">
		<tr bgcolor="yellow">
			<th>��й�ȣ�� �Է��� �ּ���</th>
		</tr>
		<tr>
			<td align="center">��й�ȣ : <input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="�ۻ���">
				<input type="button" value="�۸��" onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>