<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, shop.admin.dto.*" %>    
<!-- prod_input.jsp -->

<%@ include file="top.jsp"%>
<div align = "center">
<%	List<CategoryDTO> listCate = (List)request.getAttribute("cateList"); %>
<form name="f" action="prod_input_ok.shop" method="post" enctype="multipart/form-data">
	<table border="0" width="600" class="outline">
		<caption>��ǰ���ī�װ�</caption>
		<tr>
			<th class="m2">ī�װ�</th>
			<td align="left">
				<select name="pcategory_fk">
<%				for(CategoryDTO dto : listCate){ %>
					<option value="<%=dto.getCode()%>">
						<%=dto.getCname()%>[<%=dto.getCode()%>]
					</option>
<%				} %>					
				</select>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ��</th>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ�ڵ�</th>
			<td><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<th class="m2">����ȸ��</th>
			<td><input type="text" name="pcompany"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ�̹���</th>
			<td><input type="file" name="pimage"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td><input type="text" name="pqty"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td>
				<select name="pspec">
					<option value="normal" selected>::NORMAL::</option>
					<option value="hit">HIT</option>
					<option value="best">BEST</option>
					<option value="new">NEW</option>
				</select>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ�Ұ�</th>
			<td><textarea name="pcontents" rows="5" cols="60"></textarea></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����Ʈ</th>
			<td><input type="text" name="point"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="��ǰ���">
				<input type="reset" value="�ٽ��Է�">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="bottom.jsp"%>
















