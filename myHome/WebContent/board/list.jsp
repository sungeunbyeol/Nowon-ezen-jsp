<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*" %>    
<!-- list.jsp -->
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=dbPool%>"/>

<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="30%">����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
		</tr>
<%
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.trim().equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;//1:1, 2:6, 3:11, 4:16
		int endRow = startRow + pageSize - 1;
		int rowCount = bdao.getCount();
		if (endRow>rowCount) endRow = rowCount;
		int number = rowCount - startRow + 1;
		List<BoardDBBean> listBoard = bdao.listBoard(startRow, endRow);	
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
					<img src="../img/level.gif" width="<%=dto.getRe_level()*10%>">
					<img src="../img/re.gif">
<%			} %>			
				<a href="content.jsp?num=<%=dto.getNum()%>">
					<%=dto.getSubject()%>
				</a>
<%			if (dto.getReadcount()>10){ %>
					<img src="../img/hot.gif">
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
		if (rowCount>0){
			int pageBlock = 3;
			int pageCount = rowCount / pageSize;// + (rowCount%pageSize == 0 ? 0 : 1);
			if (rowCount%pageSize != 0){
				pageCount++;
			}
			int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			if (startPage>pageBlock){%>
				<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[����]</a>
<%		}			
			for(int i=startPage; i<=endPage; ++i){%>
				<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>			
<%		}
			if (endPage < pageCount){%>
				<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[����]</a>			
<%		}
		} //end if(rowCount>0)%>
</div>
<%@ include file="../bottom.jsp"%>












