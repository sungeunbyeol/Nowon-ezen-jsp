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
		String title = mode.equals("id") ? "아이디" : "비밀번호";
		/*
		 * if (mode.equals("id")){ title = "아이디"; }else { title = "비밀번호"; }
		 */
		req.setAttribute("title", title);
		return "WEB-INF/login/search.jsp";
	}

}
