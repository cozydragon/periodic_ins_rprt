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
					<h4 class="title_txt02">전년대비 이상 증감 내역</h4>
				</div>		


				<div class="con">
					<table class=table_clear>
						<colgroup>
							<col width="5%;">
							<col width="10%;">
							<col width="5%;">
							<col width="10%;">
							<col width="5%;">
							<col width="10%;">
							<col width="5%;">
							<col width="15%;">
							<col width="10%;">
							<col width="10%;">
							<col width="15%;">
						</colgroup>							
						<tbody>
							<tr>
								<th>연도</th>
								<td>
									<select class="form-control" style="width:100%;">
										<option>전체</option>
										<option selected>2020</option>
										<option>2019</option>
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
								<th>시도</th>
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
								<th>시군구</th>
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
								<th>통계명</th>
								<td>
									<select class="form-control" style="width:100%;">
										<option>전체</option>
										<option>1. 행정구역 현황</option>
										<option>2. 인구 현황</option>
										<option>3. 일반행정 현황</option>
										<option>4. 안전관리 현황</option>
										<option>5. 문화재 지정 현황</option>
										<option>6. 환경 관련 현황</option>
										<option>7. 사회복지·보건분야 현황</option>
										<option>8. 농림어업 현황</option>
										<option>9. 도로 현황</option>
										<option>10. 지역관리 관련 현황</option>
									</select>
								</td>
								<th>
									증감사유 작성상태
								</th>
								<td>
									<select class="form-control" style="width:100%;">
										<option>전체</option>
										<option>미작성</option>
										<option>작성중</option>
										<option>작성완료</option>
									</select>
								</td>
								<td>
									<a href="#" class="btn blue">검색</a>
								</td>
							</tr>

						</tbody>
					</table>
					
					<table class="user_infotable" style="margin-top:20px;">
						<colgroup>
							<col width="5%;">
							<col width="5%;">
							<col width="10%;">
							<col width="50%;">
							<col width="10%;">
							<col width="10%;">
							<col width="10%;">
						</colgroup>
						<thead>
							<tr>
								<th>	
									<input type="checkbox" id="checkAll" class="checkAll">
									<label for="checkAll"></label>
								</th>
								<th>연도</th>
								<th>시도-시군구</th>
								<th>통계명</th>
								<th>증감율(%)</th>
								<th>증감사유 작성상태</th>
								<th>증빙자료 첨부여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1
									<input type="checkbox" id="check1" class="checkSel" checked>
                                    <label for="check1"></label>
								</td>
								<td>2020</td>
								<td>서울 본청</td>
								<td>6. 환경 관련 현황 (6-1. 생활폐기물 현황(소각, 매립, 재활용))</td>
								<td>13</td>
								<td>미작성</td>
								<td>미첨부</td>
							</tr>
							<tr>
								<td>2
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check2"></label>
								</td>
								<td>2020</td>
								<td>서울 중구</td>
								<td>1. 행정구역 현황 (1-1. 행정구역 중 개발규제지역 면적))</td>
								<td>3</td>
								<td>미작성</td>
								<td>미첨부</td>
							</tr>
							<tr>
								<td>3
									<input type="checkbox" id="check3" class="checkSel">
                                    <label for="check3"></label>
								</td>
								<td>2020</td>
								<td>서울 마포구</td>
								<td>10. 지역관리 관련 현황 (10-5. 송·변전시설 현황	)</td>
								<td>▲ 7</td>
								<td>작성중</td>
								<td>미첨부</td>
							</tr>
							<tr>
								<td>4
									<input type="checkbox" id="check4" class="checkSel">
                                    <label for="check4"></label>
								</td>
								<td>2020</td>
								<td>서울 노원구</td>
								<td>10. 지역관리 관련 현황 (10-2. 지역특화발전 특구)</td>
								<td>▲ 3</td>
								<td>작성완료</td>
								<td>미첨부</td>
							</tr>
							<tr>
								<td>5
									<input type="checkbox" id="check5" class="checkSel">
                                    <label for="check5"></label>
								</td>
								<td>2020</td>
								<td>서울 노원구</td>
								<td>2. 인구 현황 (2-1. 특수인구수)</td>
								<td>5</td>
								<td>작성완료</td>
								<td>첨부</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="con">
					<h4 class="title_txt02">증감사유 작성 및 증빙자료 첨부</h4>
					<p></p>
					&nbsp;&nbsp;&nbsp;※ 착오/오류로 잘못 작성한 경우, "기초통계자료 작성(지자체)" 메뉴에서 수정하시기 바랍니다.
					<p></p>
					<table class="register_tb" >
						<colgroup>
							<col width="5%;">
							<col width="8%;">
							<col width="17%;">
							<col width="5%;">
							<col width="5%;">
							<col width="10%;">
							<col width="40%;">
							<col width="10%;">
						</colgroup>
						<thead>
							<tr>
								<th>연도</th>
								<th colspan="2">통계명</th>
								<th>'20년도</th>
								<th>'19년도</th>
								<th>증감률</th>
								<th>증감사유</th>
								<th>첨부파일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2020</td>
								<td>6. 환경 관련 현황</td>
								<td>6-1. 생활폐기물 현황(소각, 매립, 재활용)</td>
								<td>30,312톤</td>
								<td>26,922톤</td>
								<td>12.59%</td>
								<td>
									<textarea name="" id="" cols="" rows="6" style="width:100%;"></textarea>
								</td>
								<td style="text-align:center;">
									<a href="#" class="btn blue">첨부</a>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="tb_bt"><a href="#" class="btn blue">저장</a><a href="#" class="btn blue">삭제</a><a href="#" class="btn red">작성완료</a></div>
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