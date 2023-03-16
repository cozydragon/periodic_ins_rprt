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
	
		<div class="contain">
			<div class="content">
				<div class="content_title clearfix">					
				</div>
				<div class="title_con">
					<h4 class="title_txt02">사용자 관리</h4>
				</div>				

				<div class="title_con">
					<table class="table_search">
						<colgroup>
							<col width="5%">
							<col width="10%;">							
							<col width="5%">
						</colgroup>
						
						<tbody>							
							<tr>														

								<th><label for="form-label">권한</label></th>
								<td>
									<select class="form-control">
										<option>전체</option>
										<option>행안부 교부세 담당</option>
										<option selected>시·도 교부세 담당</option>
										<option>시·군·구 교부세 담당</option>
										<option>중앙부처 시도/시군구 통계담당</option>
										<option>시도/시군구 사업담당</option>
										<option>정기점검보고서 정보시스템 운영자</option>
									</select>
								</td>
								
								<td align="right"><a href="#" class="btn blue">검색</a></td>
							</tr>							
						</tbody>
					</table>
				</div>

				<div class="con">
					<h4 class="title_txt">사용자 목록</h4>
					
						<div id="tab1" class="tabcontent current">					
							<table class="user_infotable">
								<colgroup>
									
								</colgroup>
								<thead>
									<tr>
										<th>ID</th>
										<th>시도명</th>
										<th>지자체명</th>
										<th>부서</th>
										<th>성명</th>
										<th>권한</th>
										<th>이메일</th>
										<th>휴대전화</th>
										<th>연락처</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>dragon</td>
										<td>서울특별시</td>
										<td>본청</td>
										<td>교부세과</td>
										<td>김룡</td>
										<td>시·도 교부세 담당</td>
										<td>dragon@go.kr</td>
										<td>010-0000-0000</td>
										<td>02-0000-0000</td>
									</tr>
									<tr>
										<td>tiger</td>
										<td>대전광역시</td>
										<td>본청</td>
										<td>교부세과</td>
										<td>박호랑</td>
										<td>시·도 교부세 담당</td>
										<td>tiger@go.kr</td>
										<td>010-0000-0000</td>
										<td>042-0000-0000</td>
									</tr>
									<tr>
										<td>lion</td>
										<td>대구광역시</td>
										<td>본청</td>
										<td>교부세과</td>
										<td>태사자</td>
										<td>시·도 교부세 담당</td>
										<td>lion@go.kr</td>
										<td>010-0000-0000</td>
										<td>053-0000-0000</td>
									</tr>
									<tr>
										<td>horse</td>
										<td>부산광역시</td>
										<td>본청</td>
										<td>교부세과</td>
										<td>파발마</td>
										<td>시·도 교부세 담당</td>
										<td>lion@go.kr</td>
										<td>010-0000-0000</td>
										<td>051-0000-0000</td>
									</tr>

								</tbody>
							</table>
						</div>

					<div class="tb_bt"><a href="/menu/menu1001_1" class="btn red">등록</a></div>
				</div>

				<div class="footer">
				©  2023 All rights reserved.
				</div>
			</div>
			
		</div>

	<!-- </div> -->
	
</div>

</body>
</html>