package shop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CategoryDeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int result = ctdao.deleteCate(Integer.parseInt(cnum)); 
		String msg = null;
		String url = "cate_list.jsp";
		if (result>0) {
			msg = "ī�װ� ���� ����!! ī�װ� ����������� �̵��մϴ�.";
		}else {
			msg = "ī�װ� ���� ����!! ī�װ� ����������� �̵��մϴ�.";
		}
		return null;
	}

}
