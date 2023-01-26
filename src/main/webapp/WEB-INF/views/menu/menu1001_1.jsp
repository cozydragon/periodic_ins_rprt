<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content='IE=edge' http-equiv='X-UA-Compatible'>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

	<script type="text/javascript">
    $( document ).ready(function() {
    	// paging
    	$('.paging .number a').click(function(e) {
			e.preventDefault();
			$(this).addClass('active').siblings().removeClass('active')
		});

    	// scroll
    	var element = $('.scroll_table').jScrollPane({autoReinitialise: true});
		var api = element.data('jsp');

        $('.tblscroll_body').scroll(function() {
            var scrLeft = api.getContentPositionX();
            $('.tblscroll_head').scrollLeft(scrLeft);
        	console.log(scrLeft);
        });
    });
    </script>
	<%@ include file="../include/header.jsp" %>
</head>
<body>

<div class="wrap">
		<%@ include file="../include/headNavMenu.jsp" %>
	<div id="nav">
		<%@ include file="../include/sidebarMenu.jsp" %>
    </div>
	
	<!-- <div class="container"> -->
		<div class="contain">
			<div class="content">
				<div class="content_title clearfix">					
				</div>
				<div class="title_con">
					<h4 class="title_txt02">사용자 등록</h4>
				</div>		
				<div class="con">
					<h4 class="title_txt">사용자 정보</h4>
					<div>
					
					<!-- 
										<th>ID</th>
										<th>성명</th>
										<th>비밀번호</th>
										<th>비밀번호확인</th>
										<th>시도명</th>
										<th>지자체명</th>
										<th>부서</th>
										<th>권한</th>
										<th>연락처</th>
										<th>휴대전화</th>
										<th>이메일</th>
					 -->
					
					
						<table class="register_tb">
							<colgroup>
								<col width="10%;">
								<col width="45%;">
								<col width="10%;">
								<col width="45%;">
							</colgroup>							
							<tbody>
								<tr>
									<th>ID</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="ID를 기입하여주십시오.">
										<a href="#" class="btn gray">중복 확인</a>
									</td>
									<th>성명</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="성명을 기입하여주십시오.">
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="비밀번호를 기입하여주십시오.">
									</td>
									<th>비밀번호 확인</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="비밀번호를 확인하여주십시오.">
									</td>
								</tr>
								<tr>
									<th>시도명</th>
									<td>
										<select class="form-control" style=" width: 50%;">
											<option selected>서울시</option>
										</select>
									</td>
									<th>지자체명</th>
									<td>
										<select class="form-control" style=" width: 50%;">
											<option selected>본청</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="부서를 입력하여주십시오.">
									</td>
									<th>권한</th>
									<td>
										<select class="form-control" style=" width: 50%;">
											<option selected>시·도 교부세 담당</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="연락처를 입력하여주십시오.">
									</td>
									<th>휴대전화</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="휴대전화를 입력하여주십시오.">
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="이메일을 입력하여주십시오.">
									
									</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="con">
					<div class="tb_bt"><a href="#" class="btn green">등록</a></div>
				</div>
				<div class="footer">
				©  2019 All rights reserved.
				</div>
			</div>
			
		</div>

	<!-- </div> -->
	
</div>

</body>
</html>