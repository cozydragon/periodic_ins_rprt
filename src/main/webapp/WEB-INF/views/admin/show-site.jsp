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
                    <h1 class="page-header">사이트 관리</h1>
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
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row">
									<div class="col-sm-10">
									<!-- 검색 옵션 들어갈 자리 -->
										<div id="dataTables-example_filter" class="dataTables_filter">
											<select name="searchType">
												<option value="n"
													<c:out value="${cri.searchType == null? 'selected':''}"/>>검색 옵션</option>
												<option value="site_id"
													<c:out value="${cri.searchType eq 'site_id'? 'selected':''}"/>>사이트id</option>
												<option value="site_name"
													<c:out value="${cri.searchType eq 'site_name'? 'selected':''}"/>>사이트명</option>
												<option value="location"
													<c:out value="${cri.searchType eq 'location'? 'selected':''}"/>>위치</option>
												<option value="manager_name"
													<c:out value="${cri.searchType eq 'manager_name'? 'selected':''}"/>>담당자명</option>
											</select>
											<label> keyword > <input type="search" name="keyword" id="keywordInput" class="form-control input-sm" placeholder="${cri.keyword}" aria-controls="dataTables-example"></label>
											<button class="btn btn-outline btn-info" id="searchBtn">검색</button>
										</div>
									</div>
								</div>
                            
								<div class="row">
									<div class="col-sm-12">
										<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%; table-layout:fixed;">
											<thead>
												<tr role="row">
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사이트id" style="width: 30px; text-align: center;">사이트id</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사이트명" style="width: 40px; text-align: center;">사이트명</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="운영시작시간" style="width: 25px; text-align: center;">운영시작시간</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="운영종료시간" style="width: 25px; text-align: center;">운영종료시간</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="위치" style="width: 20px; text-align: center;">위치</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="연락처" style="width: 30px; text-align: center;">연락처</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="email" style="width: 40px; text-align: center;">email</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="담당자명" style="width: 25px; text-align: center;">담당자명</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="담당자연락처" style="width: 30px; text-align: center;">담당자연락처</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="상세내역" style="width: 50px; text-align: center;">상세내역</th>
													<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="특이사항" style="width: 50px; text-align: center;">특이사항</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${list}" var="SiteDTO">
													<tr role="row">
														<td style="text-align: center;">
														<a href="/admin/read-site${pageMaker.makeSearch(pageMaker.cri.page)}&site_id=${SiteDTO.site_id}">
														${SiteDTO.site_id}</a></td>
														<td style="text-align: center;">${SiteDTO.site_name}</td>
														<td style="text-align: center;">${SiteDTO.start_time}</td>
														<td style="text-align: center;">${SiteDTO.end_time}</td>
														<td style="text-align: center;">${SiteDTO.location}</td>
														<td style="text-align: center;">${SiteDTO.contact_tel}</td>
														<td style="text-align: center;">${SiteDTO.site_email}</td>
														<td style="text-align: center;">${SiteDTO.manager_name}</td>
														<td style="text-align: center;">${SiteDTO.manager_mobile}</td>
														<td style="text-align: center;">${SiteDTO.site_detail}</td>
														<td style="text-align: center;">${SiteDTO.site_special}</td>
													</tr>
												</c:forEach>
											 </tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-2">
										<button type="button" class="btn btn-primary" id="write">사이트 등록</button>
									</div>

									<div class="col-sm-10">
										<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
											<ul class="pagination">
												<c:if test="${pageMaker.prev}">
													<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
														<%-- <a href="/?page=${pageMaker.startPage-1}">Previous</a> --%>
														<a href="/admin/show-site/${pageMaker.makeSearch(pageMaker.startPage-1)}">Previous</a>
													</li>
												</c:if>

												<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
													<li class="paginate_button
																<c:out value="${pageMaker.cri.page == idx? 'active':''}"/>" aria-controls="dataTables-example" tabindex="0">
																	<%-- <a href="/?page=${idx}">${idx}</a> --%>
																	<a href="/admin/show-site/${pageMaker.makeSearch(idx)}">${idx}</a>
													</li>
												</c:forEach>

												<c:if test="${pageMaker.next}">
													<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
														<%-- <a href="/?page=${pageMaker.endPage+1}">Next</a> --%>
														<a href="/admin/show-site/${pageMaker.makeSearch(pageMaker.endPage+1)}">Next</a>
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
			$(location).attr('href',"/admin/write-site");
		});
		
		$("#searchBtn").on("click",function(){
			self.location = "/admin/show-site/"
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