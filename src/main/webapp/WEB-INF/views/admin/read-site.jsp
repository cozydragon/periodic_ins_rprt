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
                         	사이트 조회
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
											<input class="form-control" name="site_id" id="site_id" disabled="disabled" value="${SiteDTO.site_id}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>사이트명</label>
											<input class="form-control" name="site_name" id="site_name" disabled="disabled" value="${SiteDTO.site_name}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>운영시작시간(시2자리 분2자리)</label>
											<input class="form-control" name="start_time" id="start_time" disabled="disabled" value="${SiteDTO.start_time}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>운영종료시간(시2자리 분2자리)</label>
											<input class="form-control" name="end_time" id="end_time" disabled="disabled" value="${SiteDTO.end_time}">
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>연락처</label>
											<input class="form-control" name="contact_tel" id="contact_tel" disabled="disabled" value="${SiteDTO.contact_tel}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>위치</label>
											<input class="form-control" name="location" id="location" disabled="disabled" value="${SiteDTO.location}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>주소</label>
											<input class="form-control" name="address" id="address" disabled="disabled" value="${SiteDTO.address}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>담당자명</label>
											<input class="form-control" name="manager_name" id="manager_name" disabled="disabled" value="${SiteDTO.manager_name}">
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>담당자연락처</label>
											<input class="form-control" name="manager_mobile" id="manager_mobile" disabled="disabled"  value="${SiteDTO.manager_mobile}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>이메일</label>
											<input class="form-control" name="site_email" id="site_email" disabled="disabled"  value="${SiteDTO.site_email}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>상세내역</label>
											<input class="form-control" name="site_detail" id="site_detail" disabled="disabled"  value="${SiteDTO.site_detail}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>특이사항</label>
											<input class="form-control" name="site_special" id="site_special" disabled="disabled"  value="${SiteDTO.site_special}">
										</div>
									</div>
								</div>
                                
                                <button type="button" class="btn btn-primary clist">목록</button>
                                <button type="button" class="btn btn-success cmodify">수정</button>
                                <%-- <button type="button" class="btn btn-warning cdelete">삭제</button>  --%>
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
			
			var formObj = $("form[role='form-group']");
			
			$('#start_time').attr('maxlength',4);
			$('#end_time').attr('maxlength',4);

			
			$(".clist").on("click",function(){
				//$(location).attr('href',"/");
				formObj.attr("method","get");
				formObj.attr("action","/admin/show-site");
				formObj.submit();
			});
			
			$(".cmodify").on("click",function(){
				formObj.attr("method","get");
				formObj.attr("action","/admin/modify-site");
				formObj.submit();
				
			});

			<%--$(".cdelete").on("click",function(){
				if(confirm("정말 삭제하시겠습니까?") == false){
					return;
				}
				formObj.attr("action","/admin/delete-site");
				formObj.submit();
			});
			--%>

			
		});
	</script>
	<script src="/resources/js/readPage.js"></script>
	<!-- Reply Modal -->
    <div class="modal fade" id="myModalLabel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3 class="modal-title"></h3>
                    
                </div>
                <div class="modal-body">
                    <p><textarea class="form-control" rows="3" id="modalReplyText"></textarea></p>
                </div>
                <div class="modal-footer">
                    <button class="btn-default" data-dismiss="modal">닫기</button>
                    <button class="btn-danger reply" data-dismiss="modal" id="replyDelBtn">삭제</button>
                    <button class="btn-info" data-dismiss="modal" id="replyModBtn">수정</button>
                </div>
            </div>
        </div>
    </div>
    
</body>

</html>