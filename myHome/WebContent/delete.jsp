<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>    
<jsp:useBean id="stdao" class="my.student.StudentDAO"/>
<!-- delete.jsp -->
<%
		String id = request.getParameter("id");
		if (id == null || id.trim().equals("")){
			response.sendRedirect("student.jsp");
			return;
		}

		int res = stdao.deleteStudent(id);
		String msg = null, nextPage = null;
		if (res>0){
			msg = "학생삭제성공!! 학생목록페이지로 이동합니다.";
			nextPage = "list.jsp";
		}else {
			msg = "학생삭제실패!! 학생관리페이지로 이동합니다.";
			nextPage = "student.jsp";
		}

%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=nextPage%>"
</script>










