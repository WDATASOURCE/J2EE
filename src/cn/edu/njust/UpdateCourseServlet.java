package cn.edu.njust;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class UpdateCourseServlet extends HttpServlet {

	public UpdateCourseServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("userinfo") == null) {
			response.sendRedirect("../jsp/servletLoginCheck.jsp");
			return;
		}
		CourseBean course = new CourseBean(request.getParameter("cid"),
				request.getParameter("name"));
		int cnt = course.changeCourse();
		if (cnt == 1)
			response.sendRedirect("../jsp/Check.jsp?value=successful");
		else if (cnt == 0)
			response.sendRedirect("../jsp/Check.jsp?value=The course is not exists");
		else
			response.sendRedirect("../jsp/Check.jsp?value=error");
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
