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
				msg = "��ǰ���� ����!! ��ǰ������� �̵��մϴ�.";
			}else {
				msg = "��ǰ���� ����(�̹��� ������ ����)!! ��ǰ������� �̵��մϴ�.";
			}
		}else {
			msg = "��ǰ���� ����!! ��ǰ������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="prod_list.jsp"
</script>















