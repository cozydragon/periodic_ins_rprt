<%@page import="com.api.reporting.dto.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>    
<%	if (session.getAttribute("ROLE") != null){
		String role_id = session.getAttribute("ROLE").toString(); 
	    UserVO userVO = (UserVO) session.getAttribute("LOGIN");
	}else {
%>
alert ("로그인 시간이 만료되어 로그인화면으로 이동합니다.");
<%
		response.sendRedirect("/");
	}
	
%>

</script>
	<div class="header">
	
		<div class="logo">
			<a href="#"><h1>정기점검보고서<br>시스템</h1></a>
		</div>
		<span class="nav_toggle">
			<input type="checkbox" id="checkbox-1" name="" class="navcheck" value="1" >
			<label for="checkbox-1"></label>
		</span>
		<ul class="gnb clearfix">
			<li><a href="#">홍길동님이 로그인중입니다.</a></li>
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
	            

    