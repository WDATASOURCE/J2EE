<%@ page language="java" pageEncoding="GB2312"%>

<!DOCTYPE HTML>
<html>
<head>
<title>页眉</title>
<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "../bootstrap/bootstrap.min.css">
<script src="../bootstrap/jquery.min.js"></script>
<script src="../bootstrap/bootstrap.js"></script>

</head>

    <%  
    	String username = null;
    	if(session.getAttribute("userinfo") == null) {  
	%>  
        <script type="text/javascript">  
            alert("您还没有登录, 或登录超时, 请重新登陆!");  
            window.document.location.href="./jsp/login.jsp";  
        </script>   
	<%  
   		}else{
   			username = (String)session.getAttribute("userinfo");
   		}
	%>  

<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
       <h3 class = "nav navbar-text">
        	<a href="./jsp/main.jsp"><span class="glyphicon glyphicon-home inline_icon" style = "color:black" id="back_icon"></span></a> 欢迎使用学生成绩管理系统
       </h3>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=username %><span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="./jsp/modifyTeacher.jsp">个人信息</a></li>
            <li><a href="./servlet/LogoutServlet">退出登录</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
</html>
