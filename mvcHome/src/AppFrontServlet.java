import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.LoginOkBean;

public class AppFrontServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		//String uri = req.getRequestURI();
		//String path = req.getContextPath();
		//String cmd = uri.substring(path.length());
		String cmd = req.getServletPath();
		/*
		PrintWriter pw = resp.getWriter();
		pw.println("<h2>uri = " + uri + "<h2>");
		pw.println("<h2>path = " + path + "<h2>");
		pw.println("<h2>cmd = " + cmd + "<h2>");
		*/
		String nextPage = null;
		if (cmd.equals("/main.do")) {
			nextPage = "index.jsp";
		}else if (cmd.equals("/member.do")) {
			nextPage = "index.mem";
		}else if (cmd.equals("/login.do")) {
			nextPage = "login.log";
		}else if (cmd.equals("/shop.do")) {
			nextPage = "main.shop";
		}else if (cmd.equals("/board.do")) {
			nextPage = "list.board";
		}
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	
}
