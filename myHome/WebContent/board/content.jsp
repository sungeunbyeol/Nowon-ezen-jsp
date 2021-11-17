<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board.*"%>
<!-- content.jsp -->
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=dbPool%>"/>
<%@ include file="../top.jsp"%>
<%
		if (!isLogin){%>
			<script type="text/javascript">
				alert("�α����� �ϼž� �� �� �ִ� ������ �Դϴ�.")
				location.href="<%=request.getContextPath()%>/login/login.jsp"
			</script>		
<%		return;
		}

		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		BoardDBBean dto = bdao.getBoard(Integer.parseInt(num), "content");		
%>

<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
	<b>�۳��� ����</b><br><br>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="20%">�۹�ȣ</th>
			<td align="center" width="30%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="20%">��ȸ��</th>
			<td align="center" width="30%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td align="center" width="30%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">������</th>
			<td width="80%" colspan="3"><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�۳���</th>
			<td width="80%" colspan="3"><%=dto.getContent()%></td>
		</tr>
		<tr>
			<td colspan="4" bgcolor="yellow" align="right">
				<input type="button" value="��۾���" 
				onclick="window.location='writeForm.jsp?num=<%=dto.getNum()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۼ���" onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�ۻ���" onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="�۸��" onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>
















