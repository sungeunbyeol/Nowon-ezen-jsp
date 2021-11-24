package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import memberDAO.MemberDAO;

public class CheckMemberCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		
		MemberDAO dao = new MemberDAO();
		boolean isMember = false;
		try {
			isMember = dao.isCheckMember(name, ssn1, ssn2);
		}catch(SQLException e) {}
		
		if (isMember) {
			req.setAttribute("msg", "저희회원이십니다.");
			req.setAttribute("url", "index.mem");
			return "message.jsp";
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("name", name);
			session.setAttribute("ssn1", ssn1);
			session.setAttribute("ssn2", ssn2);
			req.setAttribute("msg", "회원가입페이지로 이동합니다.");
			req.setAttribute("url", "insertMember.mem");
			return "message.jsp";
		}
	}

}











