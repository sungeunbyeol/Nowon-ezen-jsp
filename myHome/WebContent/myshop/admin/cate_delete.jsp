<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="ctdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="ctdao" value="<%=pool%>"/>
<%
		String cnum = request.getParameter("cnum");
		if (cnum==null || cnum.trim().equals("")){
			response.sendRedirect("cate_list.jsp");
			return;
		}
		
		int result = ctdao.deleteCate(Integer.parseInt(cnum)); 
		String msg = null;
		String url = "cate_list.jsp";
		if (result>0) {
			msg = "ī�װ� ���� ����!! ī�װ� ����������� �̵��մϴ�.";
		}else {
			msg = "ī�װ� ���� ����!! ī�װ� ����������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>