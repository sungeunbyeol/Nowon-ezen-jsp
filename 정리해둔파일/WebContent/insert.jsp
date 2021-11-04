<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*"%>
<% 
	//1 넘어온 데이터를 받기
	request.setCharacterEncoding("EUC-KR"); //post방식에서의 한글처리, get방식의 한글처리는 제공하지 않는다.
	String id = request.getParameter("id"); //이름이 "id"인 파라미터의 값을 구한다. 존재하지 않을 경우 null을 리턴한다.
	String name = request.getParameter("name"); //이름이 "name"인 파라미터의 값을 구한다. 존재하지 않을 경우 null을 리턴한다.
	String cname = request.getParameter("cname"); //이름이 "cname"인 파라미터의 값을 구한다. 존재하지 않을 경우 null을 리턴한다.
	
	//2 데이터 유효성 검사
	//request.getParameter("값"); 을 통해 데이터를 받았는데 입력이 안됐거나, 문자앞뒤에 쓸데없는 공백이 있을 경우
	if(id==null || name==null ||cname==null || id.trim().equals("")
	|| name.trim().equals("") || cname.trim().equals("")){%>
		<script type="text/javascript"> <%-- 나 이제 자바 스크립트 쓸거야 하는 선언문 --%>
			alert("데이터를 모두 입력하셔야 합니다.")<%-- 새창 띄우기 --%>
			history.back()								  <%-- 뒤로가기 --%>
		</script>
<% return; // 다시 입력받아야 되니까 return; 을 꼭! 적어준다.
	}

	//3 DB와 연결
	Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 실행
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "javaapi";
	String pass = "javaapi";
	Connection con = DriverManager.getConnection(url, user, pass);
	
	//4 쿼리 전송
	 //?,?,? 넣는거는 동적쿼리문이기 때문이고 id, name, cname 이렇게 3개를 받아서 전송해야 되기 때문에 ?를 3개 적음
	String sql = "insert into student values(?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, cname);
	
	//5 전송결과 성공하면 학생목록 페이지로 이동, 실패하면 student.jsp로 이동
	int res = ps.executeUpdate();
	if(res>0){%>
		<script type="text/javascript">
			alert("학생등록성공!! 학생목록페이지로 이동합니다.")
			location.href="list.jsp"		<%-- javascript에서 페이지 이동시키는 명령(window.location) --%>
		</script>
<% }else {%>
		<script type="text/javascript">
			alert("학생등록 실패! 학생등록페이지로 이동합니다.")
			location.href="student.jsp"
		</script>	
<% }
	//6 DB닫기
	ps.close();
	con.close();
%>