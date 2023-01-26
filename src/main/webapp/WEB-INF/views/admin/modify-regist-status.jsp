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
							<form role="form-group" method="post">
								<input type="hidden" name="page" value="${cri.page}">
								<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
								<input type="hidden" name="searchType" value="${cri.searchType}">
								<input type="hidden" name="keyword" value="${cri.keyword}">
							
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>코드</label>
											<input class="form-control" name="code" id="code"  disabled="disabled"  value="${RegistStatusDTO.code}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>HEX코드</label>
											<input class="form-control" name="code_hex" id="code_hex"  value="${RegistStatusDTO.code_hex}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>코드명</label>
											<input class="form-control" name="code_nm" id="code_nm"  value="${RegistStatusDTO.code_nm}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>코드메시지</label>
											<input class="form-control" name="code_message" id="code_message"  value="${RegistStatusDTO.code_message}">
										</div>
									</div>
								</div>
                                <button type="button" class="btn btn-success cmodify">저장</button>
                                <button type="button" class="btn btn-success cdelete">삭제</button>
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
			
			var msg = '${result}';
			
			if( msg =='SUCCESS'){
				alert('처리가 완료 되었습니다.');
				
			}
			
			var formObj = $("form[role='form-group']");
			
			$(".cmodify").on("click",function(){
				
				
				if ($('#site_id').val() == "") {
					alert("사이트id를 선택하여 주십시오.");
					$('#site_id').focus();
					return;
				}
				$('#code').removeAttr('disabled');

				formObj.attr("method","post");
				formObj.attr("action","/admin/modify-regist-status");
				formObj.submit();
				
			});
			$(".clist").on("click",function(){
				self.location = "/admin/show-regist-status?page=${cri.page}&perPageNum=${cri.perPageNum}&code=${RegistStatusDTO.code}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
			
			$(".cdelete").on("click",function(){
				if (confirm("정말 삭제하시겠습니까?")){
					$('#code').removeAttr('disabled');

					formObj.attr("method","post");
					formObj.attr("action","/admin/delete-regist-status");
					formObj.submit();
				
				}else {
					return;
				}
				
			});
			
		});
		
	</script>
	<script src="/resources/js/readPage.js"></script>

    
</body>

</html>