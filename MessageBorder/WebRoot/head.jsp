<%@ page language="java" contentType="text/html" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.t1{
		font-size: 10pt;
		font-weight: bold;
		color: white;
	}
	div.title{font-size: 12px}
	div.title a:LINK {text-decoration: underline; color: white}
	div.title a:visited {text-decoration: underline; color: white}
	div.title a:active {text-decoration: underline; color: white}
	div.title a:hover {text-decoration: underline; color: white}
	div.top{font-size: 12px;margin-top: 5; position: relative;}
	.gg{font-size: 13px;color: #F6DDB5;}
</style>
<table border="0" align="center" cellpadding="0" cellspacing="0" width="800">
 	<tr align="center">
 		<td background="images/top.jpg" width="800" height="204" align="center" valign="top" colspan="3">
 			<div class="top" align="center">
 				<c:choose>
	 				<c:when test="${empty user}">
	 					&gt;&gt; ����δ 
		 				<a href="index.jsp#login"><b>��¼</b></a>
		 				<a href="user_reg.jsp"><b>ע��</b></a>
	 				</c:when>
	 				<c:when test="${!empty admin}">
	 					����Ա��${user.username}
	 					<a href="UserServlet?method=exit"><b>�˳�</b></a>
	 				</c:when>
	 				<c:otherwise>
	 					�û�����${user.username}
	 					<a href="UserServlet?method=exit"><b>�˳�</b></a>
	 				</c:otherwise>
	 			</c:choose>
 				| ���� | ����
 			</div>
 		</td>
 	</tr>
 	<tr bgcolor="#941F53">
 		<td width="10%" align="center">
 			<img src="images/gg.jpg">
 		</td>
 		<td width="60%">
 			<marquee behavior="scroll" direction="left" scrolldelay="200">
 			<font class="gg">���棺��������Է�����Ϣ��д��ף�����������ഺ�йص����û���...</font>
 			</marquee> 
 		</td>
 		<td align="center" height="40" class="t1" width="30%">
 			<div class="title">
	 			<a href="index.jsp" class="title">��ҳ</a>
	 			<c:choose>
	 				<c:when test="${empty user}">
	 					<a href="user_reg.jsp">ע��</a>
	 					<a href="index.jsp#login">��¼</a>
	 				</c:when>
	 				<c:when test="${!empty admin}">
	 					<a href="UserServlet?method=exit">�˳�</a>
	 					����Ա��${user.username}
	 				</c:when>
	 				<c:otherwise>
	 					<a href="UserServlet?method=exit">�˳�</a>
	 					�û�����${user.username}
	 				</c:otherwise>
	 			</c:choose>
 			</div>
 		</td>
 	</tr>
</table>
