<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<!-- prod_view.jsp -->
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		
		ProductDTO pdto = pdao.getProduct(Integer.parseInt(pnum));		
%>
<%@ include file="top.jsp"%>
<form name="f" action="prod_list.jsp" method="post">
	<table class="outline" width="75%">
	<caption>��ǰ�󼼺���</caption>
		<tr>
			<th width="15%" class="m2">ī�װ�</th>
			<td width="35%" align="center"><%=pdto.getPcategory_fk()%></td>
			<th width="15%" class="m2">��ǰ��ȣ</th>
			<td width="35%" align="center"><%=pdto.getPnum()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">��ǰ��</th>
			<td width="35%" align="center"><%=pdto.getPname()%></td>
			<th width="15%" class="m2">����ȸ��</th>
			<td width="35%" align="center"><%=pdto.getPcompany()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">��ǰ�̹���</th>
<%	String upPath = config.getServletContext().getRealPath("/myshop/images");
		String filename = upPath + "\\" + pdto.getPimage();%>			
			<td width="35%" align="center" colspan="3">
				<img src="<%=filename%>" border="0" width="40" height="40">
			</td>
		</tr>
		<tr>
			<th width="15%" class="m2">��ǰ����</th>
			<td width="35%" align="center"><%=pdto.getPqty()%></td>
			<th width="15%" class="m2">��ǰ����</th>
			<td width="35%" align="center"><%=pdto.getPrice()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">��ǰ����</th>
			<td width="35%" align="center"><%=pdto.getPspec()%></td>
			<th width="15%" class="m2">��ǰ����Ʈ</th>
			<td width="35%" align="center"><%=pdto.getPoint()%></td>
		</tr>
		<tr>
			<th width="15%" class="m2">��ǰ�Ұ�</th>
			<td width="35%" align="center" colspan="3">
				<textarea name="pcontents" rows="5" cols="50" readOnly><%=pdto.getPcontents()%></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="m1" align="center">
				<input type="submit" value="���ư���">
			</td>
		</tr>
	</table>
</form>	
<%@ include file="bottom.jsp"%>