package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDAO.MemberDAO;
import memberDTO.MemberDTO;

public class EditMemberCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String no = req.getParameter("no");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = null;
		try {
			dto = dao.getMember(Integer.parseInt(no));
		}catch(SQLException e) {}
		req.setAttribute("getMember", dto);
		return "WEB-INF/member/member_edit.jsp";
	}

}












