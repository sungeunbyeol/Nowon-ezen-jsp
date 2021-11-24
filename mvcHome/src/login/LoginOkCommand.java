package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String saveId = req.getParameter("saveId");
		
		LoginCheck loginCheck = new LoginCheck();
		LoginOkBean loginOk = new LoginOkBean();
		loginCheck.setId(req.getParameter("id"));
		loginCheck.setPasswd(req.getParameter("passwd"));
				
		Cookie ck = new Cookie("saveId", loginCheck.getId());
		
	 	int res = loginCheck.checkLogin();
		
	 	String msg = null, url = null;
		switch(res){
		case LoginCheck.OK :
			if (saveId == null){
				ck.setMaxAge(0);
			}else {
				ck.setMaxAge(12*60*60);
			}
			resp.addCookie(ck);
			loginOk.setId(loginCheck.getId());
			boolean isLogin = loginOk.isMemberSetting();
			HttpSession session = req.getSession();
			session.setAttribute("loginOk", loginOk);
			msg = "로그인 되었습니다.";
			url = "main.do";
			break;
		case LoginCheck.NOT_ID :
			msg = "없는 아이디 입니다. 다시 확인하시고 입력해 주세요";
			url = "login.log";
			break;
		case LoginCheck.NOT_PWD :
			msg = "비밀번호가 틀렸습니다. 다시 확인하시고 입력해 주세요";
			url = "login.log";
			break;
		case LoginCheck.ERROR :
			msg = "DB서버 오류 발생!! 관리자에게 문의해 주세요!!";
			url = "login.log";
			break;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
