package shop.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shop.admin.dao.ProductBean;

public class ProdInputOkCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MultipartRequest mr = null;
		String upPath = req.getServletContext().getRealPath("prodImages");
		int len = 20*1024*1024;
		try{
			mr = new MultipartRequest(req, upPath, len, "EUC-KR");
		}catch(IOException e){
			req.setAttribute("msg", "���� ���� �� ���� �߻�!!");
			req.setAttribute("url", "prod_input.shop");
			return "message.jsp";
		}
		ProductBean pdao = new ProductBean();
		String msg = null, url = null;
		try {
			int res = pdao.insertProduct(mr);
			if (res>0){
				msg = "��ǰ��ϼ���!! ��ǰ����������� �̵��մϴ�.";
				url = "prod_list.shop";					
			}else {
				msg = "��ǰ��Ͻ���!! ��ǰ����������� �̵��մϴ�.";
				url = "prod_input.shop";					
			}
		}catch(SQLException e) {}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}
}


