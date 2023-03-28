<%@page import="com.api.reporting.cmn.dto.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%BoardVO boardVo = (BoardVO) request.getAttribute("boardVO"); %>
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
                         	게시글 조회
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
									<input class="form-control" name="title" value="${boardVO.title}" disabled="disabled">
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>사용자id</label>
											<input class="form-control" name="user_id" value="${boardVO.user_id}" disabled="disabled">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>작성자</label>
											<input class="form-control" name="writer" value="${boardVO.writer}" disabled="disabled">
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
                                        <textarea class="form-control" rows="10" name="contents" disabled="disabled">${boardVO.contents}</textarea>
                                </div>
                                
                                <button type="button" class="btn btn-primary clist">목록</button>
                                <%if (userVO.getUser_id().equals(boardVo.getUser_id()) || authrt_id.equals("ADMIN") ) { %>
                                <button type="button" class="btn btn-success cmodify">글 수정</button>
                                <button type="button" class="btn btn-warning cdelete">삭제</button>
                                <%} %>
							</form> 
                       </div>
                        <!-- /.panel-body -->
                        
                        <div class="panel-body">
                        	<!-- 댓글 작성 영역 -->
                        	<div class="box-content wreply">
                        		<form role='reply'>
                        			<input type="hidden" name="bno" value="${boardVO.bno}">
				                    <div class="form-group">
				                        <label for="newReplyWriter">Writer</label>
				                        <input type="text" class="form-control" id="newReplyWriter" placeholder="Replyer">
				                    </div>
				                    <div class="form-group">
				                        <label for="newReplyText">ReplyText</label>
				                        <textarea class="form-control" rows="3" id="newReplyText"></textarea>
				                    </div>
				                    
				                    <button type="submit" class="btn-success" id="replyAddBtn">댓글 작성</button>
			                    </form>
				            </div>
                        </div>

                    </div>
                    <!-- /.panel -->
                    
                                            <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> 댓글 리스트
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                            	<li style="display:none;" id="repliesDiv"></li>
                                <%-- <li class="
                                			<c:out value="${(rno%2) == 0 ? 'timeline-inverted': ''}"/>">
                                    <div class="timeline-badge info"><i class="fa fa-comment-o"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">리플 타이틀자리</h4>
                                            <p>
                                            	<small class="text-muted">
                                            		<i class="fa fa-clock-o"></i> 11 hours ago via Twitter
                                           		</small>
                                           	</p>
                                        </div>
                                        <div class="timeline-body">
											<textarea class="form-control" rows="3" id="newReplyText" readonly="readonly">댓글내용</textarea>
										<hr>
		                                	<button type="button" class="btn btn-success rmodal" data-toggle="modal" data-target="#myModalLabel">댓글 수정 모달</button>
                                        </div>
                                    </div>
                                </li> --%>
                            </ul>

	                        <!-- 리플 페이징 -->
	                        <div class="text-center">
	                        	<ul id="pagination" class="pagination pagination-sm no-margin">
	                        	</ul>
	                        </div>

                        </div>
                        
                        <!-- /.panel-body -->
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="template" type="text/x-handlebars-template">
					{{#each .}}
                                <li class="replyLi" data-rno="{{rno}}">
                                    <div class="timeline-badge info"><i class="fa fa-comment-o"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title"><strong>{{rno}}</strong> -{{replyer}}</h4>
                                            <p>
                                            	<small class="text-muted">
                                            		<i class="fa fa-clock-o"></i> {{preettifyDate regdate}}
                                           		</small>
                                           	</p>
                                        </div>
                                        <div class="timeline-body">
											<textarea class="form-control" rows="3" id="newReplyText" readonly="readonly">{{reply}}</textarea>
										<hr>
		                                	<button type="button" class="btn btn-success rmodal" data-toggle="modal" data-target="#myModalLabel">Modify</button>
                                        </div>
                                    </div>
                                </li>
					{{/each}}
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			var bno = '${boardVO.bno}';
			var replyPage = 1;
			
			var formObj = $("form[role='form-group']");
			
			var replyObj = $("form[role='reply']");
			
			var replyCount = '${rcount}';

			if(replyCount > 0){
				getPage("/reply/"+bno+"/1");
				
				$(".timeline li:nth-child(2n)").addClass("timeline-inverted");
			}
			
			$(".pagination").on("click","li a",function(evnet){
				event.preventDefault();
				
				replyPage = $(this).attr("href");
				
				getPage("/reply/"+bno+"/"+replyPage);
				
				$(".timeline li:nth-child(2n)").addClass("timeline-inverted");
			});
			
			$(".timeline").on("click",".replyLi",function(event){
				var reply = $(this);
				
				$("#modalReplyText").val(reply.find('#newReplyText').text());
				$(".modal-title").html(reply.attr("data-rno"));
				
			});
			
			$(".clist").on("click",function(){
				//$(location).attr('href',"/");
				formObj.attr("method","get");
				formObj.attr("action","/");
				formObj.submit();
			});
			$(".cmodify").on("click",function(){
				formObj.attr("method","get");
				formObj.attr("action","/modify");
				formObj.submit();
				
			});
			$(".cdelete").on("click",function(){
				formObj.attr("action","/delete");
				formObj.submit();
			});
			$("#replyAddBtn").on("click",function(){
				var replyerObj = $("#newReplyWriter");
				var replytextObj = $("#newReplyText");
				
				var replyer = replyerObj.val();
				var replytext = replytextObj.val();
				
				
				error = '';
				
				if (replytext == '') {
				  error = error + '- 내용은 필수항목입니다. \n';
				}

				
				if(error != ''){
	
					alert(error);
	
					error = '';
	
					return false;
	
				 }
				
				
				$.ajax({
					type:'post',
					url:'/reply',
					headers:{"Content-Type" : "application/json"},
					data:JSON.stringify({bno:bno, replyer:replyer, reply:replytext}),
					dataType:'text',
					async: false,
					success:function(result){
						if(result == 'SUCCESS'){
							alert("댓글이 등록 되었습니다.");
							replyPage = 1;
							getPage("/reply/"+bno+"/"+replyPage);
							replyerObj.val("");
							replyTextObj.val("");
						}
					}
				});				
			});
			
			$("#replyModBtn").on("click",function(){
				var rno = $(".modal-title").html();
				var replytext = $("#modalReplyText").val();
				
				$.ajax({
					type:'post',
					url:'/reply/'+rno,
					headers:{"Content-Type":"application/json"},
					data:JSON.stringify({rno:rno, reply:replytext}),
					dataType:'text',
					success:function(result){
						console.log("result: "+ result);
						if(result == 'SUCCESS'){
							alert("댓글이 수정되었습니다.");
							getPage("/reply/"+bno+"/"+replyPage);
						}
					}
				});
			});
			
			$("#replyDelBtn").on("click",function(){
				var rno = $(".modal-title").html();
				var replytext = $("#modalReplyText").val();
				
				$.ajax({
					type:'post',
					url:'/reply/remove',
					headers: {"Content-Type":"application/json"},
					dataType:'text',
					data:JSON.stringify({rno:rno}),
					success:function(result){
						console.log("result :" + result);
						if(result == 'SUCCESS'){
							alert("댓글이 삭제 되었습니다");
							getPage("/reply/"+bno+"/"+replyPage);
						}
					}
				});
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