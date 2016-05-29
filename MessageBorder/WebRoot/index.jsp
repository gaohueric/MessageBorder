<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
  <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
     
    <script type="text/javascript">
    function show(){
    window.location.href="user_login.jsp";
    }
    </script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">MessageBoard</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

            </ul>
            <form class="navbar-form navbar-right" role="Email">
                
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
            <a class="btn btn-success " type="submit" href="user_login.jsp" role="button">Sign in</a>
              <a class="btn btn-success " type="submit" href="user_reg.jsp" role="button">Sign up</a>
                
            </form>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="jumbotron">
    <div class="container">
        <h1>留言板</h1>
        <p>寄存秘密的地方，那些现实中不曾发出的声音，请把它留在这里</p>
       <p>你倾述的地方</p>
        <p><a class="btn btn-default btn-lg" href="user_login.jsp" role="button">发表留言</a></p>
    </div>
</div>
<div class="container">
    <div class="row">
       
      
    </div>
    <hr/>
    <footer>
        <p>&copy;Company 2016</p>
    </footer>
</div>
</body>
</html>