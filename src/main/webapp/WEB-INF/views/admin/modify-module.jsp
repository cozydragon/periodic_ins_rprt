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
											<label>모듈serial</label>
											<input class="form-control" name="module_serial" id="module_serial"  disabled="disabled"  value="${ModuleDTO.module_serial}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>사이트id</label>
											<select class="form-control" name="site_id" id="site_id">
												<option value="">선택</option>
												<c:forEach var="code_site" items="${code_site}">
													<option value="<c:out value="${code_site.code}" />"
													<c:if test="${ModuleDTO.site_id == code_site.code }">selected="selected"</c:if>>
														<c:out value="${code_site.code_name} (${code_site.code})"/>
													</option>
												</c:forEach>
											</select>
		                                </div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>serial명</label>
											<input class="form-control" name="serial_name" id="serial_name" value="${ModuleDTO.serial_name}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>모듈종류</label>
											<select class="form-control" name="module_variety" id="module_variety">
												<option value="">선택</option>
												<c:forEach var="code_module_variety" items="${code_module_variety}">
													<option value="<c:out value="${code_module_variety.code}" />"
													<c:if test="${ModuleDTO.module_variety == code_module_variety.code}">selected="selected"</c:if>>
														<c:out value="${code_module_variety.code_name}"/>
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>상세내역</label>
											<input class="form-control" name="detail" id="detail" value="${ModuleDTO.detail}">
										</div>
									</div>

									
								</div>
                                
                                <button type="button" class="btn btn-success cmodify">저장</button>
                                <button type="button" class="btn btn-warning ccancel">취소</button>
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
				
				$('#module_serial').removeAttr('disabled');
				formObj.attr("method","post");
				formObj.attr("action","/admin/modify-module");
				formObj.submit();
				
			});
			$(".ccancel").on("click",function(){
				self.location = "/admin/read-module?page=${cri.page}&perPageNum=${cri.perPageNum}&module_serial=${ModuleDTO.module_serial}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
			
		});
		
	</script>
	<script src="/resources/js/readPage.js"></script>

    
</body>

</html>