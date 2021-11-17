<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- sessionTest3.jsp -->
<%
		//session.removeAttribute("id");	개별삭제
		session.invalidate();						//session값 전체 삭제
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다. 로그인 페이지로 이동합니다.")
	location.href="sessionTest1.jsp"
</script>