package cn.edu.njust;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	public LoginServlet() {
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
		TeacherBean teacher = new TeacherBean(request.getParameter("tid"), "", request.getParameter("password"));
		int choice = teacher.isExists();
		if(choice == 0) response.sendRedirect("../jsp/Check.jsp?value=The password is wrong");
		else if(choice == 1){
			int time = Integer.parseInt(request.getParameter("sess"));
			request.getSession().setMaxInactiveInterval(time * 60); 
            request.getSession().setAttribute("userinfo", teacher.getTid());
			response.sendRedirect("../jsp/main.jsp");
		}
		else response.sendRedirect("../jsp/Check.jsp?value=The username is not exists");
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
