<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- prod_delete.jsp -->
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum == null || pimage == null){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		
		int res = pdao.deleteProd(Integer.parseInt(pnum)); 
		String msg = null;
		if (res>0){
			String delPath = application.getRealPath("/myshop/files");
			File file = new File(delPath, pimage);
			if (file.exists()){
				file.delete();  
				msg = "상품삭제 성공!! 상품목록으로 이동합니다.";
			}else {
				msg = "상품삭제 성공(이미지 삭제는 실패)!! 상품목록으로 이동합니다.";
			}
		}else {
			msg = "상품삭제 실패!! 상품목록으로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="prod_list.jsp"
</script>















