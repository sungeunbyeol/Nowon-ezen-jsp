<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- cate_delete.jsp -->
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=dbPool%>"/>

<%
		String cnum = request.getParameter("cnum");
		if (cnum==null || cnum.trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}
		
		int res = cdao.deleteCate(Integer.parseInt(cnum));
		String msg = null, url = "cate_list.jsp";
		if (res>0){
			msg = "ī�װ� ���� ����!! ī�װ� ����������� �̵��մϴ�.";
		}else {
			msg = "ī�װ� ���� ����!! ī�װ� ����������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>







