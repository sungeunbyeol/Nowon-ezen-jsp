<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.shop.*" %>    
<!-- prod_list.jsp -->
<%@ include file="top.jsp"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=dbPool%>"/>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = window.confirm("������ �����Ͻðڽ��ϱ�?")
		if (isDel){
			location.href="prod_delete.jsp?pnum=" + pnum + "&pimage=" + pimage
		}
	}
</script>
<div align="center">
	<table border="0" width="100%" class="outline">
		<caption>��ǰ���</caption>
		<tr class="m2">
			<th bgcolor="pink">��ȣ</th>
			<th bgcolor="pink">��ǰ�ڵ�</th>
			<th bgcolor="pink">��ǰ��</th>
			<th bgcolor="pink">�̹���</th>
			<th bgcolor="pink">����</th>
			<th bgcolor="pink">������</th>
			<th bgcolor="pink">����</th>
			<th bgcolor="pink">����|����</th>
		</tr>
<%	List<ProductDTO> list = pdao.listProduct(); 
		if (list == null || list.size() == 0){	%>
		<tr>
			<td colspan="8">��ϵ� ��ǰ�� �����ϴ�.</td>
		</tr>
<%	} else {
			for(ProductDTO dto : list){
				//String upPath = application.getRealPath("/myshop/images");
				//String upPath = request.getServletContext().getRealPath("/myshop/images");
				String upPath = config.getServletContext().getRealPath("/myshop/images");
				%>
		<tr>
			<td><%=dto.getPnum()%></td>
			<td><%=dto.getPcategory_fk()%></td>
			<td><%=dto.getPname()%></td>
			<td>
				<a href="prod_view.jsp?pnum=<%=dto.getPnum()%>">
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="40" height="40">
				</a>	
			</td>
			<td><%=dto.getPrice()%></td>
			<td><%=dto.getPcompany()%></td>
			<td><%=dto.getPqty()%></td>
			<td>
				<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">����</a> | 
				<a href="javascript:checkDel('<%=dto.getPnum()%>','<%=dto.getPimage()%>')">����</a>
			</td>	
		</tr>	
<%		}
		}%>			
	</table>
</div>

<%@ include file="bottom.jsp"%>











