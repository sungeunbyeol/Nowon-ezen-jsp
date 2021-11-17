<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.login.*"%>
<!-- login_ok.jsp -->
<jsp:useBean id="loginCheck" class="my.login.LoginCheck" />
<jsp:setProperty property="*" name="loginCheck"/>
<jsp:useBean id="loginOk" class="my.login.LoginOkBean" scope="session" />
<%
		if (loginCheck.getId() == null || loginCheck.getId().trim().equals("")){
			response.sendRedirect("login.jsp");
			return;
		}

		String saveId = request.getParameter("saveId");

		int res = loginCheck.loginCheck();
		String msg = null, url = null;
		switch(res){
		case LoginCheck.OK :
			loginOk.setId(loginCheck.getId());
			boolean isLogin = loginOk.isSetting();
			
			Cookie ck = new Cookie("saveId", loginOk.getId());
			if (saveId == null){
				ck.setMaxAge(0);
			}else {
				ck.setMaxAge(24*60*60);
			}
			response.addCookie(ck);
			
			session.setAttribute("id", loginOk.getId());
			session.setAttribute("name", loginOk.getName());
			msg = "로그인이 되었습니다.";
			url = request.getContextPath()+"/index.jsp";
			break;
		case LoginCheck.NOT_ID :
			msg = "아이디가 없습니다. 다시 확인하시고 입력해 주세요";
			url = "login.jsp";
			break;
		case LoginCheck.NOT_PW :
			msg = "비밀번호가 틀렸습니다. 다시 확인하시고 입력해 주세요";
			url = "login.jsp";
			break;
		case LoginCheck.ERROR :
			msg = "DB 서버 오류 발생!! 관리자에게 문의해 주세요.";
			url = request.getContextPath()+"/index.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>






