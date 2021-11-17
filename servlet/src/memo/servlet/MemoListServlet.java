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
		pw.println("<html><head><title>메모장</title></head><body>");
		pw.println("<div align='center'>");
		pw.println("<hr color='green' width='300'>");
		pw.println("<h2>메 모 장 보 기</h2>");
		pw.println("<hr color='green' width='300'>");
		pw.println("<table border='1' width='500'>");
		pw.println("<tr><th>아이디</th><th>이메일</th><th>내용</th></tr>");
		if (list== null || list.size()==0) {
			pw.println("<tr><td colspan='3'>등록된 메모가 없습니다.</td><tr>");
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












