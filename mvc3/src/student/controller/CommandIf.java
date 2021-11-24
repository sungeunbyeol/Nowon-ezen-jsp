package student.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandIf {
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException;
	
	//인터페이스에서는 메소드를 선언만 해주는 거다.
	
}
