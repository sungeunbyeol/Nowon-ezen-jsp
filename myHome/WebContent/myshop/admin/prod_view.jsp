<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<!-- prod_view.jsp -->
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=dbPool%>"/>

<%
		String pnum = request.getParameter("pnum");
		if (pnum == null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		ProductDTO dto = pdao.getProduct(Integer.parseInt(pnum));
		String upPath = application.getRealPath("myshop/images");
%>
<%@ include file="top.jsp"%>
<div align="center">
	<form name="f" action="prod_list.jsp" method="post">
		<table border="0" width="75%" class="outline">
			<caption>��ǰ�󼼺���</caption>
			<tr>
				<th width="15%" class="m2">ī�װ�</th>
				<td width="35%" align="center"><%=dto.getPcategory_fk()%></td>
				<th width="15%" class="m2">��ǰ��ȣ</th>
				<td width="35%" align="center"><%=dto.getPnum()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">��ǰ��</th>
				<td width="35%" align="center"><%=dto.getPname()%></td>
				<th width="15%" class="m2">����ȸ��</th>
				<td width="35%" align="center"><%=dto.getPcompany()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">��ǰ�̹���</th>
				<td colspan="3" align="center">
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="60" height="60">
				</td>
			</tr>
			<tr>
				<th width="15%" class="m2">��ǰ����</th>
				<td width="35%" align="center"><%=dto.getPqty()%></td>
				<th width="15%" class="m2">��ǰ����</th>
				<td width="35%" align="center"><%=dto.getPrice()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">��ǰ����</th>
				<td width="35%" align="center"><%=dto.getPspec()%></td>
				<th width="15%" class="m2">��ǰ����Ʈ</th>
				<td width="35%" align="center"><%=dto.getPoint()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">��ǰ�Ұ�</th>
				<td colspan="3">
					<textarea name="pcontents" rows="5" cols="50" readOnly><%=dto.getPcontents()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="m1" align="center">
					<input type="submit" value="���ư���">
				</td>	
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp"%>












