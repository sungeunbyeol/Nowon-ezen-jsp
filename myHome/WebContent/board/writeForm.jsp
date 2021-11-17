<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("이름을 입력해 주세요!!")
			f.wirter.focus()
			return false
		}
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("글내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<%
		if (!isLogin){%>
			<script type="text/javascript">
				alert("로그인을 하셔야 글을 작성하실 수 있습니다.")
				location.href="<%=request.getContextPath()%>/login/login.jsp"
			</script>		
<%		return;
		}

		int num = 0, re_step = 0, re_level = 0;
		String snum = request.getParameter("num");
		if (snum != null){
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
%>
<div align="center">
	<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="<%=num%>"/>
		<input type="hidden" name="re_step" value="<%=re_step%>"/>
		<input type="hidden" name="re_level" value="<%=re_level%>"/>
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td align="center" colspan="2">글 쓰 기</td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">이 름</td>
				<td><input type="text" name="writer" class="box" value="<%=mbName%>" readOnly></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">제 목</td>
				<td><input type="text" name="subject" class="box" size="50"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">Email</td>
				<td><input type="text" name="email" class="box" size="50"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">내 용</td>
				<td><textarea rows="11" cols="50" name="content" class="box"></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">비밀번호</td>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="yellow">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>












