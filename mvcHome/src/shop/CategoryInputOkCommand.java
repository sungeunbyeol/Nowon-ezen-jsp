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
			msg = "카테고리 등록 성공!! 카테고리 목록페이지로 이동합니다.";
			url = "cate_list.jsp";
		}else {
			msg = "카테고리 등록 실패!! 카테고리 등록페이지로 이동합니다.";
			url = "cate_input.jsp";
		}


	}

}
