package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		Cookie cks[] = req.getCookies();
		if (cks != null && cks.length != 0){
			for(int i=0; i<cks.length; ++i){
				String name = cks[i].getName();
				if (name.equals("saveId")){
					String value = cks[i].getValue();
					req.setAttribute("cookie", value);
					break;
				}
			}
		}
		
		return "WEB-INF/login/login.jsp";
	}

}
