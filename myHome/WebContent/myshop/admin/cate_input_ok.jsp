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
			alert("카테고리 코드 또는 이름이 중복되었습니다. 다시 입력하세요!!");
			location.href="cate_input.jsp";
		</script>
<%		return;
		}
		
		int result = ctdao.insertCate(ctdto); 
		String msg = null;
		String url = null;
		if (result>0) {
			msg = "카테고리 등록 성공!! 카테고리 목록페이지로 이동합니다.";
			url = "cate_list.jsp";
		}else {
			msg = "카테고리 등록 실패!! 카테고리 등록페이지로 이동합니다.";
			url = "cate_input.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>







