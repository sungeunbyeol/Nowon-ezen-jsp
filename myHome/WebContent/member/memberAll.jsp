<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.member.*" %>    
<!-- memberAll.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		String mode = request.getParameter("mode");
		if (mode==null || mode.trim().equals("")){
			mode = "all";		//ȸ��ã���϶��� mode���� find�̰�, �������� ��� mode���� all�̴�.
		}
%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<div align="center">
	<hr color="green" width="300">
<%	if (mode.equals("all")){ %>	
	<h2>ȸ �� �� �� �� ��</h2>
<%	}else { %>
	<h2>ȸ �� ã ��</h2>
	<form name="f" method="post"><!-- form�±׿� action���� ���ָ� ���� page�� �̵��� �Ѵ�. -->
		<select name="search">
			<option value="id">���̵�</option>
			<option value="name">ȸ����</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="ã��">
	</form>
	<jsp:setProperty property="*" name="mbdao"/>
<%	} %>	
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
		<%	List<MemberDTO> list = null;
		if (mode.equals("all"))	list = mbdao.listMember(); 
		else 								list = mbdao.findMember();
		if (list == null || list.size()==0){%> 
		<tr>
			<td colspan="7">��ϵ� ȸ���� �����ϴ�.</td>
		</tr>
<%	} else {
			for(MemberDTO dto : list){%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAllHp()%></td>
			<td><%=dto.getJoindate()%></td>
			<td><a href="member_edit.jsp?no=<%=dto.getNo()%>">����</a> |
			<a href="member_delete.jsp?no=<%=dto.getNo()%>">����</a></td>
		</tr>	
<%		}
		}	%>		
	</table>
</div>
<%@ include file="../bottom.jsp"%>















