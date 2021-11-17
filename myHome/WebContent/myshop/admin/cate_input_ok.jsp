<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="ctdto" class="my.shop.CategoryDTO" />
<jsp:setProperty property="*" name="ctdto" />
<jsp:useBean id="ctdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="ctdao" value="<%=pool%>"/>
 
<%
		if (ctdto.getCode()==null || ctdto.getCname()==null |
				ctdto.getCode().trim().equals("") || ctdto.getCname().trim().equals("")){
			response.sendRedirect("cate_input.jsp");
			return;
		}

		boolean isCheck = ctdao.check(ctdto);
		if (isCheck){%>  
		<script type="text/javascript">
			alert("ī�װ� �ڵ� �Ǵ� �̸��� �ߺ��Ǿ����ϴ�. �ٽ� �Է��ϼ���!!");
			location.href="cate_input.jsp";
		</script>
<%		return;
		}
		
		int result = ctdao.insertCate(ctdto); 
		String msg = null;
		String url = null;
		if (result>0) {
			msg = "ī�װ� ��� ����!! ī�װ� ����������� �̵��մϴ�.";
			url = "cate_list.jsp";
		}else {
			msg = "ī�װ� ��� ����!! ī�װ� ����������� �̵��մϴ�.";
			url = "cate_input.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>







