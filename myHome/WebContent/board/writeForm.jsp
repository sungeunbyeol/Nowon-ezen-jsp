<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("�̸��� �Է��� �ּ���!!")
			f.wirter.focus()
			return false
		}
		if (f.subject.value==""){
			alert("������ �Է��� �ּ���!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("�۳����� �Է��� �ּ���!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<%
		if (!isLogin){%>
			<script type="text/javascript">
				alert("�α����� �ϼž� ���� �ۼ��Ͻ� �� �ֽ��ϴ�.")
				location.href="<%=request.getContextPath()%>/login/login.jsp"
			</script>		
<%		return;
		}

		int num = 0, re_step = 0, re_level = 0;
		String snum = request.getParameter("num");
		if (snum != null){
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
%>
<div align="center">
	<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="<%=num%>"/>
		<input type="hidden" name="re_step" value="<%=re_step%>"/>
		<input type="hidden" name="re_level" value="<%=re_level%>"/>
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">�� �� ��</td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">�� ��</td>
				<td><input type="text" name="writer" class="box" value="<%=mbName%>" readOnly></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">�� ��</td>
				<td><input type="text" name="subject" class="box" size="50"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">Email</td>
				<td><input type="text" name="email" class="box" size="50"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">�� ��</td>
				<td><textarea rows="11" cols="50" name="content" class="box"></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">��й�ȣ</td>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="�۾���">
					<input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="��Ϻ���" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>












