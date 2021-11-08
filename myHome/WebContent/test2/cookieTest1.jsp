<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		//쿠키 만들기
		Cookie ck = new Cookie("id" , "admin");
		Cookie ck2 = new Cookie("pwd", "1234");
		
		//쿠키 생명넣기
		ck.setMaxAge(24*60*60); //초단위로 입력
		ck2.setMaxAge(7*24*60*60);
		//ck.setMaxAge(0); 해당하는 쿠키가 있으면 삭제
		
		//쿠키 전송하기
		response.addCookie(ck);
		response.addCookie(ck2);
%>
<h2>쿠키 전송 끝!</h2>