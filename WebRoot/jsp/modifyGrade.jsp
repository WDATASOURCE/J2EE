<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>�޸ĳɼ�</title>
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
	if(str.match(/^(:?(:?\d+.\d+)|(:?\d+))$/)) return confirm("ȷ���޸�?");
	else{ 
		alert("�ɼ����벻�Ϸ�, ����������!");
		return false;
	}
}
</script>

<body>
<h2 style = "text-align:center">�޸ĳɼ���Ϣ</h2>
<% 
String sid =request.getParameter("sid");
String cid = request.getParameter("cid");
%>
<h3 style = "text-align:center">��������º������</h3>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <form action="./servlet/UpdateGradeServlet" method = "post" class="form-group">
                    <div class="form-group">
                        <input type="text" class="form-control" name = "sid" value = <%=sid %> readonly />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name = "cid" value = <%=cid %> readonly />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name = "score" id = "score" placeholder="������ѧ���ɼ�"/>
                    </div>
                    <button class="btn btn-block btn-primary" type="submit" onclick = "return Confirm(document.getElementById('score'))">�޸�</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>	

