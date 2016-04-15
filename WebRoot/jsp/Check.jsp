<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%	
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");  
	%>
        <script type="text/javascript" language="javascript"> 
        	<% String value = request.getParameter("value"); %> 
            alert("<%=value%>");
            <% if(value.compareTo("The password is wrong") == 0 || value.compareTo("The username is not exists") == 0){ %>
            	window.document.location.href="./jsp/login.jsp";
            <% }else {%>
            	window.document.location.href="./jsp/main.jsp";  
        	<%}%>
        </script> 
  </body>
</html>
