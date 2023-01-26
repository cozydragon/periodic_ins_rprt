<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="./include/header.jsp" %>
</head>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">

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
							<form role="form-group" action="/write" method="post">
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title" id="title">
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>작성자</label>
											<input class="form-control" name="writer">
										</div>
									</div>
									<div class="col-sm-6">
										<!-- <div class="form-group">
											<label>작성일</label>
											<input type="datetime-local" class="form-control" name="regdate">
										</div> -->
									</div>
								</div>
								<div class="form-group">
                                        <label>내용</label>
                                        <textarea class="form-control" rows="10" name="contents"></textarea>
                                </div>
                                
                                <button type="button" class="btn btn-primary clist">목록</button>
                                <button type="button" class="btn btn-success cwrite">글 작성</button>
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
	<%@ include file="./include/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".clist").on("click",function(){
				$(location).attr('href',"/");
			});
			$(".cwrite").on("click",function(){
				
				  error = '';
				  if( $('#title').val() == '' ) {
					  error = error + '- 제목은 필수항목입니다. \n';
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