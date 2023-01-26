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
                    <h1 class="page-header">모듈 등록</h1>
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
							<form role="form-group" action="/admin/write-module" method="post">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>모듈serial</label>
											<input class="form-control" name="module_serial" id="module_serial" value="${ModuleDTO.module_serial}">
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
				$(location).attr('href',"/admin/show-module");
			});
			
			$(".cwrite").on("click",function(){
				
			  error = '';
				
  			  if( $('#module_serial').val() == '' ) {
				 error = error + '- 모듈serial은 필수항목입니다. \n';
				 $('#module_serial').focus();
			  }
			  if ($('#site_id').val() == "") {
				 if (error == ''){
					 $('#site_id').focus();
				 }
				 error = error + '- 사이트id를 선택하여 주십시오. \n';
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