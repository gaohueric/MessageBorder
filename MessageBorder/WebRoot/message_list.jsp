<%@ page language="java" contentType="text/html" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>留言内容</title>
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
									<td align="center">没有留言内容!</td>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- 循环输出留言信息 -->
								<c:forEach items="${pageModel.list}" var="m">
									<tr>
										<td>
											<!-- 留言板内容 -->
											<table border="0" width="750" align="center" cellpadding="0"
												cellspacing="0">
												<tr bordercolor="#FFFFFF" bgcolor="#F0F0F0">
													<td height="22">
														<!-- 留言标题 --> <font class="title1">【${m.title}】</font></td>
													<td align="right">
														<!-- 判断管理员用户是否登录 --> <c:if test="${!empty admin}">
															<c:if test="${empty m.revert}">
																<a href="ManagerServlet?method=revert&id=${m.id}">回复</a>
															</c:if>
															<a href="ManagerServlet?method=delete&id=${m.id}">删除</a>
														</c:if></td>
												</tr>
												<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
													<td colspan="2">
														<!-- 留言内容 -->
														<div class="td1">${m.content}</div></td>
												</tr>
												<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
													<td colspan="2" align="right" class="td2">
														网友：${m.user.username}&nbsp;|&nbsp; 时间：<fmt:formatDate
															pattern="yyyy-dd-MM HH:mm:ss" value="${m.createTime}" />&nbsp;|&nbsp;
														联系方式： <a href="mailto:${m.user.email}">${m.user.email}</a>
													</td>
												</tr>
												<!-- 判断是否存在回复信息 -->
												<c:if test="${!empty m.revert.content}">
													<!-- 输出回复信息 -->
													<tr>
														<td colspan="2">
															<div class="hf" align="center">
																<table border="0" cellpadding="1" cellspacing="1"
																	width="690">
																	<tr>
																		<td align="left" valign="middle"><img
																			src="images/admin.jpg" width="13" height="18">
																			<font class="hf-title">管理员回复：</font>
																		</td>
																		<td align="right">
																			<!-- 判断是否是管理登录 --> <c:if test="${!empty admin}">
																				<a href="ManagerServlet?method=revert&id=${m.id}">修改</a>
																			</c:if></td>
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
								<!-- 分页条 -->
								<tr bordercolor="#FFFFFF" bgcolor="#FFFFFF">
									<td colspan="2">
										<table border="0" width="750" align="center">
											<tr>
												<td align="right">总记录数：${pageModel.totalRecords}
													当前${pageModel.currPage}/${pageModel.totalPage}页 <a
													href="MessageServlet?method=view&currPage=${pageModel.previousPage}">
														上一页 </a> <a
													href="MessageServlet?method=view&currPage=${pageModel.nextPage}">
														下一页 </a> <select id="currpage" onchange="changePage()">
														<c:forEach begin="1" end="${pageModel.totalPage}"
															varStatus="vs">
															<c:choose>
																<c:when test="${pageModel.currPage ne vs.count}">
																	<option value="${vs.count}">第${vs.count}页</option>
																</c:when>
																<c:otherwise>
																	<option value="${vs.count}" selected="selected">
																		第${vs.count}页</option>
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
