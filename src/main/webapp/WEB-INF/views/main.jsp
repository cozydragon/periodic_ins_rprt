<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="./include/header.jsp" %>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<%@ include file="./include/headNav.jsp" %>

            <div class="navbar-default sidebar" role="navigation">
                <%@ include file="./include/sidebar.jsp" %>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">기본 게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	기본 게시판
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
			                            		<option value="t"
			                            			<c:out value="${cri.searchType eq 't'? 'selected':''}"/>>제목</option>
			                            		<option value="c"
			                            			<c:out value="${cri.searchType eq 'c'? 'selected':''}"/>>내용</option>
			                            		<option value="w"
			                            			<c:out value="${cri.searchType eq 'w'? 'selected':''}"/>>작성자</option>
			                            	</select>
			                            	<label> keyword > <input type="search" name="keyword" id="keywordInput" maxlength="20" class="form-control input-sm" placeholder="${cri.keyword}" aria-controls="dataTables-example"></label>
			                            	<button class="btn btn-outline btn-info" id="searchBtn">검색</button>
			                           	</div>
		                           	</div>
	                           	</div>
	                           	<div class="row">
		                           	<div class="col-sm-12"><table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
		                                <thead>
		                                    <tr role="row">
		                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="번호" style="width: 68px; text-align: center;">번호</th>
		                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="제목" style="width: 195px; text-align: center;">제목</th>
		                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사용자id" style="width: 101px; text-align: center;">사용자id</th>
		                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="작성자" style="width: 101px; text-align: center;">작성자</th>
		                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="등록일" style="width: 151px; text-align: center;">등록일</th>
		                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="조회수" style="width: 72px; text-align: center;">조회수</th>
											</tr>
		                                </thead>
		                                <tbody>
		                                
		                                <c:forEach items="${list}" var="boardVO">
		                                  	<tr role="row">
		                                        <td style="text-align: center;">${boardVO.bno}</td>
			                                        <c:choose>
			                                        	<c:when  test="${fn:length(boardVO.title)>30}">
			                                        		<%-- <td><a href="/read?bno=${boardVO.bno}"><c:out value="${fn:substring(boardVO.title,0,12)}"/>...</a></td> --%>
			                                        		<td><a href="/read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}"><c:out value="${fn:substring(boardVO.title,0,30)}"/>...</a></td>
			                                        	</c:when>
			                                        	<c:otherwise>
					                                        <%-- <td><a href="/read?bno=${boardVO.bno}">${boardVO.title}</a></td> --%>
					                                        <td><a href="/read${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}">${boardVO.title}</a></td>
			                                        	</c:otherwise>
			                                        </c:choose>
		                                        <td style="text-align: center;">${boardVO.user_id}</td>
		                                        <td style="text-align: center;">${boardVO.writer}</td>
		                                        <td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}"/></td>
		                                        <td style="text-align: center;">${boardVO.viewcnt}</td>
		                                    </tr>
		                                </c:forEach>
		                                 </tbody>
		                            </table>
		                            </div>
	                            </div>

	                            <div class="row">
		                         	<div class="col-sm-2">
		                         		<button type="button" class="btn btn-primary" id="write">글 작성</button>
		                         	</div>
		                            <div class="col-sm-10">
			                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
			                            	<ul class="pagination">
			                            		<c:if test="${pageMaker.prev}">
				                            		<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
				                            			<%-- <a href="/?page=${pageMaker.startPage-1}">Previous</a> --%>
				                            			<a href="/${pageMaker.makeSearch(pageMaker.startPage-1)}">Previous</a>
			                            			</li>
			                            		</c:if>
			                            		
			                            		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" step="1">
				                            		<li class="paginate_button 
				                            					<c:out value="${pageMaker.cri.page == idx? 'active':''}"/>" aria-controls="dataTables-example" tabindex="0">
				                            						<%-- <a href="/?page=${idx}">${idx}</a> --%>
				                            						<a href="/${pageMaker.makeSearch(idx)}">${idx}</a>
	                           						</li>
			                            		</c:forEach>
			                            		
			                            		<c:if test="${pageMaker.next}">
				                            		<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
				                            			<%-- <a href="/?page=${pageMaker.endPage+1}">Next</a> --%>
				                            			<a href="/${pageMaker.makeSearch(pageMaker.endPage+1)}">Next</a>
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
	<%@ include file="./include/footer.jsp" %>
	<script type="text/javascript">
	
	var msg = '${result}';
	
	if( msg =='SUCCESS'){
		alert('처리가 완료 되었습니다.');
	}
	
	$(document).ready(function(){
		$("#write").on("click",function(){
			$(location).attr('href',"/write");
		});
		$("#searchBtn").on("click",function(){
			self.location = "/"
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