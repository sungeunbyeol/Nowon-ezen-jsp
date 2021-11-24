<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="ctdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="ctdao" value="<%=pool%>"/>
<%
		String cnum = request.getParameter("cnum");
		
		int result = ctdao.deleteCate(Integer.parseInt(cnum)); 
		String msg = null;
		String url = "cate_list.jsp";
		if (result>0) {
			msg = "카테고리 삭제 성공!! 카테고리 목록페이지로 이동합니다.";
		}else {
			msg = "카테고리 삭제 실패!! 카테고리 목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>