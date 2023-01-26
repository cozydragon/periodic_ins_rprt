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
                    <h1 class="page-header">사용자 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	사용자 조회
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            
                            <div class="col-sm-10">
                           	<!-- 검색 옵션 들어갈 자리 -->
	                            <div id="dataTables-example_filter" class="dataTables_filter">
	                            	<select name="searchType">
	                            		<option value="n"
	                            			<c:out value="${cri.searchType == null? 'selected':''}"/>>검색 옵션</option>
	                            		<option value="user_id"
	                            			<c:out value="${cri.searchType eq 'user_id'? 'selected':''}"/>>사용자id</option>
	                            	</select>
	                            	<label> keyword > <input type="search" name="keyword" id="keywordInput" class="form-control input-sm" placeholder="${cri.keyword}" aria-controls="dataTables-example"></label>
	                            	<button class="btn btn-outline btn-info" id="searchBtn">검색</button>
	                           	</div>
                           	</div>
                            
                            
							<div class="row">
                           	<div class="col-sm-12">
                           		<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row">
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사용자id" style="width: 30px; text-align: center;">사용자id</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사용자명" style="width: 68px; text-align: center;">사용자명</th>
                                    	<!-- <th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="비밀번호" style="width: 40px; text-align: center;">비밀번호</th> -->
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="이메일" style="width: 40px; text-align: center;">이메일</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="권한id" style="width: 68px; text-align: center;">권한id</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="권한명" style="width: 68px; text-align: center;">권한명</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사이트id" style="width: 30px; text-align: center;">사이트id</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사이트명" style="width: 30px; text-align: center;">사이트명</th>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${list}" var="UserVO">
                                  	<tr role="row">
                                        <td style="text-align: center;">
                                        <a href="/admin/read-user${pageMaker.makeSearch(pageMaker.cri.page)}&user_id=${UserVO.user_id}">
                                        ${UserVO.user_id}</a></td>
                                        <td style="text-align: center;">${UserVO.user_name}</td>
                                       <!--  <td style="text-align: center;">${UserVO.password}</td> -->
                                        <td style="text-align: center;">${UserVO.email}</td>
                                        <td style="text-align: center;">${UserVO.role_id}</td>
                                        <td style="text-align: center;">${UserVO.role_name}</td>
                                        <td style="text-align: center;">${UserVO.site_id}</td>
                                        <td style="text-align: center;">${UserVO.site_name}</td>
                                    </tr>
                                </c:forEach>
                                 </tbody>
                            	</table>
                            </div>
                            </div>
							<div class="row">
	                         	<div class="col-sm-2">
	                         		<button type="button" class="btn btn-primary" id="write">사용자 등록</button>
	                         	</div>
	                         	
	                            <div class="col-sm-10">
		                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
		                            	<ul class="pagination">
		                            		<c:if test="${pageMaker.prev}">
			                            		<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
			                            			<%-- <a href="/?page=${pageMaker.startPage-1}">Previous</a> --%>
			                            			<a href="/admin/show-user/${pageMaker.makeSearch(pageMaker.startPage-1)}">Previous</a>
		                            			</li>
		                            		</c:if>
		                            		
		                            		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
			                            		<li class="paginate_button 
			                            					<c:out value="${pageMaker.cri.page == idx? 'active':''}"/>" aria-controls="dataTables-example" tabindex="0">
			                            						<%-- <a href="/?page=${idx}">${idx}</a> --%>
			                            						<a href="/admin/show-user/${pageMaker.makeSearch(idx)}">${idx}</a>
                           						</li>
		                            		</c:forEach>
		                            		
		                            		<c:if test="${pageMaker.next}">
			                            		<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
			                            			<%-- <a href="/?page=${pageMaker.endPage+1}">Next</a> --%>
			                            			<a href="/admin/show-user/${pageMaker.makeSearch(pageMaker.endPage+1)}">Next</a>
			                            		</li>
		                            		</c:if>
	                            		</ul>
	                          		</div>
	                         	</div>
	                         	
	                        </div>

                       	</div>
                       </div>
                        <!-- /.panel-body -->
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
		
	}
	
	$(document).ready(function(){
		$("#write").on("click",function(){
			$(location).attr('href',"/admin/write-user");
		});
		
		$("#searchBtn").on("click",function(){
			self.location = "/admin/show-user/"
				+'${pageMaker.makeQuery(1)}'
				+"&searchType="
				+$("select option:selected").val()
				+"&keyword="
				+$("#keywordInput").val();
		});


	});
	
	
	
	</script>

</body>

</html>