package login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDAO.MemberDAO;

public class SearchCheckLoginCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		String id = req.getParameter("id");
		MemberDAO dao = new MemberDAO();
		try {
			String msg = dao.searchMember(name, ssn1, ssn2, id);
			String url = null;
			req.setAttribute("msg", msg);
			if (msg != null) {
				return "closeWindow.jsp";
			}
			if (id==null){
				msg = "���̵� ã�� �� �����ϴ�. �ٽ� Ȯ���� �ּ���!!";
				url = "search.log?mode=id";
			}else {
				msg = "�ش��ϴ� ������ ��ġ���� �ʽ��ϴ�. �ٽ� Ȯ���� �ּ���!!";
				url = "search.log?mode=pw";
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}
}

	
	
	
	
	