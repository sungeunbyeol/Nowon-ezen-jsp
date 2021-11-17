<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<!-- prod_list.jsp -->
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%@ include file="top.jsp"%>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage
		}
	}
</script>
	<table class="outline" width="100%">
		<caption>상품목록</caption>
		<tr class="m2">
			<th>번호</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>가격</th>
			<th>제조사</th>
			<th>수량</th>
			<th>수정|삭제</th>
		</tr>
<%
		List<ProductDTO> listProd = pdao.listProd();
		if (listProd == null || listProd.size()==0){%>
		<tr>
			<td colspan="8">등록된 상품이 없습니다.</td>
		</tr>		
<%	}else {
			for(ProductDTO dto : listProd){%>
		<tr>
			<td><%=dto.getPnum()%></td>
			<td><%=dto.getPcategory_fk()%></td>
			<td><%=dto.getPname()%></td>
			<td>
<%			//String upPath = config.getServletContext().getRealPath("/myshop/files"); 
				//String upPath = request.getServletContext().getRealPath("/myshop/files");
				String upPath = application.getRealPath("/myshop/files");%>
				<a href="prod_view.jsp?pnum=<%=dto.getPnum()%>">
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="40" height="40">
				</a>			
			</td>
			<td align="right"><%=dto.getPrice()%></td>
			<td><%=dto.getPcompany()%></td>
			<td align="right"><%=dto.getPqty()%></td>
			<td>
				<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">수정</a> | 
				<a href="javascript:checkDel('<%=dto.getPnum()%>','<%=dto.getPimage()%>')">삭제</a>
			</td>
		</tr>	
<%		}
		}
%>		
	</table>
<%@ include file="bottom.jsp"%>












