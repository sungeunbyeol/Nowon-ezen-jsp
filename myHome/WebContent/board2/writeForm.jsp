<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<%@ include file="../loginCheck.jsp"%> 
<script type="text/javascript">
	function check(){
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		if (f.filename.value==""){
			alert("파일을 선택해 주세요!!")
			f.filename.focus()
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<div align="center">
	<form name="f" action="writePro.jsp" method="post" onsubmit="return check()"
					enctype="multipart/form-data">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td colspan="2" align="center">글 쓰 기</td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">이 름</td>
				<td><input type="text" name="writer" class="box" value="<%=mbName%>" readOnly></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">제 목</td>
				<td><input type="text" name="subject" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">Email</td>
				<td><input type="text" name="subject" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">내 용</td>
				<td><textarea rows="11" cols="40" name="content" class="box"></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">파일명</td>
				<td><input type="file" name="filename" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">비밀번호</td>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="yellow" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>








