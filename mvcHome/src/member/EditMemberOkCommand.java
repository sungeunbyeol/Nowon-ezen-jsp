package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDAO.MemberDAO;
import memberDTO.MemberDTO;

public class EditMemberOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		dto.setNo(Integer.parseInt(req.getParameter("no")));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setEmail(req.getParameter("email"));
		dto.setHp1(req.getParameter("hp1"));
		dto.setHp2(req.getParameter("hp2"));
		dto.setHp3(req.getParameter("hp3"));
		MemberDAO dao = new MemberDAO();
		try {
			int res = dao.updateMember(dto);
			if (res>0) {
				req.setAttribute("msg", "회원수정성공!! 회원관리페이지로 이동합니다.");
				req.setAttribute("url", "index.mem");
			}else {
				req.setAttribute("msg", "회원수정실패!! 회원관리페이지로 이동합니다.");
				req.setAttribute("url", "index.mem");
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}

}









