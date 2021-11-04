<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- test02.jsp -->
<div align="center">
	<table border="1" width="800">
		<tr>
<%	for (int dan=2; dan<=9; ++dan){ %>
			<th><%=dan%></th>
<%	} %>
		</tr>	
<%	for (int i=1; i<=9; ++i){ %>
		<tr>
<%		for(int dan=2; dan<=9; ++dan){ %>
			<td align="center"><%=dan%>X<%=i%>=<%=dan*i%></td>
<%		} %>
		</tr>
<%	} %>			
	</table>	
</div>