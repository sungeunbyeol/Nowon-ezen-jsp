package student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.dao.StudentDAO;
import student.dto.StudentDTO;

public class StudentServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
																			throws ServletException, IOException {
		req.setCharacterEncoding("EUC-KR");
		resp.setContentType("text/html; charset=EUC-KR");
		
		String cmd = req.getParameter("command");
		PrintWriter pw = resp.getWriter();
		String nextPage = null;
		if (cmd.equals("insert")) {
			StudentDTO dto = new StudentDTO();
			dto.setId(req.getParameter("id"));
			dto.setName(req.getParameter("name"));
			dto.setCname(req.getParameter("cname"));
			StudentDAO dao = new StudentDAO();
			String msg = null, url = null;
			try {
				int res = dao.insertStudent(dto);
				if (res>0) {
					msg = "학생등록성공!! 학생목록페이지로 이동합니다.";
					url = "student.do?command=list";
				}else {
					msg = "학생등록실패!! 학생등록페이지로 이동합니다.";
					url = "student.do?command=start";
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			nextPage = "message.jsp";
		}else if (cmd.equals("delete")) {
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
			nextPage = "message.jsp";
		}else if (cmd.equals("find")) {
			String name = req.getParameter("name");
			try {
				StudentDAO dao = new StudentDAO();
				ArrayList<StudentDTO> list = dao.findStudent(name);
				req.setAttribute("listStudent", list);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			nextPage = "list.jsp";
		}else if (cmd.equals("list")) {
			try {
				StudentDAO dao = new StudentDAO();
				ArrayList<StudentDTO> list = dao.listStudent();
				req.setAttribute("listStudent", list);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			nextPage = "list.jsp";
		}else if (cmd.equals("start")) {
			nextPage = "student.jsp";
		}
		RequestDispatcher view = req.getRequestDispatcher(nextPage);
		view.forward(req, resp);
	}
	
}














