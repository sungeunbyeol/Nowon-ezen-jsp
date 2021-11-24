package student.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.dao.StudentDAO;
import student.dto.StudentDTO;

public class ListCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			StudentDAO dao = new StudentDAO();
			ArrayList<StudentDTO> list = dao.listStudent();
			req.setAttribute("listStudent", list);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "list.jsp";
	}

}
