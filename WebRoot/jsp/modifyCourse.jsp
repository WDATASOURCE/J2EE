<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>"> 
<title>修改课程信息</title>
<%@include file = "./head.jsp" %>
<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "./bootstrap/bootstrap.min.css">

</head>

<body>
<script type="text/javascript">
function Confirm(){
    var a = document.getElementsByTagName("input");
    for(var i = 0; i < a.length; i++){
        if(a[i].type == "text" && a[i].value == ""){
            alert("表单中含有未填写字段, 请确保填写了所有字段!");
            return false;
        }
    }
    return confirm("确认修改?");
}
</script>

<body>
<h2 style = "text-align:center">修改课程信息</h2>
<% 
String cid =request.getParameter("cid");
%>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <form action="./servlet/UpdateCourseServlet" method = "post" class="form-group">
                    <div class="form-group">
                        <input type="text" class="form-control" name = "cid" value = <%= cid %> readonly/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name = "name" placeholder="请输入科目名称"/>
                    </div>
                    <button class="btn btn-block btn-primary" type="submit" onclick = "return Confirm()">修改</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

