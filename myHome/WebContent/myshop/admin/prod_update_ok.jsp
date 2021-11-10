<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- prod_update_ok.jsp -->
<%@ page import="com.oreilly.servlet.*, java.io.*" %>    
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="dbPool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=dbPool%>"/>
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("myshop/images");
		int len = 20*1024*1024;
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		}catch(IOException e){%>
		<script type="text/javascript">
			alert("���� ���� �� ���� �߻�!!")
			history.back()
		</script>	
<%		return;
		}  
		
		int res = pdao.updateProduct(mr);
		String msg = null, url = null;
		if (res>0){
			msg = "��ǰ��������!! ��ǰ����������� �̵��մϴ�.";
			url = "prod_list.jsp";					
		}else {
			msg = "��ǰ��������!! ��ǰ������������ �̵��մϴ�.";
			url = "prod_update.jsp?pnum=" + mr.getParameter("pnum");					
		}%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>