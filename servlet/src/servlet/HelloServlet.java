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
//1. httpServletŬ������ ���
//2. doGet(), doPost(), service() �޼ҵ� �߿� �ϳ��� �������̵� ���ش�.
//3. web.xml�� ServletŬ���� ���