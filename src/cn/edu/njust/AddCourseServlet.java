package cn.edu.njust;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class AddCourseServlet extends HttpServlet {

	public AddCourseServlet() {
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
		CourseBean course = new CourseBean(request.getParameter("cid"), request.getParameter("name"));
		int cnt = course.addCourse();
		if(cnt == 1) response.sendRedirect("../jsp/Check.jsp?value=successful");
		else if(cnt == 0) response.sendRedirect("../jsp/Check.jsp?value=the CourseId has been existing");
		else response.sendRedirect("../jsp/Check.jsp?value=failure");
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
