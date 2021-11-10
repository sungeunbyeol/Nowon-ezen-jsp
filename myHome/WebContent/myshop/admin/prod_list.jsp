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
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="prod_delete.jsp?pnum=" + pnum + "&pimage=" + pimage
		}
	}
</script>
<div align="center">
	<table border="0" width="100%" class="outline">
		<caption>상품목록</caption>
		<tr class="m2">
			<th bgcolor="pink">번호</th>
			<th bgcolor="pink">상품코드</th>
			<th bgcolor="pink">상품명</th>
			<th bgcolor="pink">이미지</th>
			<th bgcolor="pink">가격</th>
			<th bgcolor="pink">제조사</th>
			<th bgcolor="pink">수량</th>
			<th bgcolor="pink">수정|삭제</th>
		</tr>
<%	List<ProductDTO> list = pdao.listProduct(); 
		if (list == null || list.size() == 0){	%>
		<tr>
			<td colspan="8">등록된 상품이 없습니다.</td>
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
				<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">수정</a> | 
				<a href="javascript:checkDel('<%=dto.getPnum()%>','<%=dto.getPimage()%>')">삭제</a>
			</td>	
		</tr>	
<%		}
		}%>			
	</table>
</div>

<%@ include file="bottom.jsp"%>











