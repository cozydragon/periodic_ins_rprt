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
<html lang="en">

<head>

	<%@ include file="../include/header.jsp" %>

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인 해 주십시오.</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="/user/loginCheck" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디" name="user_id" type="text" autofocus value="<%=userId%>">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호" name="password" type="password">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="useCookie" type="checkbox" 
                                        <% if (userId != "") { 
                                        %>
                                        	checked
                                        <% } %>
                                        >아이디 기억
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button class="btn btn-lg btn-success btn-block">Login</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<%@ include file="../include/footer.jsp" %>
	
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
