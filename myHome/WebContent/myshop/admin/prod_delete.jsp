<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- prod_delete.jsp -->
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=dbPool%>"/>

<%
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum==null || pnum.trim().equals("") || pimage==null || pimage.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		
		int res = pdao.deleteProduct(Integer.parseInt(pnum));
		String msg = null;
		if (res>0){
			String upPath = config.getServletContext().getRealPath("/myshop/images");
			File file = new File(upPath, pimage);
			if (file.exists()){
				file.delete();
				msg = "상품삭제 성공!!(이미지까지 삭제됨) 상품목록페이지로 이동합니다.";
			}else {
				msg = "상품삭제 성공!!(이미지삭제 실패!!) 상품목록페이지로 이동합니다.";
			}
		}else {
			msg = "상품삭제 실패!! 상품목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="prod_list.jsp"
</script>










