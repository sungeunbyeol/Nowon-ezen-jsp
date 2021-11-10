<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>

<%@ include file="top.jsp"%>

<div align="center">

<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=dbPool%>"/>
<%
		List<CategoryDTO> listCate=cdao.listCate();
		if(listCate==null || listCate.size()==0){%>
		<script type="text/javascript">
			alert("ī�װ��� ���� ������ּ���!!")
			location.href="cate_input.jsp"
		</script>
<% return;
	}
%>
<form name="f" action="prod_input_ok.jsp" method="post" enctype="multipart/form-data">
	<table border="0" width="600" class="outline">
		<caption>��ǰ���ī�װ�</caption>
		<tr>
			<th  bgcolor="pink">ī�װ�</th>
			<td align="left">
			<select name="pcategory_fk">
			<%
				for(CategoryDTO dto : listCate){
			%>
			<option vlaue="<%=dto.getCode() %>">
				<%=dto.getCname() %>[<%=dto.getCode() %>]
			<%
				}
			%>
			</select>
			</td>
		</tr>
		<tr>
			<th bgcolor="pink">��ǰ��</th>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th bgcolor="pink">��ǰ�ڵ�</th>
			<td><input type="text" name="pcategory_fk"></td>
		</tr>
		<tr>
			<th bgcolor="pink">����ȸ��</th>
			<td><input type="text" name="pcompany"></td>
		</tr>
		<tr>
			<th bgcolor="pink">��ǰ�̹���</th>
			<td><input type="file" name="pimage"></td>
		</tr>
		<tr>
			<th bgcolor="pink">��ǰ ����</th>
			<td><input type="text" name="pqty"></td>
		</tr>
		<tr>
			<th bgcolor="pink">��ǰ ����</th>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<th bgcolor="pink">��ǰ ����</th>
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
			<th bgcolor="pink">��ǰ �Ұ�</th>
			<td><textarea rows="5" cols="60"  name="pcontents"></textarea></td>
		</tr>
		<tr>
			<th bgcolor="pink">��ǰ ����Ʈ</th>
			<td><input type="text" name="point"></td>
		</tr>
		<tr bgcolor=#E2E2E2>
			<td colspan="2">
			<input type="submit" value="��ǰ ���">
			<input type="reset" value="�ٽ� �Է�">
			</td>
		</tr>
	</table>
</form>

</div>

<%@ include file="bottom.jsp"%>
