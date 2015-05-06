package cn.edu.njust;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class DeleteGradeServlet extends HttpServlet {

	public DeleteGradeServlet() {
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
		String stu[] = request.getParameterValues("checkbox3");
		if(stu == null) response.sendRedirect("../jsp/Check.jsp?value=successful");
		else{
			int cnt = 0;
			for(int i = 0; i < stu.length; i++){
				String values[] = stu[i].split("&&");
				String sid = values[0];
				String cid = values[1];
				GradeBean grade = new GradeBean(sid, cid, 0.0);
				cnt += grade.deleteGrade();
			}
			if(cnt == stu.length) response.sendRedirect("../jsp/Check.jsp?value=successful");
			else response.sendRedirect("../jsp/Check.jsp?value=failure");
		}
	}
	
	public void init() throws ServletException {
		// Put your code here
	}

}
