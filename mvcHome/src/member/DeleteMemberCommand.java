package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDAO.MemberDAO;

public class DeleteMemberCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String no = req.getParameter("no");
		MemberDAO dao = new MemberDAO();
		try {
			int res = dao.deleteMember(Integer.parseInt(no));
			if (res>0) {
				req.setAttribute("msg", "회원삭제성공!! 회원관리페이지로 이동합니다.");
				req.setAttribute("url", "index.mem");
			}else {
				req.setAttribute("msg", "회원삭제실패!! 회원관리페이지로 이동합니다.");
				req.setAttribute("url", "index.mem");
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}

}









