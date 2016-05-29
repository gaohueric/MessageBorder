<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head >
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/style1.css">
    <script type="text/javascript">
    // JavaScript Document
    function login(form){
            if(form.elements["username"].value == ""){
                alert("用户名不能空！");
                return false;
            }
            if(form.elements["password"].value == ""){
                alert("密码不能空！");
                return false;
            }
        }
        function message(form){
            if(form.elements["title"].value == ""){
                alert("留言标题不能为空！");
                return false;
            }
            if(form.elements["content"].value == ""){
                alert("留言内容不能空！");
                return false;
            }
        }
     
    
        
        
    </script>

</head>
<body>
<c:choose>
    <c:when test="${empty user}">
        <div class="container">
            <h1>用户登陆</h1>
            <form action="UserServlet" method="post" onsubmit="return login(this);">
             <input type="hidden" name="method" value="userLogin">
                <div class="from-group">
                    <input type="text" name="username" class="from-control" placeholder="用户名"  style="width: 420px;height: 55px">
                </div>
                <div class="from-group">
                    <input type="password" name="password" class="from-control" placeholder="密码"  style="width: 420px;height: 55px">
                </div>

                <div class="from-group1">
                    <a  class="a1" href="#"><input type="checkbox"/>记住我</a>
                    <a  class="a2" href="#">忘记密码</a>
                </div>
                <div class="from-group">
                    <input class="btn btn-info btn-lg" type="submit" value="登录" />
                    <input class="btn btn-info btn-lg" type="reset" value="重置"/>
                </div>
                <div class="from-group1">
                    <a  class="a3" href="user_reg.jsp">还没账户，马上注册</a>

                </div>
            </form>
        </div>
    </c:when>
    <c:otherwise>

  <div class="container1">
    <div class="message">
        <h1>打个招呼吧</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;那些现实中不曾发出的声音<br/>请把它留在这里</p>
        <form action="MessageServlet" method="post" submit="return message(this);">
        <input type="hidden" name="method" value="save">
            <div class="from-group20">
                <input type="text" name="title" class="from-control3" placeholder="标题"  style="width: 360px;height: 55px">
            </div>
            <div class="from-group20">
                   <textarea name="content" class="from-control3" cols=50 rows=6 >
留言
                   </textarea>
            </div>
            <div class="from-group10">
                <input class="btn btn-info btn-lg" type="submit" value="发布"/>
                <input class="btn btn-info btn-lg" type="reset" value="重置"/>
            </div>
        </form>
    </div>
</div>

    </c:otherwise>
</c:choose>

</body>
</html>