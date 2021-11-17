package memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.MemoDAO;

public class MemoInsertServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String memo = req.getParameter("memo");
		
		MemoDAO dao = new MemoDAO();
		int res = dao.insertMemo(id, email, memo);
		String msg = null, url = null;
		
		if (res>0) {
			msg = "�޸��ϼ���!! �޸����������� �̵��մϴ�.";
			url = "listMemo.do";
		}else {
			msg = "�޸��Ͻ��м���!! �޸����������� �̵��մϴ�.";
			url = "memo.html";
		}
		
		PrintWriter pw = resp.getWriter();
		pw.println("<html><head><title>�޸���</title></head><body>");
		pw.println("<script type='text/javascript'>");
		pw.println("alert('" + msg +"')");
		pw.println("location.href='" + url +"'");
		pw.println("</script>");
		pw.println("</body></html>");
		
	}
	
}
















