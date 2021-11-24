<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, board.dto.*" %>    
<!-- list.jsp -->
<html>
<head>
	<title>mvc�Խ���</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="800">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.board">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="800">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="30%">����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
		</tr>
<%
		List<BoardDBBean> listBoard = (List)request.getAttribute("listBoard");	
		int number = (Integer)request.getAttribute("number");
		if (listBoard == null || listBoard.size() == 0){%>
		<tr>
			<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>		
<%	}else {
			for(BoardDBBean dto : listBoard){%>
		<tr>
			<td><%=number--%></td>
			<td>
<%			if (dto.getRe_level()>0){ %>
					<img src="images/level.gif" width="<%=dto.getRe_level()*10%>">
					<img src="images/re.gif">
<%			} %>			
				<a href="content.board?num=<%=dto.getNum()%>">
					<%=dto.getSubject()%>
				</a>
<%			if (dto.getReadcount()>10){ %>
					<img src="images/hot.gif">
<%			} %>				
			</td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
		</tr>	
<%		}//end for....
		}//end if....%>
	</table>
<%	
		int rowCount = (Integer)request.getAttribute("rowCount");
		if (rowCount>0){
			int startPage = (Integer)request.getAttribute("startPage");
			int endPage = (Integer)request.getAttribute("endPage");
			int pageBlock = (Integer)request.getAttribute("pageBlock");
			int pageCount = (Integer)request.getAttribute("pageCount");
			if (startPage>pageBlock){%>
				<a href="list.board?pageNum=<%=startPage-pageBlock%>">[����]</a>
<%		}			
			for(int i=startPage; i<=endPage; ++i){%>
				<a href="list.board?pageNum=<%=i%>">[<%=i%>]</a>			
<%		}
			if (endPage < pageCount){%>
				<a href="list.board?pageNum=<%=startPage+pageBlock%>">[����]</a>			
<%		}
		}
%>
</div>













