package cn.edu.njust;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class DeleteCourseServlet extends HttpServlet {


	public DeleteCourseServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
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
		String stu[] = request.getParameterValues("checkbox2");
		if(stu == null) response.sendRedirect("../jsp/Check.jsp?value=successful");
		else{
			int cnt = 0;
			for(int i = 0; i < stu.length; i++){
				CourseBean course = new CourseBean(stu[i], "");
				cnt += course.deleteCourse();
			}
			if(cnt == stu.length) response.sendRedirect("../jsp/Check.jsp?value=successful");
			else response.sendRedirect("../jsp/Check.jsp?value=failure");
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
