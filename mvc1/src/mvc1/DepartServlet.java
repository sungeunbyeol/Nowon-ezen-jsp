package mvc1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DepartServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String depart = req.getParameter("depart");
		DepartExpert de = new DepartExpert();
		
		List<String> advice=de.getAdvice(depart);
		
		req.setAttribute("list", advice);  //���ɽ�Ʈ ������ �����ϱ�
		RequestDispatcher view = req.getRequestDispatcher("result.jsp"); //result.jsp �������� ������
		view.forward(req, resp);
	}

}
