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
					<h4 class="title_txt02">기초통계자료 작성(지자체)</h4>
				</div>		


				<div class="con">
					<ul class="tab">
						<li class="current" data-tab="tab1"><a class="tab_sel" href="#">개발규제지역</a></li>
						<li data-tab="tab2"><a class="tab_sel" href="#">특수인구</a></li>
						<li data-tab="tab3"><a class="tab_sel" href="#">관제인력</a></li>
						<li data-tab="tab4"><a class="tab_sel" href="#">재산세(토지분)</a></li>
						<li data-tab="tab5"><a class="tab_sel" href="#">안전관리시설물</a></li>
						<li data-tab="tab6"><a class="tab_sel" href="#">소방관서</a></li>
						<li data-tab="tab7"><a class="tab_sel" href="#">소하천현황</a></li>
						<li data-tab="tab8"><a class="tab_sel" href="#">문화재수</a></li>
						<li data-tab="tab9"><a class="tab_sel" href="#">생활폐기물</a></li>
						<li data-tab="tab10"><a class="tab_sel" href="#">수질관리시설</a></li>
						<li data-tab="tab11"><a class="tab_sel" href="#">댐면적인구</a></li>
						<li data-tab="tab12"><a class="tab_sel" href="#">...</a></li>
					</ul>
					<p></p>
					
					<!-- 개발규제지역 -->
					<div id="tab1" class="tabcontent current">
						<h4 class=title_txt>▶ 개발규제지역</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2018.12.31. 현재</td>
									<td style="text-align:right;">(단위 : 천㎡)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="10">자치단체</th>
								</tr>
								<tr>
									<th>계</th>
									<th>일반지역</th>
									<th>군사시설<br/>보호구역(육지)</th>
									<th>상수원<br/>보호구역</th>
									<th>수변구역</th>
									<th>자연환경<br/>보전지역(육지)</th>
									<th>백두대간<br/>보호지역</th>
									<th>문화재<br/>보호구역(육지)</th>
									<th>개발제한구역</th>
									<th>행정구역면적</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>								
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>								
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>								
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>								
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="10">
										<textarea name="" id="" cols="" rows="4" style="width:99%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 특수인구 -->
					<div id="tab2" class="tabcontent">
						<h4 class=title_txt>▶ 특수인구</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2018.12.31. 현재</td>
									<td style="text-align:right;">(단위 : 명)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="4">자치단체</th>
								</tr>
								<tr>
									<th>소계</th>
									<th>의무소방대원수</th>
									<th>특별사법경찰수</th>
									<th>관제인력</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="4">
										<textarea name="" id="" cols="" rows="4" style="width:98%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 관제인력 -->
					<div id="tab3" class="tabcontent">
						<h4 class=title_txt>▶ 관제인력</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2019.2.28. 현재</td>
									<td style="text-align:right;">(단위 : 명)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="4">자치단체</th>
								</tr>
								<tr>
									<th>계</th>
									<th>지자체</th>
									<th>경찰</th>
									<th>위탁</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="4">
										<textarea name="" id="" cols="" rows="4" style="width:98%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 재산세(토지분) -->
					<div id="tab4" class="tabcontent">
						<h4 class=title_txt>▶ 재산세(토지분)</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2018년 결산기준</td>
									<td style="text-align:right;">(단위 : 천㎡)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="3">과세·비과세면적</th>
									<th rowspan="2">행정구역 면적</th>
									<th rowspan="2">행정구역≠(과세면적+비과세면적)</th>
								</tr>
								<tr>
									<th>계</th>
									<th>과세면적</th>
									<th>비과세면적</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="5">
										<textarea name="" id="" cols="" rows="4" style="width:98%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 안전관리시설물 -->
					<div id="tab5" class="tabcontent">
						<h4 class=title_txt>▶ 안전관리시설물</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2018.12.31. 현재</td>
									<td style="text-align:right;">(단위 : 개소)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="3">시설물</th>
								</tr>
								<tr>
									<th>1종</th>
									<th>2종</th>
									<th>3종</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="3">
										<textarea name="" id="" cols="" rows="4" style="width:97%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 소방관서 -->
					<div id="tab6" class="tabcontent">
						<h4 class=title_txt>▶ 소방관서</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2018.12.31. 현재</td>
									<td style="text-align:right;">(단위 : 개소)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="4">소방관서</th>
								</tr>
								<tr>
									<th>계</th>
									<th>소방본부</th>
									<th>소방서</th>
									<th>119안전센터</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="4">
										<textarea name="" id="" cols="" rows="4" style="width:98%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 소하천현황 -->
					<div id="tab7" class="tabcontent">
						<h4 class=title_txt>▶ 소하천현황</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2018.12.31. 현재</td>
									<td style="text-align:right;">(단위 : 개소, m)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="2">자치단체</th>
								</tr>
								<tr>
									<th>개소수</th>
									<th>총연장</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="2">
										<textarea name="" id="" cols="" rows="4" style="width:96%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 문화재수 -->
					<div id="tab8" class="tabcontent">
						<h4 class=title_txt>▶ 문화재수</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2018.12.31. 현재</td>
									<td style="text-align:right;">(단위 : 점)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="5">시·도지정 문화재(실제 관리)</th>
								</tr>
								<tr>
									<th>계</th>
									<th>유형문화재</th>
									<th>무형문화재</th>
									<th>기념물</th>
									<th>민속문화재</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="5">
										<textarea name="" id="" cols="" rows="4" style="width:98%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 생활폐기물 -->
					<div id="tab9" class="tabcontent">
						<h4 class=title_txt>▶ 생활폐기물</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준)2017.12.31. 현재</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="2">소각시설(생활폐기물)</th>
									<th colspan="3">매립시설(생활폐기물)</th>
									<th>재활용(생활계폐기물)</th>
								</tr>
								<tr>
									<th>개소수</th>
									<th>2017년 처리량(톤)</th>
									<th>개소수</th>
									<th>2017년 처리량(㎥)</th>
									<th>2017년 처리량(톤)</th>
									<th>일 평균 처리량(톤/일)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="6">
										<textarea name="" id="" cols="" rows="4" style="width:98%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 수질관리시설 -->
					<div id="tab10" class="tabcontent">
						<h4 class=title_txt>▶ 수질관리시설</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준) 가축분뇨 : 2018.12.31., 기타 : 2017.12.31. 현재</td>
									<td style="text-align:right;">(단위 : 개소수, ㎥/일)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="2">계</th>
									<th colspan="2">분뇨처리</th>
									<th colspan="2">하수처리</th>
									<th colspan="2">마을하수처리</th>
									<th colspan="2">가축분뇨처리</th>
								</tr>
								<tr>
									<th>개소수</th>
									<th>처리용량</th>
									<th>개소수</th>
									<th>처리용량</th>
									<th>개소수</th>
									<th>처리용량</th>
									<th>개소수</th>
									<th>처리용량</th>
									<th>개소수</th>
									<th>처리용량</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="10">
										<textarea name="" id="" cols="" rows="4" style="width:99%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- 댐면적인구 -->
					<div id="tab11" class="tabcontent">
						<h4 class=title_txt>▶ 댐면적인구</h4>
						<table class=table_wrap >
							<colgroup>
								<col>
								<col>
							</colgroup>							
							<tbody>
								<tr>
									<td style="text-align:left;">※(작성기준) 인구수 : 2019.6.30., 댐면적 : 2018.12.31.</td>
									<td style="text-align:right;">(단위 : 명, 천㎡)</td>
								</tr>
							</tbody>
						</table>
						<p></p>
						
						<table class="user_infotable">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th>댐연접읍면동</th>
									<th colspan="5">댐면적</th>
								</tr>
								<tr>
									<th>인구수</th>
									<th>계</th>
									<th>다목적댐</th>
									<th>용수전용댐</th>
									<th>홍수조절용댐</th>
									<th>발전용댐</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>'20년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>'19년도</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감률(%)</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>증감 사유</td>
									<td colspan="6">
										<textarea name="" id="" cols="" rows="4" style="width:98%;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tb_bt"><a href="#" class="btn blue">저장</a><a href="#" class="btn blue">삭제</a></div>
					
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