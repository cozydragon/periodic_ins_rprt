<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <h1 class="page-header">사이트 등록</h1>
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
							<form role="form-group" action="/admin/write-site" method="post">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>사이트id</label>
											<input class="form-control" name="site_id" id="site_id">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>사이트명</label>
											<input class="form-control" name="site_name" id="site_name">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>운영시작시간(시2자리 분2자리)</label>
											<input class="form-control" name="start_time" id="start_time">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>운영종료시간(시2자리 분2자리)</label>
											<input class="form-control" name="end_time" id="end_time">
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>연락처</label>
											<input class="form-control" name="contact_tel" id="contact_tel">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>위치</label>
											<input class="form-control" name="location" id="location">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>주소</label>
											<input class="form-control" name="address" id="address">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>담당자명</label>
											<input class="form-control" name="manager_name" id="manager_name">
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>담당자연락처</label>
											<input class="form-control" name="manager_mobile" id="manager_mobile">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>이메일</label>
											<input class="form-control" name="site_email" id="site_email">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>상세내역</label>
											<input class="form-control" name="site_detail" id="site_detail">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>특이사항</label>
											<input class="form-control" name="site_special" id="site_special">
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
				$(location).attr('href',"/admin/show-site");
			});
			
			$('#start_time').attr('maxlength',4);
			$('#end_time').attr('maxlength',4);
			
	        $("#start_time").keyup(function (event) {

	            regexp = /[^0-9]/gi;

	            v = $(this).val();

	            if (regexp.test(v)) {

	                alert("숫자만 입력가능 합니다.\n-(하이픈)을 제외한 숫자만 입력하여 주세요.");

	                $(this).val(v.replace(regexp, ''));

	            }

	        });
	        
	        $("#end_time").keyup(function (event) {

	            regexp = /[^0-9]/gi;

	            v = $(this).val();

	            if (regexp.test(v)) {

	                alert("숫자만 입력가능 합니다.\n-(하이픈)을 제외한 숫자만 입력하여 주세요.");

	                $(this).val(v.replace(regexp, ''));

	            }

	        });
			
			$(".cwrite").on("click",function(){
				
			  error = '';
				
			  if( $('#site_id').val() == '' ) {
				  error = error + '- 사이트id는 필수항목입니다. \n';
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