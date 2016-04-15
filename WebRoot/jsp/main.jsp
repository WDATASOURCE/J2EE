<%@ page language="java" import = "java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>"> 
<title>主页</title>
<%@include file = "./head.jsp" %>
<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/bootstrap.js"></script>

</head>

<script type="text/javascript">
function selectAll(name){
    //var a = document.getElementsByTagName("input");
    var a = document.getElementsByName(name);
    if(a[0].checked){
        for(var i = 0; i<a.length;i++){
            if(a[i].type == "checkbox") a[i].checked = false;
        }
    }else{
        for(var i = 0;i<a.length;i++){
            if(a[i].type == "checkbox") a[i].checked = true;
        }
    }
}
</script>


<body>
<div class = "container">
    <div class="tabbable"> <!-- Only required for left/right tabs -->
        <ul class="nav nav-tabs">
            <li class = "active"><a href = "#tab1" data-toggle = "tab">学生信息</a></li>
            <li><a href = "#tab2" data-toggle = "tab">课程信息</a></li>
            <li><a href = "#tab3" data-toggle = "tab">成绩信息</a></li>
        </ul>
        <div class = "tab-content">
            <div class = "tab-pane active" id = "tab1"><br/>
                <jsp:useBean id = "student" class = "cn.edu.njust.StudentBean" scope = "page"/>
                <form action = "./servlet/DeleteStudentServlet" method = "post">
                    <table class = "table table-condensed table-responsive">
                        <thead>
                            <tr style="text-align:center">
                                <td style = "width:35%"></td>
                                <td><a class = "btn btn-primary btn-sm" href = "./jsp/addStudent.jsp">添加学生信息</a></td>
                                <td><button type="button" class="btn btn-primary btn-sm" onclick = "selectAll('checkbox1')">全选/全不选</button></td>
                                <td><button type="submit" class="btn btn-primary btn-sm btn-danger" onclick = "return confirm('确认删除?')">删除所选记录</button></td>
                                <td style = "width:35%"></td>
                            </tr>
                        </thead>
                    </table>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <tr style="text-align:center">
                            <td>选择</td>
                            <td>学生学号</td>
                            <td>学生姓名</td>
                            <td>学生性别</td>
                            <td>操作</td>
                        </tr>
                        <%		
                        ResultSet rs = student.query();
                        while(rs.next()){
                        String sid = rs.getString("sid");
                        out.println("<tr style='text-align:center'>");
                            out.println("<td><input type = 'checkbox' name = 'checkbox1' id = '" + sid + "' value = '" + sid +"'/> </td>");
                            out.println("<td>" + sid + "</td> \n <td>" + rs.getString("name") + "</td> \n <td>" + rs.getString("sex") + "</td>");
                            out.println("<td> <a href = './jsp/modifyStudent.jsp?sid=" + sid + "'> <input type = 'button' value = '更新' /></a></td>");
                            out.println("</tr>");
                        }
                        student.closeConnection();
                        %>
                    </table>
                    <table class = "table table-condensed table-responsive">
                        <thead>
                            <tr style="text-align:center">
                                <td style = "width:35%"></td>
                                <td><a class = "btn btn-primary btn-sm" href = "./jsp/addStudent.jsp">添加学生信息</a></td>
                                <td><button type="button" class="btn btn-primary btn-sm" onclick = "selectAll('checkbox1')">全选/全不选</button></td>
                                <td><button type="submit" class="btn btn-primary btn-sm btn-danger" onclick = "return confirm('确认删除?')">删除所选记录</button></td>
                                <td style = "width:35%"></td>
                            </tr>
                        </thead>
                    </table>
                </form>
            </div>

            <div class="tab-pane fade" id="tab2"><br/>
                <jsp:useBean id = "course" class = "cn.edu.njust.CourseBean" scope = "page"/>
                <form action = "./servlet/DeleteCourseServlet" method = "post">
                    <table class = "table table-condensed table-responsive">
                        <thead>
                            <tr style="text-align:center">
                                <td style = "width:35%"></td>
                                <td><a class = "btn btn-primary btn-sm" href = "./jsp/addCourse.jsp">添加课程信息</a></td>
                                <td><button type="button" class="btn btn-primary btn-sm" onclick = "selectAll('checkbox2')">全选/全不选</button></td>
                                <td><button type="submit" class="btn btn-primary btn-sm btn-danger" onclick = "return confirm('确认删除?')">删除所选记录</button></td>
                                <td style = "width:35%"></td>
                            </tr>
                        </thead>
                    </table>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <tr style="text-align:center">
                            <td>选择</td>
                            <td>课程编号</td>
                            <td>课程名称</td>
                            <td>操作</td>
                        </tr>
                        <%		
                        ResultSet rss = course.query();
                        while(rss.next()){
                        String cid = rss.getString("cid");
                        out.println("<tr style='text-align:center'>");
                            out.println("<td><input type = 'checkbox' name = 'checkbox2' id = '" + cid + "' value = '" + cid +"'/> </td>");
                            out.println("<td>" + cid + "</td> \n <td>" + rss.getString("name") + "</td>");
                            out.println("<td> <a href = './jsp/modifyCourse.jsp?cid=" + cid + "'> <input type = 'button' value = '更新' /></a></td>");
                            out.println("</tr>");
                        }
                        course.closeConnection();
                        %>
                    </table>
                    <table class = "table table-condensed table-responsive">
                        <thead>
                            <tr style="text-align:center">
                                <td style = "width:35%"></td>
                                <td><a class = "btn btn-primary btn-sm" href = "./jsp/addCourse.jsp">添加课程信息</a></td>
                                <td><button type="button" class="btn btn-primary btn-sm" onclick = "selectAll('checkbox2')">全选/全不选</button></td>
                                <td><button type="submit" class="btn btn-primary btn-sm btn-danger" onclick = "return confirm('确认删除?')">删除所选记录</button></td>
                                <td style = "width:35%"></td>
                            </tr>
                        </thead>
                    </table>
                </form>
            </div>

            <div class="tab-pane fade" id="tab3"><br/>
                <jsp:useBean id = "grade" class = "cn.edu.njust.GradeBean" scope = "page"/>
                <form action = "./servlet/DeleteGradeServlet" method = "post">
                    <table class = "table table-condensed table-responsive">
                        <thead>
                            <tr style="text-align:center">
                                <td style = "width:35%"></td>
                                <td><a class = "btn btn-primary btn-sm" href = "./jsp/addGrade.jsp">添加成绩信息</a></td>
                                <td><button type="button" class="btn btn-primary btn-sm" onclick = "selectAll('checkbox3')">全选/全不选</button></td>
                                <td><button type="submit" class="btn btn-primary btn-sm btn-danger" onclick = "return confirm('确认删除?')">删除所选记录</button></td>
                                <td style = "width:35%"></td>
                            </tr>
                        </thead>
                    </table>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <tr style="text-align:center">
                            <td>选择</td>
                            <td>学生学号</td>
                            <td>课程编号</td>
                            <td>学生成绩</td>
                            <td>操作</td>
                        </tr>
                        <%		
                        ResultSet rsss = grade.query();
                        while(rsss.next()){
                        String sid = rsss.getString("sid");
                        String cid = rsss.getString("cid");
                        out.println("<tr style='text-align:center'>");
                            out.println("<td><input type = 'checkbox' name = 'checkbox3' value = '" + sid +"&&" + cid + "'/> </td>");
                            out.println("<td>" + sid + "</td> \n <td>" + cid + "</td> \n <td>" + rsss.getDouble("score") + "</td>");
                            out.println("<td> <a href = './jsp/modifyGrade.jsp?sid=" + sid + "&cid=" + cid +"'> <input type = 'button' value = '更新' /></a></td>");
                            out.println("</tr>");
                        }
                        grade.closeConnection();
                        %>
                    </table>
                    <table class = "table table-condensed table-responsive">
                        <thead>
                            <tr style="text-align:center">
                                <td style = "width:35%"></td>
                                <td><a class = "btn btn-primary btn-sm" href = "./jsp/addGrade.jsp">添加成绩信息</a></td>
                                <td><button type="button" class="btn btn-primary btn-sm" onclick = "selectAll('checkbox3')">全选/全不选</button></td>
                                <td><button type="submit" class="btn btn-primary btn-sm btn-danger" onclick = "return confirm('确认删除?')">删除所选记录</button></td>
                                <td style = "width:35%"></td>
                            </tr>
                        </thead>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
