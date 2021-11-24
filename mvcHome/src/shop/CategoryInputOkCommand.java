package shop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CategoryInputOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		boolean isCheck = ctdao.check(ctdto);
		if (isCheck){
		
		int result = ctdao.insertCate(ctdto); 
		String msg = null;
		String url = null;
		if (result>0) {
			msg = "ī�װ� ��� ����!! ī�װ� ����������� �̵��մϴ�.";
			url = "cate_list.jsp";
		}else {
			msg = "ī�װ� ��� ����!! ī�װ� ����������� �̵��մϴ�.";
			url = "cate_input.jsp";
		}


	}

}
