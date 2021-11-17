<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.shop.*" %>    
<%@ include file="top.jsp"%>
<jsp:useBean id="ctdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="ctdao" value="<%=pool%>"/>
<%
		List<CategoryDTO> cateList = ctdao.listCate();
		if (cateList == null || cateList.size()==0){%>
		<script type="text/javascript">
			alert("ī�װ��� ���� ����� �ּ���!!");
			location.href="cate_input.jsp";
		</script>
<%		return;
		}
%>
<form name="f" action="prod_input_ok.jsp" method="post" 
										enctype="multipart/form-data">
	<table border="0" class="outline" width="600">
		<caption>��ǰ���ī�װ�</caption>
		<tr>
			<th class="m2">ī�װ�</th>
			<td align="left">
				<select name="pcategory_fk">
<%		for(CategoryDTO dto : cateList){%>
				<option value="<%=dto.getCode()%>">
						<%=dto.getCname()%>[<%=dto.getCode()%>]</option>
<%		}%>
				</select>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ��</th>
			<td align="left"><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ�ڵ�</th>
			<td align="left"><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<th class="m2">����ȸ��</th>
			<td align="left"><input type="text" name="pcompany"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ�̹���</th>
			<td align="left"><input type="file" name="pimage"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td align="left"><input type="text" name="pqty"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td align="left"><input type="text" name="price"></td>
		</tr>
		<tr>
			<th class="m2">��ǰ����</th>
			<td align="left">
				<select name="pspec">
					<option value="none" selected>::NORMAL::</option>
					<option value="HIT">HIT</option>
					<option value="NEW">NEW</option>
					<option value="BEST">BEST</option>
				</select>
			</td>	
		</tr>
		<tr>
			<th class="m2">��ǰ�Ұ�</th>
			<td align="left">
				<textarea name="pcontents" rows="5" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<th class="m2">��ǰ����Ʈ</th>
			<td align="left"><input type="text" name="point"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="��ǰ���">
				<input type="reset" value="���">
			</td>
		</tr>			
	</table>
</form>
<%@ include file="bottom.jsp"%>









