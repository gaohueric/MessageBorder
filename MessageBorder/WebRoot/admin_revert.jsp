<%@ page language="java" contentType="text/html" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>�ظ�����</title>
		<link rel="stylesheet" type="text/css" href="images/style.css">
	</head>

	<body background="images/bg1.jpg">
		<c:if test="${empty message or empty admin}">
			<c:set scope="request" var="error" value="����Ȩ���ʴ�ҳ������"></c:set>
			<jsp:forward page="error.jsp"></jsp:forward>
		</c:if>
		<jsp:include page="head.jsp" />
		<div align="center">
			<div align="center" class="div2">
				<table align="center" width="100%" border="0" bgcolor="#C1C1C1"
					cellpadding="1" cellspacing="1">
					<tr>
						<td colspan="2" align="center" height="30" bgcolor="#941F53">
							<font class="title2">�� �� �� ��</font>
						</td>
					</tr>
					<tr bgcolor="#FAFAFA">
						<td align="right" height="25" width="100">
							<b>�� �⣺</b>
						</td>
						<td>
							&nbsp;${message.title}
						</td>
					</tr>
					<tr bgcolor="#FAFAFA">
						<td align="right">
							<b>�� �ݣ�</b>
						</td>
						<td>
							&nbsp;${message.content}
						</td>
					</tr>
					<tr bgcolor="#FAFAFA">
						<td align="right" height="25">
							<b>�� �ѣ�</b>
						</td>
						<td>
							&nbsp;${message.user.username}
						</td>
					</tr>
					<tr bgcolor="#FAFAFA">
						<td align="right">
							<b>�ظ����ԣ�</b>
						</td>
						<td>
							<form action="ManagerServlet" method="post">
								<table border="0">
									<tr>
										<td>
											<input type="hidden" name="method" value="saveOrUpdateRevert">
											<input type="hidden" name="id" value="${message.id}">
											<textarea rows="5" cols="50" name="content">
												${message.revert.content}
											</textarea>
										</td>
										<td align="center" valign="middle">
											<input type="submit" value="�� ��" />
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="bottom.jsp"></jsp:include>
	</body>
</html>
