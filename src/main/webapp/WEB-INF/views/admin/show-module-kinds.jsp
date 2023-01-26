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
                    <h1 class="page-header">모듈 종류 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	모듈 종류 조회
                        </div>
                        <!-- /.panel-heading -->
                        <form id="form1" name="form1" >
                        
                        <div class="panel-body">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            
                            <div class="col-sm-12">
                           	<!-- 검색 옵션 들어갈 자리 -->
	                           	<button class="btn btn-outline btn-info" id="searchBtn">검색</button>
                           	</div>
                            
                            
							<div class="row">
                           	<div class="col-sm-12">
                           		<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row">
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈순번" style="width: 68px; text-align: center;">모듈순번</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈종류명" style="width: 68px; text-align: center;">모듈종류명</th>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${list}" var="ModuleVarietyDTO">
                                  	<tr role="row">
                                        <td style="text-align: center;"> <a href="/admin/modify-module-kinds${pageMaker.makeSearch(pageMaker.cri.page)}&module_variety=${ModuleVarietyDTO.module_variety}">
                                        ${ModuleVarietyDTO.module_variety}</a></td>
                                        <td style="text-align: center;"> <a href="/admin/modify-module-kinds${pageMaker.makeSearch(pageMaker.cri.page)}&module_variety=${ModuleVarietyDTO.module_variety}">
                                        ${ModuleVarietyDTO.variety_name}</a></td>
                                       

                                    </tr>
                                </c:forEach>
                                 </tbody>
                            	</table>
                            </div>
                            </div>
							<div class="row">
	                         	<div class="col-sm-2">
	                         		<button type="button" class="btn btn-primary" id="write">모듈 종류 등록</button>
	                         	</div>
	                         	
	                            <div class="col-sm-10">
		                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
		                            	<ul class="pagination">
		                            		<c:if test="${pageMaker.prev}">
			                            		<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
			                            			<%-- <a href="/?page=${pageMaker.startPage-1}">Previous</a> --%>
			                            			<a href="/admin/show-module-kinds/${pageMaker.makeSearch(pageMaker.startPage-1)}">Previous</a>
		                            			</li>
		                            		</c:if>
		                            		
		                            		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
			                            		<li class="paginate_button 
			                            					<c:out value="${pageMaker.cri.page == idx? 'active':''}"/>" aria-controls="dataTables-example" tabindex="0">
			                            						<%-- <a href="/?page=${idx}">${idx}</a> --%>
			                            						<a href="/admin/show-module-kinds/${pageMaker.makeQuery(idx)}">${idx}</a>
                           						</li>
		                            		</c:forEach>
		                            		
		                            		<c:if test="${pageMaker.next}">
			                            		<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
			                            			<%-- <a href="/?page=${pageMaker.endPage+1}">Next</a> --%>
			                            			<a href="/admin/show-module-kinds/${pageMaker.makeQuery(pageMaker.endPage+1)}">Next</a>
			                            		</li>
		                            		</c:if>
	                            		</ul>
	                          		</div>
	                         	</div>
	                         	
	                        </div>

                       	</div>
                       </div>
                        <!-- /.panel-body -->
                        
                        </form>
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
	
	var msg = '${result}';
	
	if ( msg =='SUCCESS'){
		alert('처리가 완료 되었습니다.');
		
	} else if ( msg =='FAIL'){
		alert('처리가 실패 되었습니다.');
	} else if ( msg == 'FailModuleIsInIt'){
		alert('모듈에 해당 종류가 등록되어 있어 삭제를 실패하였습니다.');
	}
	
	$(document).ready(function(){
		$("#write").on("click",function(){
			$(location).attr('href',"/admin/write-module-kinds");
		});
		
		$("#searchBtn").on("click",function(){
			
			self.location = "/admin/modify-module/"
				+'${pageMaker.makeQuery(1)}'
				;
			
		});


	});
	
	
	
	</script>

</body>

</html>