<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<!-- prod_input_ok.jsp -->
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
 
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/myshop/files");
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		}catch(IOException e){
			e.printStackTrace();
		}
		
		int res = pdao.insertProduct(mr);
		String msg = null, url = null;
		if (res>0){
			msg = "��ǰ��� ����!! ��ǰ����������� �̵��մϴ�.";
			url = "prod_list.jsp";
		}else {
			msg = "��ǰ��� ����!! ��ǰ����������� �̵��մϴ�.";
			url = "prod_input.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>












