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
			msg = "�α��� �Ǿ����ϴ�.";
			url = "main.do";
			break;
		case LoginCheck.NOT_ID :
			msg = "���� ���̵� �Դϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���";
			url = "login.log";
			break;
		case LoginCheck.NOT_PWD :
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���Ͻð� �Է��� �ּ���";
			url = "login.log";
			break;
		case LoginCheck.ERROR :
			msg = "DB���� ���� �߻�!! �����ڿ��� ������ �ּ���!!";
			url = "login.log";
			break;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
