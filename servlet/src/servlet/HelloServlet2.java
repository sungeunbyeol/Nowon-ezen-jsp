package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//어노테이션을 이용해서 사용하는 방법
@WebServlet("/hello2")
public class HelloServlet2 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=EUC-KR");
		PrintWriter pw = resp.getWriter();
		pw.println("<h2>Hello, Servlet!!</h2>");
	}
	
}
