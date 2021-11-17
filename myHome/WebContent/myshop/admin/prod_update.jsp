<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<!-- prod_update.jsp -->
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
<form name="f" action="prod_update_ok.jsp" method="post" 
										enctype="multipart/form-data">
	<table border="0" class="outline" width="600">
		<caption>��ǰ����</caption>
		<tr>
			<th class="m2">ī�װ�</th>
			<td align="left">
				<input type="text" name="pcategory_fk" 
									value="<%=pdto.getPcategory_fk()%>" disabled>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ��ȣ</th>
			<td align="left"><%=pdto.getPnum()%>
			<input type="hidden" name="pnum" value="<%=pdto.getPnum()%>"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ��</th>
			<td align="left"><input type="text" name="pname" value="<%=pdto.getPname()%>"></td>
		</tr>
		<tr>
			<th class="m2">����ȸ��</th>
			<td align="left"><input type="text" name="pcompany" value="<%=pdto.getPcompany()%>"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ�̹���</th>
			<td align="left">
<%			String upPath = config.getServletContext().getRealPath("/myshop/files");%>
				<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="80" height="80">			
				<input type="file" name="pimage">
				<input type="hidden" name="pimage2" value="<%=pdto.getPimage()%>">
				</td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td align="left"><input type="text" name="pqty" value="<%=pdto.getPqty()%>"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td align="left"><input type="text" name="price" value="<%=pdto.getPrice()%>"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td align="left">
<%
				String[] spec = new String[]{"none", "HIT", "NEW", "BEST"};
%>			
				<select name="pspec">
<%				for(int i=0; i<spec.length; ++i){
						if (pdto.getPspec().equals(spec[i])){%>
							<option value="<%=spec[i]%>" selected><%=spec[i]%></option>
<%					}else {%>
							<option value="<%=spec[i]%>"><%=spec[i]%></option>
<%					}
					}%>
				</select>
			</td>	
		</tr>
		<tr>
			<th class="m2">��ǰ�Ұ�</th>
			<td align="left">
				<textarea name="pcontents" rows="5" cols="50"><%=pdto.getPcontents()%></textarea>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ����Ʈ</th>
			<td align="left"><input type="text" name="point" value="<%=pdto.getPoint()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="��ǰ����">
				<input type="reset" value="���">
			</td>
		</tr>			
	</table>
</form>
<%@ include file="bottom.jsp"%>