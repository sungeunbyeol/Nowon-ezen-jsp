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
			<caption>상품상세보기</caption>
			<tr>
				<th width="15%" class="m2">카테고리</th>
				<td width="35%" align="center"><%=dto.getPcategory_fk()%></td>
				<th width="15%" class="m2">상품번호</th>
				<td width="35%" align="center"><%=dto.getPnum()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">상품명</th>
				<td width="35%" align="center"><%=dto.getPname()%></td>
				<th width="15%" class="m2">제조회사</th>
				<td width="35%" align="center"><%=dto.getPcompany()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">상품이미지</th>
				<td colspan="3" align="center">
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="60" height="60">
				</td>
			</tr>
			<tr>
				<th width="15%" class="m2">상품수량</th>
				<td width="35%" align="center"><%=dto.getPqty()%></td>
				<th width="15%" class="m2">상품가격</th>
				<td width="35%" align="center"><%=dto.getPrice()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">상품스팩</th>
				<td width="35%" align="center"><%=dto.getPspec()%></td>
				<th width="15%" class="m2">상품포인트</th>
				<td width="35%" align="center"><%=dto.getPoint()%></td>
			</tr>
			<tr>
				<th width="15%" class="m2">상품소개</th>
				<td colspan="3">
					<textarea name="pcontents" rows="5" cols="50" readOnly><%=dto.getPcontents()%></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="m1" align="center">
					<input type="submit" value="돌아가기">
				</td>	
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp"%>












