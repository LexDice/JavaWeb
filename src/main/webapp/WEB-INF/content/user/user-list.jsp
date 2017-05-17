<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>用户列表</h1>
	<table>
		<tr>
			<th>ID</th>
			<th>USERNAME</th>
			<th>BIRTHDAY</th>
			<th>ROLE</th>
		</tr>
		<s:iterator value="#users">
			<tr align="center">
				<td>${userId}</td>
				<td>${userName}</td>
				<td>${userBirth}</td>
				<td>${role.roleName}</td>
			</tr>
		</s:iterator>

	</table>
</body>
</html>