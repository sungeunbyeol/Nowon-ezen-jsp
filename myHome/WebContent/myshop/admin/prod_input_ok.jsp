<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>    
<!-- prod_input_ok.jsp -->
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
		
		int res = pdao.insertProduct(mr);
		String msg = null, url = null;
		if (res>0){
			msg = "��ǰ��ϼ���!! ��ǰ����������� �̵��մϴ�.";
			url = "prod_list.jsp";					
		}else {
			msg = "��ǰ��Ͻ���!! ��ǰ����������� �̵��մϴ�.";
			url = "prod_input.jsp";					
		}%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		