<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>验证</title>
</head>  
        <script type="text/javascript">  
            alert("您还没有登录, 或登录超时, 请重新登陆!");  
            window.document.location.href="./jsp/login.jsp";  
        </script>   

  
<body>
    
</body>
</html>
