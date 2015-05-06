<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">  
<title>���ѧ����Ϣ</title>
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
            alert("���к���δ��д�ֶ�, ��ȷ����д�������ֶ�!");
            return false;
        }
    }
    return confirm("ȷ�����?");
}
</script>

<body>
<h2 style = "text-align:center">���ѧ����Ϣ</h2>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <form action="./servlet/AddStudentServlet" method = "post" class="form-group">
                    <div class="form-group">
                        <input type="text" class="form-control" name = "sid" placeholder="������ѧ��ѧ��"/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name = "name" placeholder="������ѧ������"/>
                    </div>
                    <select class = "form-control" name = "sex" >
                        <option value = "1">��</option>
                        <option value = "2">Ů</option>
                    </select><br/>
                    <button class="btn btn-block btn-primary" type="submit" onclick = "return Confirm()">���</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

