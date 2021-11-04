<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*"%>
<jsp:useBean id="stdao" class="my.student.StudentDAO"/>
<%-- my.student.StudentDAO stdao = new my.student.StudentDAO(); --%>
<%-- jsp파일에서 useBean으로 객체를 만들려고 하면 해당 클래스는 반드시 default생성자가 있어야만 한다 --%>

<% 
	//1 넘어온 데이터를 받기
	request.setCharacterEncoding("EUC-KR"); //post방식에서의 한글처리, get방식의 한글처리는 제공하지 않는다.
%>
<jsp:useBean id="stdto" class="my.student.StudentDTO"/>
<jsp:setProperty property="*" name="stdto" />
<%-- stdto.setId(request.getParameter("id")); --%>

<%
	//2 데이터 유효성 검사
	if(stdto.getId()==null || stdto.getName()==null ||stdto.getCname()==null || stdto.getId().trim().equals("")
	|| stdto.getName().trim().equals("") || stdto.getCname().trim().equals("")){%>
		<script type="text/javascript"> <%-- 나 이제 자바 스크립트 쓸거야 하는 선언문 --%>
			alert("데이터를 모두 입력하셔야 합니다.")<%-- 새창 띄우기 --%>
			history.back()								  <%-- 뒤로가기 --%>
		</script>
<% return;
	}
	
	//5 전송결과 성공하면 학생목록 페이지로 이동, 실패하면 student.jsp로 이동
	int res = stdao.insertStudent(stdto);
		if (res>0){%>
			<script type="text/javascript">
				alert("학생등록성공!! 학생목록페이지로 이동합니다.")
				location.href="list.jsp"			<%-- javascript에서 페이지 이동시키는 명령(window.location) --%>
			</script>
<%	}else {%>
			<script type="text/javascript">
				alert("학생등록실패!! 학생등록페이지로 이동합니다.")
				location.href="student.jsp"			
			</script>
<%	}
%>