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
                    <h1 class="page-header">사이트</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	사이트 수정
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
							<form role="form-group" method="post">
									<input type="hidden" name="site_id" value="${SiteDTO.site_id}">
								<input type="hidden" name="page" value="${cri.page}">
								<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
								<input type="hidden" name="searchType" value="${cri.searchType}">
								<input type="hidden" name="keyword" value="${cri.keyword}">
							
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>사이트id</label>
											<input class="form-control" name="site_id" id="site_id" maxlength="20" disabled="disabled" value="${SiteDTO.site_id}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>사이트명</label>
											<input class="form-control" name="site_name" id="site_name" maxlength="40" value="${SiteDTO.site_name}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>운영시작시간(시2자리 분2자리)</label>
											<input class="form-control" name="start_time" id="start_time" maxlength="4" value="${SiteDTO.start_time}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>운영종료시간(시2자리 분2자리)</label>
											<input class="form-control" name="end_time" id="end_time" maxlength="4" value="${SiteDTO.end_time}">
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>연락처</label>
											<input class="form-control" name="contact_tel" id="contact_tel" maxlength="20" value="${SiteDTO.contact_tel}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>위치</label>
											<input class="form-control" name="location" id="location" maxlength="40" value="${SiteDTO.location}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>주소</label>
											<input class="form-control" name="address" id="address" maxlength="100" value="${SiteDTO.address}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>담당자명</label>
											<input class="form-control" name="manager_name" id="manager_name" maxlength="40" value="${SiteDTO.manager_name}">
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>담당자연락처</label>
											<input class="form-control" name="manager_mobile" id="manager_mobile" maxlength="20"  value="${SiteDTO.manager_mobile}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>이메일</label>
											<input class="form-control" name="site_email" id="site_email"  maxlength="20" value="${SiteDTO.site_email}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>상세내역</label>
											<input class="form-control" name="site_detail" id="site_detail" maxlength="200"   value="${SiteDTO.site_detail}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>특이사항</label>
											<input class="form-control" name="site_special" id="site_special" maxlength="200"  value="${SiteDTO.site_special}">
										</div>
									</div>
								</div>
                                
                                <button type="button" class="btn btn-success cmodify">저장</button>
                                <button type="button" class="btn btn-warning ccancel">취소</button>
							</form> 
                       </div>
                        <!-- /.panel-body -->
                        
                        <!-- 리플영역 -->
                        
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
			
			var formObj = $("form[role='form-group']");
			
			//$('#start_time').attr('maxlength',4);
			//$('#end_time').attr('maxlength',4);
			
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

			
			$(".cmodify").on("click",function(){
				formObj.attr("method","post");
				formObj.attr("action","/admin/modify-site");
				formObj.submit();
				
			});
			$(".ccancel").on("click",function(){
				/* formObj.attr("method","get");
				formObj.attr("action","/read");
				formObj.submit(); */
				
				self.location = "/admin/read-site?page=${cri.page}&perPageNum=${cri.perPageNum}&site_id=${SiteDTO.site_id}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
		});
	</script>
</body>

</html>