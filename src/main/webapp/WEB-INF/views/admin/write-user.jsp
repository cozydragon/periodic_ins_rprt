<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../include/header.jsp" %>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<%@ include file="../include/headNav.jsp" %>

            <div class="navbar-default sidebar" role="navigation">
                <%@ include file="../include/sidebar_admin.jsp" %>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">사용자 등록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	등록하기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
							<form role="form-group" action="/admin/write-user" method="post">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>사용자id</label>
											<input class="form-control" name="user_id" id="user_id">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>사용자명</label>
											<input class="form-control" name="user_name" id="user_name">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>이메일</label>
											<input class="form-control" name="email" id="email">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>권한</label>
											<select class="form-control" name="role_id" id="role_id">
												<option value="">선택</option>
												<c:forEach var="code_role" items="${code_role}">
													<option value="<c:out value="${code_role.code}" />">
														<c:out value="${code_role.code_name} (${code_role.code})"/>
													</option>
												</c:forEach>
											</select>
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>사이트</label>
											<select class="form-control" name="site_id" id="site_id">
												<option value="">선택</option>
												<c:forEach var="code_site" items="${code_site}">
													<option value="<c:out value="${code_site.code}" />">
														<c:out value="${code_site.code_name} (${code_site.code})"/>
													</option>
												</c:forEach>
											</select>
		                                </div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>비밀번호</label>
											<input class="form-control" placeholder="비밀번호" name="password" id="password" type="password">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>비밀번호확인</label>
											<input class="form-control" placeholder="비밀번호확인" name="password_confirm" id="password_confirm"  type="password">
										</div>
									</div>
								</div>

	                            <button type="button" class="btn btn-primary clist">목록</button>
                                <button type="button" class="btn btn-success cwrite">등록</button>
                                <button type="button" class="btn btn-warning creset">초기화</button>
							</form> 
                       </div>
                        <!-- /.panel-body -->
                        
                        <!-- <div class="panel-body">
                        	리플 영역
                        </div> -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
	<%@ include file="../include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			
			
			$(".clist").on("click",function(){
				$(location).attr('href',"/admin/show-user");
			});
			
			$(".cwrite").on("click",function(){
				
			  error = '';
				
			  if( $('#user_id').val() == '' ) {
				  error = error + '- 사용자id는 필수항목입니다. \n';
			  }
			  
			  if( $('#password').val() == '' ) {
				  error = error + "- 비밀번호를 입력하여 주십시오. \n"
			  }
			  
			  if( $('#role_id').val() == '' ) {
				  error = error + "- 권한을 선택하여 주십시오. \n"
			  }
			  
			  if( $('#site_id').val() == '' ) {
				  error = error + "- 사이트를 선택하여 주십시오. \n"
			  }
			  
			  if( $('#password').val() != $('#password_confirm').val()) {
				  error = error + "- 비밀번호가 일치하지 않습니다. \n"
			  }
			  

			  if(error != ''){

				alert(error);

				error = '';

				return false;

			   }
				
				$("form[role='form-group']")[0].submit();
			});
			$(".creset").on("click",function(){
				$("form[role='form-group']")[0].reset();
			});
		});
	</script>
</body>

</html>