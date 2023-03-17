<%@ page import="com.api.reporting.dto.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>    

<c:choose>
	<c:when test="${not empty sessionScope.ROLE}">
		<c:set var="role_id" value="${sessionScope.ROLE}"/>
	</c:when>
	<c:otherwise>
		alert ("로그인 시간이 만료되어 로그인화면으로 이동합니다.");
		response.sendRedirect("/");
	</c:otherwise>
</c:choose> 


</script>
	<div class="header">
	
		<div class="logo">
			<a href="#"><h1>아이티아이즈<br>CMS</h1></a>
		</div>
		<span class="nav_toggle">
			<input type="checkbox" id="checkbox-1" name="" class="navcheck" value="1" >
			<label for="checkbox-1"></label>
		</span>
		<ul class="gnb clearfix">
			<li><a href="#">${sessionScope.LOGIN.getUser_nm()}님이 로그인중입니다.</a></li>
		</ul>
		<ul class="right_nav">
			<li>
				<div class="btn-group">
				<button href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
					<ul class="dropdown-menu">
						<li><a href="/user/logout">로그아웃</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
	            

    