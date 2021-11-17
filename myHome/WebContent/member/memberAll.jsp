<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="my.member.*" %>    
<%
		request.setCharacterEncoding("EUC-KR");
		String mode = request.getParameter("mode");
		if (mode==null){
			mode = "all";
		}
%>
<!-- memberAll.jsp -->
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>


<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
	<hr color="green" width="300">
<%	if (mode.equals("all")){ %>	
	<h2>ȸ �� �� �� �� ��</h2>
<%	}else { %>
	<h2>ȸ �� ã �� �� ��</h2>
	<form name="f" method="post">
	<!-- form�±׿��� action ���� ������ �ڽ��� �������� �״�� �̵��Ѵ�. -->
		<select name="search">
			<option value="id">���̵�</option>
			<option value="name">ȸ����</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="ã��">
	</form>
	<jsp:setProperty property="*" name="mbdao" />
<%	} %>	
	<hr color="green" width="300">
	<table width="70%" class="outline">
		<tr>
			<th class="m3">��ȣ</th>
			<th class="m3">�̸�</th>
			<th class="m3">���̵�</th>
			<th class="m3">�̸���</th>
			<th class="m3">��ȭ��ȣ</th>
			<th class="m3">������</th>
			<th class="m3">���� | ����</th>
		</tr>
<%	//���⿡ DB���� �ڷḦ ������ ��½����ش�.
		List<MemberDTO> listMember = null;
		if (mode.equals("all")) listMember = mbdao.listMember();
		else listMember = mbdao.findMember();
		  
		if (listMember==null || listMember.size()==0){%>
		<tr>
			<td colspan="7">��ϵ� ȸ���� �����ϴ�.</td>
		</tr>
<%	}else { 
			for(MemberDTO dto : listMember){%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAllHp()%></td>
			<td><%=dto.getJoindate()%></td>
			<td>
			<a href="member_update.jsp?no=<%=dto.getNo()%>">����</a> | 
			<a href="member_delete.jsp?no=<%=dto.getNo()%>">����</a></td>
		</tr>	
<%		} 			
		} %>		
	</table>
</div>













