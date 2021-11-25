<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, shop.admin.dto.*" %>    
<!-- prod_list.jsp -->
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="top.jsp"%>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="prod_delete.shop?pnum=" + pnum + "&pimage=" + pimage
		}
	}
</script>
<div align="center">
	<table border="0" width="100%" class="outline">
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
		<c:if test="${list == null || list.size() == 0}">
List)request.getAttribute("prodList");
		<tr>
			<td colspan="8">등록된 상품이 없습니다.</td>
		</tr>
		</c:if>
		<c:if test="${list != null || list.size() != 0}">
			<c:forEach var="dto" items="${prodList}">
				String upPath = config.getServletContext().getRealPath("/myshop/images");
				%>
		<tr>
			<td>${prodList.pnum}</td>
			<td>${prodList.pcategory_fk}</td>
			<td>${prodList.pname}</td>
			<td>
				<a href="prod_view.shop?pnum=${prodList.pnum}">
					<img src="${upPath}/${prodList.pimage}" width="40" height="40">
				</a>	
			</td>
			<td>${prodList.price}</td>
			<td>${prodList.pcompany}</td>
			<td>${prodList.pqty}</td>
			<td>
				<a href="prod_update.shop?pnum=${prodList.pnum}">수정</a> | 
				<a href="javascript:checkDel('${prodList.pnum}','${prodList.pimage}')">삭제</a>
			</td>	
		</tr>	
<%		}
		}%>			
	</table>
</div>

<%@ include file="bottom.jsp"%>











