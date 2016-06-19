<%@ page language="java" contentType="text/html" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>��������</title>
<link rel="stylesheet" type="text/css" href="images/style.css">
<script type="text/javascript">
			function changePage() {
				var currPage = document.getElementById("currPage").value;
				window.self.location = "MessageServlet?method=view&currPage="
						+ currPage;
			}
		</script>
</head>

<body background="images/bg1.jpg">
	<jsp:include page="head.jsp" />
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
									<td align="center">û����������!</td>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- ѭ�����������Ϣ -->
								<c:forEach items="${pageModel.list}" var="m">
									<tr>
										<td>
											<!-- ���԰����� -->
											<table border="0" width="750" align="center" cellpadding="0"
												cellspacing="0">
												<tr bordercolor="#FFFFFF" bgcolor="#F0F0F0">
													<td height="22">
														<!-- ���Ա��� --> <font class="title1">��${m.title}��</font></td>
													<td align="right">
														<!-- �жϹ���Ա�û��Ƿ��¼ --> <c:if test="${!empty admin}">
															<c:if test="${empty m.revert}">
																<a href="ManagerServlet?method=revert&id=${m.id}">�ظ�</a>
															</c:if>
															<a href="ManagerServlet?method=delete&id=${m.id}">ɾ��</a>
														</c:if></td>
												</tr>
												<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
													<td colspan="2">
														<!-- �������� -->
														<div class="td1">${m.content}</div></td>
												</tr>
												<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
													<td colspan="2" align="right" class="td2">
														���ѣ�${m.user.username}&nbsp;|&nbsp; ʱ�䣺<fmt:formatDate
															pattern="yyyy-dd-MM HH:mm:ss" value="${m.createTime}" />&nbsp;|&nbsp;
														��ϵ��ʽ�� <a href="mailto:${m.user.email}">${m.user.email}</a>
													</td>
												</tr>
												<!-- �ж��Ƿ���ڻظ���Ϣ -->
												<c:if test="${!empty m.revert.content}">
													<!-- ����ظ���Ϣ -->
													<tr>
														<td colspan="2">
															<div class="hf" align="center">
																<table border="0" cellpadding="1" cellspacing="1"
																	width="690">
																	<tr>
																		<td align="left" valign="middle"><img
																			src="images/admin.jpg" width="13" height="18">
																			<font class="hf-title">����Ա�ظ���</font>
																		</td>
																		<td align="right">
																			<!-- �ж��Ƿ��ǹ����¼ --> <c:if test="${!empty admin}">
																				<a href="ManagerServlet?method=revert&id=${m.id}">�޸�</a>
																			</c:if></td>
																	</tr>
																	<tr>
																		<td colspan="2" height="2" bgcolor="#F0F0F0"></td>
																	</tr>
																	<tr>
																		<td colspan="2">${m.revert.content}</td>
																	</tr>
																	<tr>
																		<td colspan="2" align="right" class="td2">�ظ�ʱ�� ��
																			<fmt:formatDate pattern="yyyy-dd-MM HH:mm:ss"
																				value="${m.revert.revertTime}" /></td>
																	</tr>
																</table>
															</div></td>
													</tr>
												</c:if>
											</table></td>
									</tr>
								</c:forEach>
								<tr bordercolor="#FFFFFF" bgcolor="#F0F0F0" align="center">
									<td height="8"></td>
								</tr>
								<tr bordercolor="#FFFFFF">
									<td height="10"></td>
								</tr>
								<!-- ��ҳ�� -->
								<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
									<td colspan="2">
										<table border="0" width="750" align="center">
											<tr>
												<td align="right">�ܼ�¼����${pageModel.totalRecords}
													��ǰ${pageModel.currPage}/${pageModel.totalPage}ҳ <a
													href="MessageServlet?method=view&currPage=${pageModel.previousPage}">
														��һҳ </a> <a
													href="MessageServlet?method=view&currPage=${pageModel.nextPage}">
														��һҳ </a> <select id="currpage" onchange="changePage()">
														<c:forEach begin="1" end="${pageModel.totalPage}"
															varStatus="vs">
															<c:choose>
																<c:when test="${pageModel.currPage ne vs.count}">
																	<option value="${vs.count}">��${vs.count}ҳ</option>
																</c:when>
																<c:otherwise>
																	<option value="${vs.count}" selected="selected">
																		��${vs.count}ҳ</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
												</select></td>
											</tr>
										</table></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr bordercolor="#FFFFFF">
							<td height="10"></td>
						</tr>
						<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
							<td align="center"></td>
						</tr>
					</table>
				</div></td>
		</tr>
	</table>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
