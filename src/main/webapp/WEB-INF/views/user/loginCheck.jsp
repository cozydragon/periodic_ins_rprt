<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<%@ include file="../include/header.jsp" %>

</head>

<body>

	<%
		HttpSession sessionValue = request.getSession();
	
		Object login = sessionValue.getAttribute("LOGIN");
		
		if(login != null){
			response.sendRedirect("/");
		} else {
			response.sendRedirect("/user/login");
		}
	%>

	<%@ include file="../include/footer.jsp" %>

</body>

</html>
