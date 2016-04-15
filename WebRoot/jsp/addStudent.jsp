<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">  
<title>添加学生信息</title>
<%@include file = "./head.jsp" %>
<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "./bootstrap/bootstrap.min.css">

</head>
<script type="text/javascript">
function Confirm(){
    var a = document.getElementsByTagName("input");
    for(var i = 0; i < a.length; i++){
        if(a[i].type == "text" && a[i].value == ""){
            alert("表单中含有未填写字段, 请确保填写了所有字段!");
            return false;
        }
    }
    return confirm("确认添加?");
}
</script>

<body>
<h2 style = "text-align:center">添加学生信息</h2>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <form action="./servlet/AddStudentServlet" method = "post" class="form-group">
                    <div class="form-group">
                        <input type="text" class="form-control" name = "sid" placeholder="请输入学生学号"/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name = "name" placeholder="请输入学生姓名"/>
                    </div>
                    <select class = "form-control" name = "sex" >
                        <option value = "1">男</option>
                        <option value = "2">女</option>
                    </select><br/>
                    <button class="btn btn-block btn-primary" type="submit" onclick = "return Confirm()">添加</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

