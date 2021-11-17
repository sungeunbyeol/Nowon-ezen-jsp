package memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.MemoDAO;
import memo.MemoDTO;

@WebServlet("/listMemo.do")
public class MemoListServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		MemoDAO dao = new MemoDAO();
		List<MemoDTO> list = dao.listMemo();
		
		PrintWriter pw = resp.getWriter();
		pw.println("<html><head><title>�޸���</title></head><body>");
		pw.println("<div align='center'>");
		pw.println("<hr color='green' width='300'>");
		pw.println("<h2>�� �� �� �� ��</h2>");
		pw.println("<hr color='green' width='300'>");
		pw.println("<table border='1' width='500'>");
		pw.println("<tr><th>���̵�</th><th>�̸���</th><th>����</th></tr>");
		if (list== null || list.size()==0) {
			pw.println("<tr><td colspan='3'>��ϵ� �޸� �����ϴ�.</td><tr>");
		}else {
			for(MemoDTO dto : list) {
				pw.println("<tr><td>" + dto.getId() + "</td><td>" 
											  + dto.getEmail() +"</td><td>" 
											  + dto.getMemo()+"</td><tr>");
			}	
		}
		pw.println("</table>");
		pw.println("</div></body></html>");
	}
	
}












