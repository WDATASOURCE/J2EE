<%@ page language="java" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>��ӭ��½</title>

<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/bootstrap.js"></script>

</head>
<script type="text/javascript">
function Confirm(){
    var a = document.getElementsByTagName("input");
    for(var i = 0; i < a.length; i++){
        if((a[i].type == "text" || a[i].type == "password") && a[i].value == ""){
            alert("���к���δ��д�ֶ�, ��ȷ����д�������ֶ�!");
            return false;
        }
    }
    return true;
}
</script>

<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
       <h3 class = "nav navbar-text">
        	<a href="./login.jsp"><span class="glyphicon glyphicon-home inline_icon" style = "color:black" id="back_icon" title = "��ӭ��½"></span></a> ��ӭʹ��ѧ���ɼ�����ϵͳ
       </h3>
      	<button type="button" class="btn btn-default btn-sm navbar-right" data-toggle="modal" data-target="#myModal">��ʾ</button>
    </div>
    </div>
</nav>
<div class="modal fade" id="myModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">��ʾ</h4>
      </div>
      <div class="modal-body">
        <ul>
			<li>��ʼ���û����������Ϊ 123456</li>
			<li>����ҳ��ı����Ϊ GB2312, ��ʾ�ѱ��������������ı������ݿ����ı���������</li>
			</ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">�ر�</button>
      </div>
    </div>
  </div>
</div>
<div class="container">
    <h1 class="center-block text-center" style="max-width:400px;position: relative">������½</h1>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <form action="./servlet/LoginServlet" method = "post" class="form-group">
                    <div class="form-group">
                        <input type="text" class="form-control" name = "tid" placeholder="�������û���"/>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name = "password" placeholder="����������"/>
                    </div>
                    <select class = "form-control" name = "sess" >
                    	<option value = "30">��ס��(Ĭ��ʱ��)</option>
                    	<option value = "60">1Сʱ</option>
                    	<option value = "120">2Сʱ</option>
                    	<option value = "300">5Сʱ</option>
                    </select><br/>
                    <button class="btn btn-block btn-primary" type="submit" onclick = "return Confirm()">��¼</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

