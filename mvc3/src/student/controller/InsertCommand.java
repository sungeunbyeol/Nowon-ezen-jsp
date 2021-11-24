package student.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.dao.StudentDAO;
import student.dto.StudentDTO;

public class InsertCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		StudentDTO dto = new StudentDTO();
		dto.setId(req.getParameter("id"));
		dto.setName(req.getParameter("name"));
		dto.setCname(req.getParameter("cname"));
		StudentDAO dao = new StudentDAO();
		String msg = null, url = null;
		try {
			int res = dao.insertStudent(dto);
			if (res>0) {
				msg = "�л���ϼ���!! �л������������ �̵��մϴ�.";
				url = "student.do?command=list";
			}else {
				msg = "�л���Ͻ���!! �л������������ �̵��մϴ�.";
				url = "student.do?command=start";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return  "message.jsp";
	}

}
