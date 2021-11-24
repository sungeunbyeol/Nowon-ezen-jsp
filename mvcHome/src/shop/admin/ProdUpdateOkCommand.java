package shop.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shop.admin.dao.ProductBean;

public class ProdUpdateOkCommand implements CommandIf {

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
			req.setAttribute("url", "prod_update.shop?pnum=" + mr.getParameter("pnum"));	
			return "message.jsp";
		}  
		ProductBean pdao = new ProductBean();
		String msg = null, url = null;
		try {
			int res = pdao.updateProduct(mr);
			if (res>0){
				msg = "��ǰ��������!! ��ǰ����������� �̵��մϴ�.";
				url = "prod_list.shop";					
			}else {
				msg = "��ǰ��������!! ��ǰ������������ �̵��մϴ�.";
				url = "prod_update.shop?pnum=" + mr.getParameter("pnum");					
			}
		}catch(SQLException e) {}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
