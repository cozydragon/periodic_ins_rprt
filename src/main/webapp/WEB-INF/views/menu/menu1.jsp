<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="../include/header.jsp" %>
</head>

<body style="overflow:hidden" scroll=no>

    <div id="container-fluid">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<%@ include file="../include/headNavMenu.jsp" %>

        </nav>
        
        <div class="row">

			<div class="col-md-2">
		             <%@ include file="../include/sidebarMenu1.jsp" %>
		             <!-- /.sidebar-collapse -->
		         <!-- /.navbar-static-side -->
			</div>
	
	
	       	<div id="page-content-wrapper">
	            <div class="container-fluid">
	                    <h1 class="page-header">수요조사 기초자료 관리</h1>
	          	

	                        <!-- /.panel-heading -->
	                       	<form role="form-group" method="post">
									<input type="hidden" name="module_serial" value="${ModuleDTO.module_serial}">
									<input type="hidden" name="page" value="${cri.page}">
									<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
									<input type="hidden" name="searchType" value="${cri.searchType}">
									<input type="hidden" name="keyword" value="${cri.keyword}">
								
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label>모듈serial</label>
												<input class="form-control" name="module_serial" id="module_serial"  value="${ModuleDTO.module_serial}">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
		                                        <label>사이트id</label>
												<select class="form-control" name="site_id" id="site_id" >
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
												<input class="form-control" name="serial_name" id="serial_name"  value="${ModuleDTO.serial_name}">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
		                                        <label>모듈종류</label>
												<select class="form-control" name="module_variety" id="module_variety"  >
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
									
										<div class="col-sm-3">
											<div class="form-group">
												<label>상세내역</label>
												<input class="form-control" name="detail" id="detail"  value="${ModuleDTO.detail}">
											</div>
										</div>
										<div class="col-sm-3">
		                                <button type="button" class="btn btn-primary clist">목록</button>
		                                <button type="button" class="btn btn-success cmodify">수정</button>
		                                <button type="button" class="btn btn-warning cdelete">삭제</button>
										</div>
									</div>
	                                
								</form> 
	   
	            	</div>
            	</div>
         </div>
	</div>


</body>

</html>
