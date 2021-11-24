package shop.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.admin.dao.ProductBean;

public class ProdDeleteCommand implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pnum = req.getParameter("pnum");
		String pimage = req.getParameter("pimage");
		ProductBean pdao = new ProductBean();
		String msg = null;
		try {
			int res = pdao.deleteProduct(Integer.parseInt(pnum));
			if (res>0){
				String upPath = req.getServletContext().getRealPath("prodImages");
				File file = new File(upPath, pimage);
				if (file.exists()){
					file.delete();
					msg = "��ǰ���� ����!!(�̹������� ������) ��ǰ����������� �̵��մϴ�.";
				}else {
					msg = "��ǰ���� ����!!(�̹������� ����!!) ��ǰ����������� �̵��մϴ�.";
				}
			}else {
				msg = "��ǰ���� ����!! ��ǰ����������� �̵��մϴ�.";
			}
		}catch(SQLException e) {}
		req.setAttribute("msg", msg);
		req.setAttribute("url", "prod_list.shop");
		return "message.jsp";
	}

}
