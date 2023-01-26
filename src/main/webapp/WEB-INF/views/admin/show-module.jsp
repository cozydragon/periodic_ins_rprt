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
                    <h1 class="page-header">모듈 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	모듈 조회
                        </div>
                        <!-- /.panel-heading -->
                        <form id="form1" name="form1" >
                        
                        <div class="panel-body">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            
                            <div class="col-sm-12">
                           	<!-- 검색 옵션 들어갈 자리 -->
                                <label>사이트</label>
								<select class="form-control" name="site_id" id="site_id">
									<option value="">선택</option>
									<c:forEach var="code_site" items="${code_site}">
										<option value="<c:out value="${code_site.code}" />"
										<c:if test="${param.site_id eq code_site.code }">selected="selected"</c:if>>
											<c:out value="${code_site.code_name} (${code_site.code})"/>
										</option>
									</c:forEach>
								</select>
                            	<label> 모듈serial</label>
                             	<input type="search" name="module_serial" id="module_serial" class="form-control input-sm" value="${param.module_serial}">
	                           	<button class="btn btn-outline btn-info" id="searchBtn">검색</button>
                           	</div>
                            
                            
							<div class="row">
                           	<div class="col-sm-12">
                           		<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row">
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사이트명" style="width: 68px; text-align: center;">사이트명</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈serial" style="width: 30px; text-align: center;">모듈serial</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="serial명" style="width: 40px; text-align: center;">serial명</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="상세내역" style="width: 68px; text-align: center;">상세내역</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈종류" style="width: 68px; text-align: center;">모듈종류</th>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${list}" var="ModuleDTO">
                                  	<tr role="row">
										<td style="text-align: center;">${ModuleDTO.site_name}</td>
                                        <td style="text-align: center;">
                                        <a href="/admin/read-module${pageMaker.makeSearch(pageMaker.cri.page)}&module_serial=${ModuleDTO.module_serial}">
                                        ${ModuleDTO.module_serial}</a></td>
                                        <td style="text-align: center;">${ModuleDTO.serial_name}</td>
                                        <td style="text-align: center;">${ModuleDTO.detail}</td>
                                        <td style="text-align: center;">${ModuleDTO.variety_name}</td>
                                    </tr>
                                </c:forEach>
                                 </tbody>
                            	</table>
                            </div>
                            </div>
							<div class="row">
	                         	<div class="col-sm-2">
	                         		<button type="button" class="btn btn-primary" id="write">모듈 등록</button>
	                         	</div>
	                         	
	                            <div class="col-sm-10">
		                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
		                            	<ul class="pagination">
		                            		<c:if test="${pageMaker.prev}">
			                            		<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
			                            			<%-- <a href="/?page=${pageMaker.startPage-1}">Previous</a> --%>
			                            			<a href="/admin/show-module/${pageMaker.makeSearch(pageMaker.startPage-1)}&site_id=${param.site_id}&module_serial=${param.module_serial}">Previous</a>
		                            			</li>
		                            		</c:if>
		                            		
		                            		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
			                            		<li class="paginate_button 
			                            					<c:out value="${pageMaker.cri.page == idx? 'active':''}"/>" aria-controls="dataTables-example" tabindex="0">
			                            						<%-- <a href="/?page=${idx}">${idx}</a> --%>
			                            						<a href="/admin/show-module/${pageMaker.makeQuery(idx)}&site_id=${param.site_id}&module_serial=${param.module_serial}">${idx}</a>
                           						</li>
		                            		</c:forEach>
		                            		
		                            		<c:if test="${pageMaker.next}">
			                            		<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
			                            			<%-- <a href="/?page=${pageMaker.endPage+1}">Next</a> --%>
			                            			<a href="/admin/show-module/${pageMaker.makeQuery(pageMaker.endPage+1)}&site_id=${param.site_id}&module_serial=${param.module_serial}">Next</a>
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
	
	if( msg =='SUCCESS'){
		alert('처리가 완료 되었습니다.');
		
	}else if ( msg =='FailCodeIsInIt') {
		alert('해당 모듈로 등록된 자료가 있어 삭제하지 못했습니다.');
	}
	
	$(document).ready(function(){
		$("#write").on("click",function(){
			$(location).attr('href',"/admin/write-module");
		});
		
		$("#searchBtn").on("click",function(){
			
			self.location = "/admin/show-module/"
				+'${pageMaker.makeQuery(1)}'
				;
			
		});


	});
	
	
	
	</script>

</body>

</html>