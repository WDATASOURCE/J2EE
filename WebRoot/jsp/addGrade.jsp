<%@ page language="java" import = "java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">  
<title>��ӳɼ���Ϣ</title>
<%@include file = "./head.jsp" %>
<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/bootstrap.js"></script>

</head>
<script type="text/javascript">
function Confirm(Strvalue){
    var a = document.getElementsByTagName("input");
    for(var i = 0; i < a.length; i++){
        if(a[i].type == "text" && a[i].value == ""){
            alert("���к���δ��д�ֶ�, ��ȷ����д�������ֶ�!");
            return false;
        }
    }
    var str = Strvalue.value;
    if(str >= 0 && str <= 100) return confirm("ȷ�����?");
    else{
    	alert("�ɼ����벻�Ϸ�, ����������!");
    	return false;
    }
}
</script>
<body>
<h2 style = "text-align:center"> ��ӳɼ���Ϣ </h2>
<jsp:useBean id = "student" class = "cn.edu.njust.StudentBean" scope = "page"/>
<jsp:useBean id = "course" class = "cn.edu.njust.CourseBean" scope = "page"/>
<%
ResultSet rsStudent = student.query();
ResultSet rsCourse = course.query();
%>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <form action="./servlet/AddGradeServlet" method = "post" class="form-group">
                    <select class = "form-control" name = "sid" >
                        <%
                        while(rsStudent.next()){
                        out.println("<option value='" + rsStudent.getString("sid") + "'>" + rsStudent.getString("sid") + "</option>");
                        }
                        if(rsStudent != null) rsStudent.close();
                        student.closeConnection();
                        %>
                    </select>
                    <select class = "form-control" name = "cid">
                        <%
                        while(rsCourse.next()){
                        out.println("<option value='" + rsCourse.getString("cid") + "'>" + rsCourse.getString("cid") + "</option>");
                        }
                        if(rsCourse != null) rsCourse.close();
                        course.closeConnection();
                        %>
                    </select>
                    <div class="form-group">
                        <input type="text" class="form-control" name = "score" id = "score" placeholder="������ѧ���ɼ�"/>
                    </div>
                    <button class="btn btn-block btn-primary" type="submit" onclick = "return Confirm(document.getElementById('score'))">���</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>	
