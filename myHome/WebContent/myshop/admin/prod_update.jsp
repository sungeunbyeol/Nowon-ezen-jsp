<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<!-- prod_update.jsp -->
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
<form name="f" action="prod_update_ok.jsp" method="post" enctype="multipart/form-data">
	<table border="0" width="600" class="outline">
		<caption>��ǰ����</caption>
		<tr>
			<th class="m2">ī�װ�</th>
			<td align="left">  
				<input type="text" name="pcategory_fk" value="<%=dto.getPcategory_fk()%>" disabled>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ��ȣ</th>
			<td>
				<%=dto.getPnum()%>
				<input type="hidden" name="pnum" value="<%=dto.getPnum()%>"/>	
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ��</th>
			<td><input type="text" name="pname" value="<%=dto.getPname()%>"></td>
		</tr>
		<tr>
			<th class="m2">����ȸ��</th>
			<td><input type="text" name="pcompany" value="<%=dto.getPcompany()%>"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ�̹���</th>
			<td>
				<img src="<%=upPath%>/<%=dto.getPimage()%>" width="80" height="80">
				<input type="hidden" name="pimage2" value="<%=dto.getPimage()%>"/>
				<input type="file" name="pimage">
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td><input type="text" name="pqty" value="<%=dto.getPqty()%>"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td><input type="text" name="price" value="<%=dto.getPrice()%>"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td>
<%			String[] spec = new String[]{"normal", "hit", "best", "new"};%>
				<select name="pspec">				
<%			for(int i=0; i<spec.length; ++i){ 
					if (dto.getPspec().equals(spec[i])){%>
						<option value="<%=spec[i]%>" selected><%=spec[i].toUpperCase()%></option>
<%				}else { %>
						<option value="<%=spec[i]%>"><%=spec[i].toUpperCase()%></option>
<%				}
				}	%>					
				</select>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ�Ұ�</th>
			<td><textarea name="pcontents" rows="5" cols="60"><%=dto.getPcontents()%></textarea></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����Ʈ</th>
			<td><input type="text" name="point" value="<%=dto.getPoint()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="��ǰ����">
				<input type="reset" value="�ٽ��Է�">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="bottom.jsp"%>