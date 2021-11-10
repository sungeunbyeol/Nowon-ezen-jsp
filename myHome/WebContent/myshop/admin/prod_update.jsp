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
		<caption>상품수정</caption>
		<tr>
			<th class="m2">카테고리</th>
			<td align="left">  
				<input type="text" name="pcategory_fk" value="<%=dto.getPcategory_fk()%>" disabled>
			</td>
		</tr>
		<tr>
			<th class="m2">상품번호</th>
			<td>
				<%=dto.getPnum()%>
				<input type="hidden" name="pnum" value="<%=dto.getPnum()%>"/>	
			</td>
		</tr>
		<tr>
			<th class="m2">상품명</th>
			<td><input type="text" name="pname" value="<%=dto.getPname()%>"></td>
		</tr>
		<tr>
			<th class="m2">제조회사</th>
			<td><input type="text" name="pcompany" value="<%=dto.getPcompany()%>"></td>
		</tr>
		<tr>
			<th class="m2">상품이미지</th>
			<td>
				<img src="<%=upPath%>/<%=dto.getPimage()%>" width="80" height="80">
				<input type="hidden" name="pimage2" value="<%=dto.getPimage()%>"/>
				<input type="file" name="pimage">
			</td>
		</tr>
		<tr>
			<th class="m2">상품수량</th>
			<td><input type="text" name="pqty" value="<%=dto.getPqty()%>"></td>
		</tr>
		<tr>
			<th class="m2">상품가격</th>
			<td><input type="text" name="price" value="<%=dto.getPrice()%>"></td>
		</tr>
		<tr>
			<th class="m2">상품스팩</th>
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
			<th class="m2">상품소개</th>
			<td><textarea name="pcontents" rows="5" cols="60"><%=dto.getPcontents()%></textarea></td>
		</tr>
		<tr>
			<th class="m2">상품포인트</th>
			<td><input type="text" name="point" value="<%=dto.getPoint()%>"></td>
		</tr>
		<tr>
			<td colspan="2" class="m1">
				<input type="submit" value="상품수정">
				<input type="reset" value="다시입력">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="bottom.jsp"%>