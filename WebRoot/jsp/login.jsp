<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>欢迎登陆</title>

<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "./bootstrap/bootstrap.min.css">

</head>
<script type="text/javascript">
function Confirm(){
    var a = document.getElementsByTagName("input");
    for(var i = 0; i < a.length; i++){
        if((a[i].type == "text" || a[i].type == "password") && a[i].value == ""){
            alert("表单中含有未填写字段, 请确保填写了所有字段!");
            return false;
        }
    }
    return true;
}
</script>

<body>
<div class="container">
    <h1 class="center-block text-center" style="max-width:400px;position: relative">
        <a href="/SGManager"><span class="glyphicon glyphicon-home inline_icon" style = "color:black" id="back_icon"></span></a>       请您登陆
    </h1>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <form action="./servlet/LoginServlet" method = "post" class="form-group">
                    <div class="form-group">
                        <input type="text" class="form-control" name = "tid" placeholder="请输入用户名"/>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name = "password" placeholder="请输入密码"/>
                    </div>
                    <select class = "form-control" name = "sess" >
                    	<option value = "30">记住我(默认时间)</option>
                    	<option value = "60">1小时</option>
                    	<option value = "120">2小时</option>
                    	<option value = "300">5小时</option>
                    </select><br/>
                    <button class="btn btn-block btn-primary" type="submit" onclick = "return Confirm()">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

