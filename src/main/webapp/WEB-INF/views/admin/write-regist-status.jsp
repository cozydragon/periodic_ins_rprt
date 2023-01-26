<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                    <h1 class="page-header">모듈</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	모듈 수정
                        </div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
							<form role="form-group" action="/admin/write-regist-status" method="post">
							
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>코드</label>
											<input class="form-control" name="code" id="code">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>HEX코드</label>
											<input class="form-control" name="code_hex" id="code_hex">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>코드명</label>
											<input class="form-control" name="code_nm" id="code_nm">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>코드메시지</label>
											<input class="form-control" name="code_message" id="code_message">
										</div>
									</div>
								</div>
                                <button type="button" class="btn btn-success cwrite">저장</button>
                                <button type="button" class="btn btn-primary clist">목록</button>
							</form> 
                       </div>
                        <!-- /.panel-body -->
                        
                    </div>
                    <!-- /.panel -->
                    
			        <div class="panel panel-default">
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
	<%@ include file="../include/footer.jsp" %>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
		
			$(".clist").on("click",function(){
				$(location).attr('href',"/admin/show-regist-status");
			});
			
			$(".cwrite").on("click",function(){
				
			  error = '';
				
  			  if( $('#code').val() == '' ) {
				 error = error + '- 코드는 필수항목입니다. \n';
				 $('#code').focus();
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

</html>