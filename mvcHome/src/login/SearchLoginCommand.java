package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchLoginCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String mode = req.getParameter("mode");
		String title = mode.equals("id") ? "���̵�" : "��й�ȣ";
		/*
		 * if (mode.equals("id")){ title = "���̵�"; }else { title = "��й�ȣ"; }
		 */
		req.setAttribute("title", title);
		return "WEB-INF/login/search.jsp";
	}

}
