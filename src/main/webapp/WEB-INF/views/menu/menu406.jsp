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
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<link rel='stylesheet' type='text/css' href='../css/admin/normalize.css'>
	<link rel='stylesheet' type='text/css' href='../css/admin/font-awesome.min.css'>
	<link rel='stylesheet' type='text/css' href='../css/admin/bootstrap.min.css'>
	<link rel='stylesheet' type='text/css' href='../css/admin/jquery.jscrollpane.css'>
	<link rel='stylesheet' type='text/css' href='../css/admin/common.css'>
	<link rel='stylesheet' type='text/css' href='../css/admin/responsive.css'>
	<script src="../js/jquery-3.1.1.min.js"></script>
	<script src='../js/admin/jquery.cookie.js'></script>
	<script src="../js/admin/jquery.splitter.js"></script>
	<script src='../js/admin/bootstrap.min.js'></script>
	<script src='../js/admin/jquery.mousewheel.js'></script>
	<script src='../js/admin/jquery.jscrollpane.min.js'></script>
	<script src='../js/admin/bootstrap-datepicker.js'></script>
	<script src='../js/admin/common.js'></script>
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
				
<!-- ------------------------------------------------------------------------------------------------------------------------- -->

				<div class="title_con">
					<h4 class="title_txt02">감액 주요 사례 등록 및 관리</h4>
				</div>		

				<div class="con">
					<table class=table_clear>
						<colgroup>
							<col width="5%;">
							<col width="10%;">
							<col width="5%;">
							<col width="10%;">
							<col width="6%;">
							<col width="10%;">
							<col width="5%;">
							<col width="10%;">
							<col width="7%;">
							<col width="20%;">
							<col width="10%;">
						</colgroup>							
						<tbody>
							<tr>
								<th>연도</th>
								<td>
									<select class="form-control" style="width:100%;">
										<option>전체</option>
										<option selected>2019</option>
										<option>2018</option>
										<option>2017</option>
										<option>2016</option>
										<option>2015</option>
										<option>2014</option>
										<option>2013</option>
										<option>2012</option>
										<option>2011</option>
										<option>2010</option>
									</select>
								</td>
								<th>지역명</th>
								<td>
									<select class="form-control" style="width:100%;">
										<option>전체</option>
										<option selected>서울</option>
										<option>부산</option>
										<option>대구</option>
										<option>인천</option>
										<option>광주</option>
										<option>대전</option>
										<option>울산</option>
										<option>세종</option>
										<option>경기</option>
										<option>강원</option>
										<option>충북</option>
										<option>충남</option>
										<option>전북</option>
										<option>전남</option>
										<option>경북</option>
										<option>경남</option>
										<option>제주</option>
									</select>
								</td>
								<th>자치단체명</th>
								<td>
									<select class="form-control" style="width:100%;">
										<option>전체</option>
										<option>서울본청</option>
										<option>서울종로구</option>
										<option>서울중구</option>
										<option>서울용산구</option>
										<option>서울성동구</option>
										<option>서울광진구</option>
										<option>서울동대문구</option>
										<option>서울중랑구</option>
										<option>서울성북구</option>
										<option>서울강북구</option>
										<option>서울도봉구</option>
										<option>서울노원구</option>
										<option>서울은평구</option>
										<option>서울서대문구</option>
										<option>서울마포구</option>
										<option>서울양천구</option>
										<option>서울강서구</option>
										<option>서울구로구</option>
										<option>서울금천구</option>
									</select>
								</td>
								<th>감액사유</th>
								<td>
									<select class="form-control" style="width:100%;">
										<option>전체</option>
										<option>법령위한과다지출</option>
										<option>수입징수태만</option>
									</select>
								</td>
								<th>위반지출내역</th>
								<td>
									<input class="register_input" type="text" name="" placeholder="">
								</td>
								<td>
									<a href="#" class="btn blue">검색</a>
								</td>
							</tr>

						</tbody>
					</table>


					<table class="user_infotable">
						<colgroup>
							<col width="5%">
							<col width="7%">
							<col width="7%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="45%">
							<col width="10%">
						</colgroup>
						<tbody>
							<tr>
								<th></th>
								<th>연도</th>
								<th>지역명</th>
								<th>자치단체코드</th>
								<th>자치단체명</th>
								<th>감액사유</th>
								<th>위반지출내역</th>
								<th>감액금액(백만원)</th>
							</tr>
							<tr>
								<td>1</td>
								<td>2019</td>
								<td>서울</td>
								<td>1100000</td>
								<td>서울본청</td>
								<td>법령위반과다지출</td>
								<td>다수공급자계약 2단계 경쟁제도 예외사유 확인업무 부적정</td>
								<td style="text-align:right;padding:10px">5</td>
							</tr>
							<tr>
								<td>2</td>
								<td>2019</td>
								<td>서울</td>
								<td>1100000</td>
								<td>서울본청</td>
								<td>법령위반과다지출</td>
								<td>복수직급 특례제도 등 운영 부적정</td>
								<td style="text-align:right;padding:10px">67</td>
							</tr>
							<tr>
								<td>3</td>
								<td>2019</td>
								<td>서울</td>
								<td>1100000</td>
								<td>서울본청</td>
								<td>법령위반과다지출</td>
								<td>용역계약업체 선정을 위한 평가업무 등 부당 처리</td>
								<td style="text-align:right;padding:10px">119</td>
							</tr>
							<tr>
								<td>4</td>
								<td>2019</td>
								<td>서울</td>
								<td>1100000</td>
								<td>서울본청</td>
								<td>수입징수태만</td>
								<td>소송비용 회수업무 처리 부적정</td>
								<td style="text-align:right;padding:10px">43</td>
							</tr>
							<tr>
								<td>5</td>
								<td>2019</td>
								<td>서울</td>
								<td>1100000</td>
								<td>서울본청</td>
								<td>수입징수태만</td>
								<td>운송수입금(광고료 수입) 관리 지도·감독 부적정</td>
								<td style="text-align:right;padding:10px">298</td>
							</tr>
							<tr>
								<td>6</td>
								<td>2019</td>
								<td>서울</td>
								<td>1125000</td>
								<td>서울양천구</td>
								<td>법령위반과다지출</td>
								<td>생활체육시설 조성 투자심사 부적정</td>
								<td style="text-align:right;padding:10px">3</td>
							</tr>
							<tr>
								<td>7</td>
								<td>2019</td>
								<td>서울</td>
								<td>1125000</td>
								<td>서울양천구</td>
								<td>법령위반과다지출</td>
								<td>야간근무자 등에 대한 급량비 지급업무 처리 부적정</td>
								<td style="text-align:right;padding:10px">480</td>
							</tr>
							<tr>
								<td>8</td>
								<td>2019</td>
								<td>서울</td>
								<td>1126000</td>
								<td>서울강서구</td>
								<td>법령위반과다지출</td>
								<td>예비비 집행 일상감사 미실시</td>
								<td style="text-align:right;padding:10px">1</td>
							</tr>
							<tr>
								<td>9</td>
								<td>2019</td>
								<td>서울</td>
								<td>1133000</td>
								<td>서울강남구</td>
								<td>법령위반과다지출</td>
								<td>원심력철근콘트리트관 구매 업무 부당 처리</td>
								<td style="text-align:right;padding:10px">10</td>
							</tr>
							<tr>
								<td>10</td>
								<td>2019</td>
								<td>서울</td>
								<td>1135000</td>
								<td>서울강동구</td>
								<td>수입징수태만</td>
								<td>개발제한구역 내 위법건축물 등에 대한 사후관리 부적정</td>
								<td style="text-align:right;padding:10px">136</td>
							</tr>
						</tbody>
					</table>
					
					<div class="tb_bt"><a href="#" class="btn blue">등록</a><a href="#" class="btn blue">상세</a></div>
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