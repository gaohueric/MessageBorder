<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
     <link type="text/css" rel="stylesheet" href="css/ym.css">
    <script type="text/javascript">
    function show(){
    window.location.href="user_login.jsp";
    }
    function changePage() {
				var currPage = document.getElementById("currPage").value;
				window.self.location = "MessageServlet?method=view&currPage="
						+ currPage;
			}
    </script>
    <style type="text/css">
  
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" >
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
      <div class="title">
	 			
	 			<c:choose>
	 
	 				<c:when test="${!empty admin}">
	 				
	 					管理员：${user.username}
	 					<a class="sy" href="welcome.jsp" class="title">首页</a>
	 					<a href="UserServlet?method=exit">退出</a>
	 				</c:when>
	 				<c:otherwise>
	 					用户名：${user.username}
	 					<a href="UserServlet?method=exit">退出</a>
	 				</c:otherwise>
	 			</c:choose>
 			</div>
        <h1>留言板</h1>
        <p>寄存秘密的地方，那些现实中不曾发出的声音，请把它留在这里</p>
       <p>你倾述的地方</p>
        <p><a class="btn btn-default btn-lg" href="user_login.jsp" role="button">发表留言</a></p>

    </div>
   
</div>
<div class="container">
    <div class="row">
       <table border="0" align="center" cellpadding="0" cellspacing="0"
			width="800">
			<tr bgcolor="#FFFFFF">
				<td>
				<div class="div1">
					<table align="center" border="0" width="750" cellpadding="0"
						cellspacing="0">
						<c:choose>
							<c:when test="${empty pageModel.list}">
								<tr>
									<td align="center">
										没有留言内容!
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- 循环输出留言信息 -->
								<c:forEach items="${pageModel.list}" var="m">
									<tr><td>
										<!-- 留言板内容 -->
										<table border="0" width="750" align="center" cellpadding="0"
											cellspacing="0">
											<tr bordercolor="#FFFFFF" bgcolor="#F0F0F0">
												<td height="22">
													<!-- 留言标题 -->
													<font class="title1">【${m.title}】</font>
												</td>
												<td align="right">
													<!-- 判断管理员用户是否登录 -->
													<c:if test="${!empty admin}">
														<c:if test="${empty m.revert}">
															<a href="ManagerServlet?method=revert&id=${m.id}">回复</a>
														</c:if>
														<a href="ManagerServlet?method=delete&id=${m.id}">删除</a>
													</c:if>
												</td>
											</tr>
											<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
												<td colspan="2">
													<!-- 留言内容 -->
													<div class="td1">${m.content}</div>
												</td>
											</tr>
											<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
												<td colspan="2" align="right" class="td2">
													网友：${m.user.username}&nbsp;|&nbsp; 
													时间：<fmt:formatDate pattern="yyyy-dd-MM HH:mm:ss"
														value="${m.createTime}" />&nbsp;|&nbsp; 
													联系方式：
													<a href="mailto:${m.user.email}">${m.user.email}</a>
												</td>
											</tr>
											<!-- 判断是否存在回复信息 -->
											<c:if test="${!empty m.revert.content}">
											<!-- 输出回复信息 -->
											<tr><td colspan="2">
												<div class="hf" align="center">
												<table border="0" cellpadding="1" cellspacing="1" width="690">
													<tr>
														<td align="left" valign="middle">
														<img src="images/admin.jpg" width="13" height="18">
														<font class="hf-title">管理员回复：</font></td>
														<td align="right">
															<!-- 判断是否是管理登录 -->
															<c:if test="${!empty admin}">
																<a href="ManagerServlet?method=revert&id=${m.id}">修改</a>
															</c:if>
														</td>
													</tr>
													<tr>
														<td colspan="2" height="2" bgcolor="#F0F0F0"></td>
													</tr>
													<tr>
														<td colspan="2">${m.revert.content}</td>
													</tr>
													<tr>
														<td colspan="2" align="right" class="td2">回复时间 ：
														<fmt:formatDate pattern="yyyy-dd-MM HH:mm:ss"
													value="${m.revert.revertTime}" />
														</td>
													</tr>
												</table>
												</div>
											</td></tr>
											</c:if>
										</table>
									</td></tr>
								</c:forEach>
								<tr bordercolor="#FFFFFF" bgcolor="#F0F0F0" align="center">
									<td height="8">
									</td>
								</tr>
								<tr bordercolor="#FFFFFF" >
									<td height="10"></td>
								</tr>
								<!-- 分页条 -->
								<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
									<td colspan="2">
									<table border="0" width="750" align="center">
										<tr>
										<td align="right">
											总记录数：${pageModel.totalRecords}
											当前${pageModel.currPage}/${pageModel.totalPage}页
											<a href="MessageServlet?method=view&currPage=${pageModel.previousPage}">
												上一页
											</a>
											<a href="MessageServlet?method=view&currPage=${pageModel.nextPage}">
												 下一页
											</a>
											<select id="currpage" onchange="changePage()">
												<c:forEach begin="1" end="${pageModel.totalPage}"
													varStatus="vs">
													<c:choose>
														<c:when test="${pageModel.currPage ne vs.count}">
															<option value="${vs.count}">
																第${vs.count}页
															</option>
														</c:when>
														<c:otherwise>
															<option value="${vs.count}" selected="selected">
																第${vs.count}页
															</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</td>
										</tr>
									</table>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr bordercolor="#FFFFFF" >
							<td height="10"></td>
						</tr>
						<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<td align="center">
								
							</td>
						</tr>
					</table>
				</div>
				</td>
			</tr>
		</table>
      
    </div>
    <hr/>
    
</div>
<div class="ym1">
    <footer>
    
       <div class="bar">
		<div class="barContentBox">
			<img class="logo" src="images/logo.png" alt=""/>
			<div class="logotext">内蒙古农业大学<br/>imau.edu.cn</div>
			<div id="info">联系地址：内蒙古呼和浩特市赛罕区昭乌达路306号 邮编：010018<br/>
			版权所有 © 2014-2015 内蒙古农业大学计算机与信息工程学院</div>
		</div>
		</div>
	
    </footer>
    </div>
</body>
</html>