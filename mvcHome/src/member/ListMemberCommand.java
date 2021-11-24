package member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDAO.MemberDAO;
import memberDTO.MemberDTO;

public class ListMemberCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String mode = req.getParameter("mode");
		if (mode == null) {
			mode = "all";
		}
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = null;
		if (mode.equals("all")) {
			try {
				list = dao.listMember();
			}catch(SQLException e) {}
		}else {
			try {
				String search = req.getParameter("search");
				String searchString = req.getParameter("searchString");
				list = dao.findMember(search, searchString);
			}catch(SQLException e) {}
		}
		req.setAttribute("listMember", list);
		req.setAttribute("mode", mode);
		return "WEB-INF/member/memberAll.jsp";
	}

}














