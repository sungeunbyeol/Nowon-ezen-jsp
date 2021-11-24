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
				msg = "아이디를 찾을 수 없습니다. 다시 확인해 주세요!!";
				url = "search.log?mode=id";
			}else {
				msg = "해당하는 정보가 일치하지 않습니다. 다시 확인해 주세요!!";
				url = "search.log?mode=pw";
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}
}

	
	
	
	
	