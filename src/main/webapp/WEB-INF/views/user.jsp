<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	<h1>계정내역</h1>

	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>생성시간</th>
				<th>수정시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="user">
				<tr>
					<td>${user.user_id}</td>
					<td>${user.user_name}</td>
					<td>${user.password}</td>
					<td>${user.email}</td>
					<td>${user.create_time}</td>
					<td>${user.update_time}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>
