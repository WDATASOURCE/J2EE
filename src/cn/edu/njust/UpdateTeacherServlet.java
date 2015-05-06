package cn.edu.njust;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class UpdateTeacherServlet extends HttpServlet {

	public UpdateTeacherServlet() {
		super();
	}
	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("GB2312");
		response.setCharacterEncoding("GB2312"); 
		HttpSession session = request.getSession(); 
		if(session.getAttribute("userinfo") == null) response.sendRedirect("../jsp/head.jsp");
		TeacherBean teacher = new TeacherBean(request.getParameter("tid"), request.getParameter("name"), request.getParameter("password"));
		int cnt = teacher.changeTeacher();
		if(cnt == 1) response.sendRedirect("../jsp/Check.jsp?value=successful");
		else if(cnt == 0) response.sendRedirect("../jsp/Check.jsp?value=The teacher is not exists");
		else response.sendRedirect("../jsp/Check.jsp?value=error");
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
