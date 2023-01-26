<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                         	글 쓰기
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
							<form role="form-group" method="post">
								<input type="hidden" name="bno" value="${boardVO.bno}">
								<input type="hidden" name="page" value="${cri.page}">
								<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
								<input type="hidden" name="searchType" value="${cri.searchType}">
								<input type="hidden" name="keyword" value="${cri.keyword}">
								
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title" id="title" value="${boardVO.title}">
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>사용자id</label>
											<input class="form-control" name="user_id" value="${boardVO.user_id}" readonly="readonly">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>작성자</label>
											<input class="form-control" name="writer" value="${boardVO.writer}" readonly="readonly">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>작성일</label>
											<input class="form-control" name="regdate" value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${boardVO.regdate}"/>" disabled="disabled">
										</div>
									</div>
								</div>
								<div class="form-group">
                                        <label>내용</label>
                                        <textarea class="form-control" rows="10" name="contents">${boardVO.contents}</textarea>
                                </div>
                                
                                <button type="button" class="btn btn-success cmodify">글 저장</button>
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
	<%@ include file="./include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			var formObj = $("form[role='form-group']");
			
			$(".cmodify").on("click",function(){
				
				formObj.attr("method","post");
				formObj.attr("action","/modify");
				formObj.submit();
				
			});
			$(".ccancel").on("click",function(){
				/* formObj.attr("method","get");
				formObj.attr("action","/read");
				formObj.submit(); */
				
				self.location = "/read?page=${cri.page}&perPageNum=${cri.perPageNum}&bno=${boardVO.bno}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
		});
	</script>
</body>

</html>