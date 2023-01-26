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
                    <h1 class="page-header">사용자</h1>
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
							<form role="form-group" method="post">
								<input type="hidden" name="user_id" value="${UserVO.user_id}">
								<input type="hidden" name="page" value="${cri.page}">
								<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
								<input type="hidden" name="searchType" value="${cri.searchType}">
								<input type="hidden" name="keyword" value="${cri.keyword}">
							
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>사용자id</label>
											<input class="form-control" name="user_id" id="user_id" disabled="disabled" value="${UserVO.user_id}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>사용자명</label>
											<input class="form-control" name="user_name" id="user_name" disabled="disabled" value="${UserVO.user_name}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>이메일</label>
											<input class="form-control" name="email" id="email" disabled="disabled" value="${UserVO.email}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>권한</label>
											<select class="form-control" name="role_id" id="role_id" disabled="disabled">
												<option value="">선택</option>
												<c:forEach var="code_role" items="${code_role}">
													<option value="<c:out value="${code_role.code}" />"
													<c:if test="${UserVO.role_id == code_role.code }">selected="selected"</c:if>>
														<c:out value="${code_role.code_name} (${code_role.code})"/>
													</option>
												</c:forEach>
											</select>
		                                </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
	                                        <label>사이트</label>
											<select class="form-control" name="site_id" id="site_id" disabled="disabled">
												<option value="">선택</option>
												<c:forEach var="code_site" items="${code_site}">
													<option value="<c:out value="${code_site.code}" />"
													<c:if test="${UserVO.site_id == code_site.code }">selected="selected"</c:if>>
														<c:out value="${code_site.code_name} (${code_site.code})"/>
													</option>
												</c:forEach>
											</select>
		                                </div>
									</div>
								</div>
                                
                                <button type="button" class="btn btn-primary clist">목록</button>
                                <button type="button" class="btn btn-success cmodify">수정</button>
                                <button type="button" class="btn btn-warning cdelete">삭제</button>
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
			
			$(".clist").on("click",function(){
				//$(location).attr('href',"/");
				formObj.attr("method","get");
				formObj.attr("action","/admin/show-user");
				formObj.submit();
			});
			
			$(".cmodify").on("click",function(){
				formObj.attr("method","get");
				formObj.attr("action","/admin/modify-user");
				formObj.submit();
				
			});

			$(".cdelete").on("click",function(){
				if(confirm("정말 삭제하시겠습니까?") == false){
					return;
				}
				formObj.attr("action","/admin/delete-user");
				formObj.submit();
			});

			
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