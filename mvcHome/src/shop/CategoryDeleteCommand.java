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
			msg = "카테고리 삭제 성공!! 카테고리 목록페이지로 이동합니다.";
		}else {
			msg = "카테고리 삭제 실패!! 카테고리 목록페이지로 이동합니다.";
		}
		return null;
	}

}
