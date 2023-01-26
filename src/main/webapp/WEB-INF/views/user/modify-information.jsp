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
                         	사용자 수정
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
							<form role="form-group" method="post">
								<input type="hidden" name="page" value="${cri.page}">
								<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
								<input type="hidden" name="searchType" value="${cri.searchType}">
								<input type="hidden" name="keyword" value="${cri.keyword}">
								<input type="hidden" id="pw_change" name="pw_change">
							
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>사용자id</label>
											<input class="form-control" maxlength="20" name="user_id" id="user_id" value="${UserVO.user_id}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>사용자명</label>
											<input class="form-control" maxlength="40" name="user_name" id="user_name" value="${UserVO.user_name}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>이메일</label>
											<input class="form-control" maxlength="40" name="email" id="email" value="${UserVO.email}">
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
									<div class="col-sm-1">
			                            <div class="form-group">
			                               <label>비밀번호변경</label>		                                        
			                               <input name="pw_change_yn" id="pw_change_yn" type="checkbox">
			                            </div>											
									</div>
									<div id="pw_group" name="pw_group">
										<div class="col-sm-2">
											<div class="form-group">
												<label>기존비밀번호</label>
												<input class="form-control" maxlength="20" placeholder="기존비밀번호" type="password" name="password_before" id="password_before">
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>수정비밀번호</label>
												<input class="form-control" maxlength="20"  placeholder="수정비밀번호" type="password" name="password" id="password">
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>비밀번호확인</label>
												<input class="form-control" maxlength="20" placeholder="비밀번호확인" type="password" name="password_confirm" id="password_confirm">
											</div>
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
				
			}else if (msg == 'FALSE_PASSWORD'){
				alert('기존 패스워드가 틀렸습니다.');
				$('#pw_change_yn').attr("checked",true);
			}else if (msg == 'DIFFERENT_PASSWORD'){
				alert('수정비밀번호와 비밀번호확인 내역이 다릅니다.');
				$('#pw_change_yn').attr("checked",true);
			}
			
			var formObj = $("form[role='form-group']");
			
			pw_show();
			
			$(".cmodify").on("click",function(){
				
				$("#site_id").removeAttr("disabled");
				$("#role_id").removeAttr("disabled");
				
				formObj.attr("method","post");
				formObj.attr("action","/user/modify-information");
				formObj.submit();
				
			});
			$(".ccancel").on("click",function(){
				/* formObj.attr("method","get");
				formObj.attr("action","/read");
				formObj.submit(); */
				
				self.location = "/user/read-information?page=${cri.page}&perPageNum=${cri.perPageNum}&user_id=${UserVO.user_id}&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
			$("#pw_change_yn").on("click",function(){
				pw_show();
			});
			
			
			
		});
		
		function pw_show() {			
					
					if( $("#pw_change_yn").is(":checked")) {
						$('#pw_change').val(true);
						$('#pw_group').show();
					}else {
						$('#pw_change').val(false);
						$('#pw_group').hide();
						
					}
		}
	</script>
	<script src="/resources/js/readPage.js"></script>

    
</body>

</html>