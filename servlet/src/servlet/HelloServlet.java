package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=EUC-KR");
		PrintWriter pw = resp.getWriter();
		pw.println("<h2>Hello, Servlet!!</h2>");
	}
	
}
//1. httpServlet클래스를 상속
//2. doGet(), doPost(), service() 메소드 중에 하나를 오버라이드 해준다.
//3. web.xml에 Servlet클래스 등록