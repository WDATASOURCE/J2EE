<%@ page language="java" import = "java.sql.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>"> 
<title>������Ϣ</title>

<%@include file = "./head.jsp" %>
<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
<!-- bootstrap -->
<link rel = "stylesheet" href = "./bootstrap/bootstrap.min.css">
<script src="./bootstrap/jquery.min.js"></script>
<script src="./bootstrap/bootstrap.js"></script>
</head>

<jsp:useBean id = "teacher" class = "cn.edu.njust.TeacherBean" scope = "page"/>
<%	
teacher.setTid(username);
ResultSet rsTeacher = teacher.query();
if(rsTeacher.next()){
teacher.setName(rsTeacher.getString("name"));
teacher.setPassword(rsTeacher.getString("password"));
}
if(rsTeacher != null) rsTeacher.close();
teacher.closeConnection();
%>

<script type="text/javascript">
function Confirm1(){
    var a = document.getElementsByTagName("input");
    for(var i = 0; i < a.length; i++){
        if(a[i].type == "text" && a[i].value == ""){
            alert("���к���δ��д�ֶ�, ��ȷ����д�������ֶ�!");
            return false;
        }
    }
    return confirm("ȷ���޸�?");
}

function Confirm2(){

    var a = document.getElementsByTagName("input");
    for(var i = 0; i < a.length; i++){
        if(a[i].type == "password" && a[i].value == ""){
            alert("���к���δ��д�ֶ�, ��ȷ����д�������ֶ�!");
            return false;
        }
    }
    with(document.all){
        if(password_old.value != <%=teacher.getPassword()%>){
            alert("�������ԭʼ���벻��ȷ��");
            return false;
        }
        if(password_new.value != password_rep.value){
            alert("��������������벻ͬ�����������룡");
            return false;
        }
    }
    return confirm("ȷ���޸�?");
}
</script>

<body>
<div class="container">
    <div class="row">
        <div class = "col-md-2"></div>
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading">��������</div>
                <form class="form-horizontal panel-body" method="post" action="./servlet/UpdateTeacherServlet">
                    <input type="hidden" name="tid" value="<%=teacher.getTid()%>">
                    <input type="hidden" name = "password" value = "<%=teacher.getPassword()%>">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">�û���</label>
                        <div class="col-sm-9">
                            <label class="control-label"><%=teacher.getTid() %></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">��ʦ����</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="name" value="<%=teacher.getName()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class = "col-sm-4"></div>
                        <div class="control-label col-sm-4">
                            <button class="btn btn-default btn-block" type="submit" onclick = "return Confirm1()">�޸�</button>
                        </div>
                        <div class = "col-sm-4"></div>
                    </div>
                </form>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse_change_pass" class="collapsed">�޸����� </a>
                    </h4>
                </div>
                <div class="panel-collapse collapse" id="collapse_change_pass">
                    <form class="form-horizontal panel-body" id="form_change_password" name = "form_change_password" method="post" action="./servlet/UpdateTeacherServlet">

                        <input type="hidden" name="tid" value="<%=teacher.getTid()%>">
                        <input type = "hidden" name = "name" value = "<%=teacher.getName() %>">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">ԭʼ����</label>
                            <div class="col-sm-9">
                                <label class="err-msg-label"></label>
                                <input class="form-control" type="password" id = "password_old" name="password_old">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">������</label>
                            <div class="col-sm-9">
                                <label class="err-msg-label"></label>
                                <input class="form-control" type="password" id = "password_new" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">�ظ�������</label>
                            <div class="col-sm-9">
                                <label class="err-msg-label"></label>
                                <input class="form-control" type="password" id = "password_rep" name="password_rep">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class = "col-sm-4"></div>
                            <div class="control-label col-sm-4">
                                <button class="btn btn-default btn-block" type="submit" onclick = "return Confirm2()">�޸�</button>
                            </div>
                            <div class = "col-sm-4"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class = "col-md-2"></div>
    </div>
</div>
</body>
</html>

