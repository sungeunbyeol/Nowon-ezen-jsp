package student.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.dao.StudentDAO;

public class DeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String msg = null, url = null;
		try {
			StudentDAO dao = new StudentDAO();
			int res = dao.deleteStudent(id);
			if (res>0) {
				msg = "학생삭제성공!! 학생목록페이지로 이동합니다.";
				url = "student.do?command=list";
			}else {
				msg = "학생삭제실패!! 학생삭제페이지로 이동합니다.";
				url = "student.do?command=start";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
