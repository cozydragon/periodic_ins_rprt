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
					<h4 class="title_txt02">교부세 배정관리</h4>
				</div>		

				<div class="con">
				
					<ul class="tab">
						<li class="current" data-tab="tab1"><a class="tab_sel" href="#">보통교부세</a></li>
						<li data-tab="tab2"><a class="tab_sel" href="#">특별교부세</a></li>
						<li data-tab="tab3"><a class="tab_sel" href="#">부동산교부세</a></li>
					</ul>
					<p></p>
					
					<table class=table_wrap>
						<colgroup>
							<col>
						</colgroup>							
						<tbody>
							<tr>
								<td style="text-align:right;border:none;">(단위 : 천원)</td>
							</tr>
						</tbody>
					</table>
					<p></p>
					<table class="user_infotable">
						<colgroup>
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<tbody>
							<tr>
								<th>시·도</th>
								<th>총 교부액</th>
								<th>기 교부액</th>
								<th>1분기 교부액</th>
								<th>2분기 교부액</th>
								<th>3분기 교부액</th>
								<th>4분기 교부액</th>
								<th>남은금액</th>
							</tr>
							<tr>
								<td>합&nbsp;&nbsp;&nbsp;&nbsp;계</td>
								<td style="text-align:right;padding:10px"><font color="blue">38,383,400,000</font></td>
								<td style="text-align:right;padding:10px">28,787,550,000</td>
								<td style="text-align:right;padding:10px">9,595,850,000</td>
								<td style="text-align:right;padding:10px">9,595,850,000</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">19,191,700,000</td>
							</tr>
							<tr>
								<td>서&nbsp;&nbsp;&nbsp;&nbsp;울</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,705,536,200</font></td>
								<td style="text-align:right;padding:10px">2,029,152,100</td>
								<td style="text-align:right;padding:10px">676,384,100</td>
								<td style="text-align:right;padding:10px">676,384,100</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,352,768,000</td>
							</tr>
							<tr>
								<td>부&nbsp;&nbsp;&nbsp;&nbsp;산</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,209,750,500</font></td>
								<td style="text-align:right;padding:10px">1,657,312,900</td>
								<td style="text-align:right;padding:10px">552,437,600</td>
								<td style="text-align:right;padding:10px">552,437,600</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,104,875,300</td>
							</tr>
							<tr>
								<td>대&nbsp;&nbsp;&nbsp;&nbsp;구</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,810,003,900</font></td>
								<td style="text-align:right;padding:10px">2,107,502,900</td>
								<td style="text-align:right;padding:10px">702,501,000</td>
								<td style="text-align:right;padding:10px">702,501,000</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,405,001,900</td>
							</tr>
							<tr>
								<td>인&nbsp;&nbsp;&nbsp;&nbsp;천</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,457,500,500</font></td>
								<td style="text-align:right;padding:10px">1,843,125,400</td>
								<td style="text-align:right;padding:10px">614,375,100</td>
								<td style="text-align:right;padding:10px">614,375,100</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,228,750,300</td>
							</tr>
							<tr>
								<td>광&nbsp;&nbsp;&nbsp;&nbsp;주</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,225,900,900</font></td>
								<td style="text-align:right;padding:10px">1,669,425,700</td>
								<td style="text-align:right;padding:10px">556,475,200</td>
								<td style="text-align:right;padding:10px">556,475,200</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,112,950,500</td>
							</tr>
							<tr>
								<td>대&nbsp;&nbsp;&nbsp;&nbsp;전</td>
								<td style="text-align:right;padding:10px"><font color="blue">1,743,901,600</font></td>
								<td style="text-align:right;padding:10px">1,307,926,200</td>
								<td style="text-align:right;padding:10px">435,975,400</td>
								<td style="text-align:right;padding:10px">435,975,400</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">871,950,800</td>
							</tr>
							<tr>
								<td>울&nbsp;&nbsp;&nbsp;&nbsp;산</td>
								<td style="text-align:right;padding:10px"><font color="blue">1,650,709,800</font></td>
								<td style="text-align:right;padding:10px">1,238,032,400</td>
								<td style="text-align:right;padding:10px">412,677,400</td>
								<td style="text-align:right;padding:10px">412,677,400</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">825,355,000</td>
							</tr>
							<tr>
								<td>세&nbsp;&nbsp;&nbsp;&nbsp;종</td>
								<td style="text-align:right;padding:10px"><font color="blue">534,165,100</font></td>
								<td style="text-align:right;padding:10px">400,623,800</td>
								<td style="text-align:right;padding:10px">133,541,300</td>
								<td style="text-align:right;padding:10px">133,541,300</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">267,082,500</td>
							</tr>
							<tr>
								<td>경&nbsp;&nbsp;&nbsp;&nbsp;기</td>
								<td style="text-align:right;padding:10px"><font color="blue">4,606,148,300</font></td>
								<td style="text-align:right;padding:10px">3,454,611,200</td>
								<td style="text-align:right;padding:10px">1,151,537,100</td>
								<td style="text-align:right;padding:10px">1,151,537,100</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">2,303,074,100</td>
							</tr>
							<tr>
								<td>강&nbsp;&nbsp;&nbsp;&nbsp;원</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,146,009,300</font></td>
								<td style="text-align:right;padding:10px">1,609,507,000</td>
								<td style="text-align:right;padding:10px">536,502,300</td>
								<td style="text-align:right;padding:10px">536,502,300</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,073,004,700</td>
							</tr>
							<tr>
								<td>충&nbsp;&nbsp;&nbsp;&nbsp;북</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,059,846,700</font></td>
								<td style="text-align:right;padding:10px">1,544,885,000</td>
								<td style="text-align:right;padding:10px">514,961,700</td>
								<td style="text-align:right;padding:10px">514,961,700</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,029,923,300</td>
							</tr>
							<tr>
								<td>충&nbsp;&nbsp;&nbsp;&nbsp;남</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,006,519,600</font></td>
								<td style="text-align:right;padding:10px">1,504,889,700</td>
								<td style="text-align:right;padding:10px">501,629,900</td>
								<td style="text-align:right;padding:10px">501,629,900</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,003,259,800</td>
							</tr>
							<tr>
								<td>전&nbsp;&nbsp;&nbsp;&nbsp;북</td>
								<td style="text-align:right;padding:10px"><font color="blue">1,883,657,100</font></td>
								<td style="text-align:right;padding:10px">1,412,742,800</td>
								<td style="text-align:right;padding:10px">470,914,300</td>
								<td style="text-align:right;padding:10px">470,914,300</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">941,828,500</td>
							</tr>
							<tr>
								<td>전&nbsp;&nbsp;&nbsp;&nbsp;남</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,737,593,800</font></td>
								<td style="text-align:right;padding:10px">2,053,195,300</td>
								<td style="text-align:right;padding:10px">684,398,500</td>
								<td style="text-align:right;padding:10px">684,398,500</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,368,796,800</td>
							</tr>
							<tr>
								<td>경&nbsp;&nbsp;&nbsp;&nbsp;북</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,293,904,000</font></td>
								<td style="text-align:right;padding:10px">1,720,428,000</td>
								<td style="text-align:right;padding:10px">573,476,000</td>
								<td style="text-align:right;padding:10px">573,476,000</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,146,952,000</td>
							</tr>
							<tr>
								<td>경&nbsp;&nbsp;&nbsp;&nbsp;남</td>
								<td style="text-align:right;padding:10px"><font color="blue">2,498,881,800</font></td>
								<td style="text-align:right;padding:10px">1,874,161,400</td>
								<td style="text-align:right;padding:10px">624,720,400</td>
								<td style="text-align:right;padding:10px">624,720,400</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,249,441,000</td>
							</tr>
							<tr>
								<td>제&nbsp;&nbsp;&nbsp;&nbsp;주</td>
								<td style="text-align:right;padding:10px"><font color="blue">1,813,370,900</font></td>
								<td style="text-align:right;padding:10px">1,360,028,200</td>
								<td style="text-align:right;padding:10px">453,342,700</td>
								<td style="text-align:right;padding:10px">453,342,700</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">906,685,500</td>
							</tr>
							<!-- 
							<tr>
								<td>합&nbsp;&nbsp;&nbsp;&nbsp;계</td>
								<td style="text-align:right;padding:10px">38,383,400,000</td>
								<td style="text-align:right;padding:10px">28,787,550,000</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="9,595,850,000" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="9,595,850,000" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">19,191,700,000</td>
							</tr>
							<tr>
								<td>서&nbsp;&nbsp;&nbsp;&nbsp;울</td>
								<td style="text-align:right;padding:10px">2,705,536,200</td>
								<td style="text-align:right;padding:10px">2,029,152,100</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="676,384,100" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="676,384,100" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,352,768,000</td>
							</tr>
							<tr>
								<td>부&nbsp;&nbsp;&nbsp;&nbsp;산</td>
								<td style="text-align:right;padding:10px">2,209,750,500</td>
								<td style="text-align:right;padding:10px">1,657,312,900</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="552,437,600" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="552,437,600" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,104,875,300</td>
							</tr>
							<tr>
								<td>대&nbsp;&nbsp;&nbsp;&nbsp;구</td>
								<td style="text-align:right;padding:10px">2,810,003,900</td>
								<td style="text-align:right;padding:10px">2,107,502,900</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="702,501,000" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="702,501,000" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,405,001,900</td>
							</tr>
							<tr>
								<td>인&nbsp;&nbsp;&nbsp;&nbsp;천</td>
								<td style="text-align:right;padding:10px">2,457,500,500</td>
								<td style="text-align:right;padding:10px">1,843,125,400</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="614,375,100" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="614,375,100" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,228,750,300</td>
							</tr>
							<tr>
								<td>광&nbsp;&nbsp;&nbsp;&nbsp;주</td>
								<td style="text-align:right;padding:10px">2,225,900,900</td>
								<td style="text-align:right;padding:10px">1,669,425,700</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="556,475,200" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="556,475,200" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,112,950,500</td>
							</tr>
							<tr>
								<td>대&nbsp;&nbsp;&nbsp;&nbsp;전</td>
								<td style="text-align:right;padding:10px">1,743,901,600</td>
								<td style="text-align:right;padding:10px">1,307,926,200</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="435,975,400" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="435,975,400" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">871,950,800</td>
							</tr>
							<tr>
								<td>울&nbsp;&nbsp;&nbsp;&nbsp;산</td>
								<td style="text-align:right;padding:10px">1,650,709,800</td>
								<td style="text-align:right;padding:10px">1,238,032,400</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="412,677,400" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="412,677,400" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">825,355,000</td>
							</tr>
							<tr>
								<td>세&nbsp;&nbsp;&nbsp;&nbsp;종</td>
								<td style="text-align:right;padding:10px">534,165,100</td>
								<td style="text-align:right;padding:10px">400,623,800</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="133,541,300" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="133,541,300" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">267,082,500</td>
							</tr>
							<tr>
								<td>경&nbsp;&nbsp;&nbsp;&nbsp;기</td>
								<td style="text-align:right;padding:10px">4,606,148,300</td>
								<td style="text-align:right;padding:10px">3,454,611,200</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="1,151,537,100" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="1,151,537,100" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">2,303,074,100</td>
							</tr>
							<tr>
								<td>강&nbsp;&nbsp;&nbsp;&nbsp;원</td>
								<td style="text-align:right;padding:10px">2,146,009,300</td>
								<td style="text-align:right;padding:10px">1,609,507,000</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="536,502,300" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="536,502,300" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,073,004,700</td>
							</tr>
							<tr>
								<td>충&nbsp;&nbsp;&nbsp;&nbsp;북</td>
								<td style="text-align:right;padding:10px">2,059,846,700</td>
								<td style="text-align:right;padding:10px">1,544,885,000</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="514,961,700" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="514,961,700" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,029,923,300</td>
							</tr>
							<tr>
								<td>충&nbsp;&nbsp;&nbsp;&nbsp;남</td>
								<td style="text-align:right;padding:10px">2,006,519,600</td>
								<td style="text-align:right;padding:10px">1,504,889,700</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="501,629,900" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="501,629,900" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,003,259,800</td>
							</tr>
							<tr>
								<td>전&nbsp;&nbsp;&nbsp;&nbsp;북</td>
								<td style="text-align:right;padding:10px">1,883,657,100</td>
								<td style="text-align:right;padding:10px">1,412,742,800</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="470,914,300" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="470,914,300" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">941,828,500</td>
							</tr>
							<tr>
								<td>전&nbsp;&nbsp;&nbsp;&nbsp;남</td>
								<td style="text-align:right;padding:10px">2,737,593,800</td>
								<td style="text-align:right;padding:10px">2,053,195,300</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="684,398,500" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="684,398,500" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,368,796,800</td>
							</tr>
							<tr>
								<td>경&nbsp;&nbsp;&nbsp;&nbsp;북</td>
								<td style="text-align:right;padding:10px">2,293,904,000</td>
								<td style="text-align:right;padding:10px">1,720,428,000</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="573,476,000" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="573,476,000" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,146,952,000</td>
							</tr>
							<tr>
								<td>경&nbsp;&nbsp;&nbsp;&nbsp;남</td>
								<td style="text-align:right;padding:10px">2,498,881,800</td>
								<td style="text-align:right;padding:10px">1,874,161,400</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="624,720,400" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="624,720,400" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,249,441,000</td>
							</tr>
							<tr>
								<td>제&nbsp;&nbsp;&nbsp;&nbsp;주</td>
								<td style="text-align:right;padding:10px">1,813,370,900</td>
								<td style="text-align:right;padding:10px">1,360,028,200</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="453,342,700" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="453,342,700" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">906,685,500</td>
							</tr>
							 -->
						</tbody>
					</table>
					
					<div class="tb_bt"><a href="#" class="btn red">저장</a><a href="#" class="btn blue">상세</a><a href="#" class="btn blue">목록</a></div>
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