<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
Cookie [] allCookies = request.getCookies();
String userId = "";
if(allCookies != null) {
	for (int i=0; i < allCookies.length; i++) {
		if(allCookies[i].getName().equals("userId")){
			userId = allCookies[i].getValue();
		}
	}
}

HttpSession sessionValue = request.getSession();

Object loginyn = sessionValue.getAttribute("loginyn");

if (loginyn == null){
	loginyn = "";
}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta content='IE=edge' http-equiv='X-UA-Compatible'>
    <title>정기점검보고서 시스템</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    
	<%@ include file="../include/header.jsp" %>

</head>

<body class="logoin_page">

  <div class="login_wrapper">
       <div class="text_center">
           <a href="../index.html" class="logo_login"><span> 정기점검보고서 <br /> 시스템 </span>  </a>
       </div>

       <form class="form-horizontal m-t-20" action="/user/loginCheck" method="post">

           <div class="form-group">
               <div class="col-xs-12">
                   <input class="form-control" type="text" name="user_id" required="" placeholder="ID를 입력해주세요" value="<%=userId%>" focus> 
                   <i class="fa fa-user-o fa-2x form-control-feedback l-h-34"></i>
               </div>
           </div>

           <div class="form-group">
               <div class="col-xs-12">
                   <input class="form-control" type="password" name="password" required="" placeholder="Password를 입력해주세요">
                    <i class="fa fa-key fa-2x form-control-feedback l-h-34"></i>
               </div>
           </div>

           <div class="form-group">
               <div class="col-xs-12">
                   <div class="checkbox checkbox-primary">
                       <input id="checkbox-signup" type="checkbox"
                                        <% if (userId != "") { 
                                        %>
                                        	checked
                                        <% } %>
                                        >
						<label for="checkbox-signup">
                           	아이디 기억하기
                       </label>
                   </div>

               </div>
           </div>

           <div class="form-group text-right m-t-20">
               <div class="col-xs-12">
                   <button class="btn blue" type="submit">로그인
                   </button>
               </div>
           </div>

           <div class="form-group m-t-30">
               <div class="col-sm-7">
                   <a href="" class="text-muted"><i class="fa fa-lock m-r-5"></i> 비밀번호를 잊으셨나요?</a>
               </div>
               <div class="col-sm-5 text-right">
                   <a href="" class="text-muted">신규신청</a>
               </div>
           </div>
       </form>
   </div>

	<script type="text/javascript">
	
		$(document).ready(function(){

			<% if ("n".equals(loginyn)){
			%>	
				alert("아이디가 없거나 패스워드가 잘못 입력되었습니다.");
			<%
				}
			%>
			
		});
	</script>

</body>

</html>
