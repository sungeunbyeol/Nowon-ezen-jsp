package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberDAO.MemberDAO;
import memberDTO.MemberDTO;

public class InsertMemberOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		dto.setName(req.getParameter("name"));
		dto.setId(req.getParameter("id"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setSsn1(req.getParameter("ssn1"));
		dto.setSsn2(req.getParameter("ssn2"));
		dto.setEmail(req.getParameter("email"));
		dto.setHp1(req.getParameter("hp1"));
		dto.setHp2(req.getParameter("hp2"));
		dto.setHp3(req.getParameter("hp3"));
		MemberDAO dao = new MemberDAO();
		try {
			int res = dao.insertMember(dto);
			if (res>0) {
				req.setAttribute("msg", "ȸ�����Լ���!! ȸ�������������� �̵��մϴ�.");
				req.setAttribute("url", "index.mem");
			}else {
				req.setAttribute("msg", "ȸ�����Խ���!! �ٽ� �Է��� �ּ���!!");
				req.setAttribute("url", "memberSsn.mem");
			}
		}catch(SQLException e) {}
		return "message.jsp";
	}

}










