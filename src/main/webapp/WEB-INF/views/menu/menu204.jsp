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
				
<!-- ------------------------------------------------------------------------------------------------------------------------- -->

				<div class="title_con">
					<h4 class="title_txt02">교부결정 사업 관리 및 통보</h4>
				</div>		
				<div class="con">
					<table class=table_clear>
						<colgroup>
							<col width="10%;">
							<col width="15%;">
							<col width="10%;">
							<col width="10%;">
							<col width="10%;">
							<col width="15%;">
							<col width="10%;">
							<col width="30%;">
							<col width="10%;">
						</colgroup>							
						<tbody>
							<tr>
								<th>연도</th>
								<td>
									<select class="form-control" style="width:90%;">
										<option>2015</option>
										<option>2016</option>
										<option>2017</option>
										<option>2018</option>
										<option>2019</option>
										<option selected>2020</option>
									</select>
								</td>
								
								<th>시도</th>
								<td>
									<select class="form-control" style="width:90%;">
										<option>전체</option>
										<option>서울</option>
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
										<option selected>경남</option>
										<option>제주</option>
									</select>
								</td>
								<th>시군구</th>
								<td>
									<select class="form-control" style="width:90%;">
										<option>거제시</option>
									</select>
								</td>
								<td>
								<a href="#" class="btn blue">검색</a>
								</td>

								
							</tr>

						</tbody>
					</table>
					
					
					<table class=table_wrap>
						<colgroup>
							<col>
						</colgroup>							
						<tbody>
							<tr>
								<td style="text-align:right;border:none;">(단위 : 백만원)</td>
							</tr>
						</tbody>
					</table>
					<table class="user_infotable" style="margin-top:20px;">
						<colgroup>
							<col width="5%;">
							<col width="15%;">
							<col width="10%;">
							<col width="15%;">
							<col width="10%;">
							<col width="10%;">
							<col width="15%;">
							<col width="10%;">
						</colgroup>
						<thead>
							<tr>
								<th>	
									<input type="checkbox" id="checkAll" class="checkAll">
									<label for="checkAll"></label>
								</th>
								<th>사업명</th>
								<th>예산액</th>
								<th>교부 결정액</th>
								<th>기교부액</th>
								<th>금회 교부액</th>
								<th>교부 누계</th>
								<th>교부잔액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1
									<input type="checkbox" id="check1" class="checkSel" checked>
                                    <label for="check1"></label>
								</td>
								<td>재난안전사업<br>(평지교재가성공사)</td>
								<td style="text-align:right;padding:10px;">600</td>
								<td style="text-align:right;padding:10px;">600</td>
								<td style="text-align:right;padding:10px;">0</td>
								<td style="text-align:right;padding:10px;">600</td>
								<td style="text-align:right;padding:10px;">600</td>
								<td style="text-align:right;padding:10px;">0</td>
							</tr>
							<tr>
								<td>2
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check2"></label>
								</td>
								<td>지역현안사업<br>(지방공공요금 안정관리)</td>
								<td style="text-align:right;padding:10px;">398</td>
								<td style="text-align:right;padding:10px;">398</td>
								<td style="text-align:right;padding:10px;">0</td>
								<td style="text-align:right;padding:10px;">398</td>
								<td style="text-align:right;padding:10px;">398</td>
								<td style="text-align:right;padding:10px;">0</td>
							</tr>	
							<tr>
								<td>3
									<input type="checkbox" id="check3" class="checkSel">
                                    <label for="check3"></label>
								</td>
								<td>재난안전사업<br>(제설대책 추진)</td>
								<td style="text-align:right;padding:10px;">500</td>
								<td style="text-align:right;padding:10px;">500</td>
								<td style="text-align:right;padding:10px;">0</td>
								<td style="text-align:right;padding:10px;">500</td>
								<td style="text-align:right;padding:10px;">500</td>
								<td style="text-align:right;padding:10px;">0</td>
							</tr>	

						</tbody>
					</table>
				</div>





				<div class="con">
					<h4 class="title_txt">예산 편성 사항</h4>
					<table class=table_wrap>
						<colgroup>
							<col>
						</colgroup>							
						<tbody>
							<tr>
								<td style="text-align:right;border:none;">(단위 : 백만원)</td>
							</tr>
						</tbody>
					</table>
					<p></p>
					<div>
						<table class="register_tb">
							<colgroup>
								<col width="10%">
								<col width="50%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<tbody>
								<tr>
									<th rowspan="2">구분</th>
									<th rowspan="2">예산과목</th>
									<th rowspan="2">산출기초</th>
									<th rowspan="2">예산액</th>
									<th colspan="2">재원</th>
								</tr>
								<tr>
									<th>특별교부세</th>
									<th>도비</th>
								</tr>
								<tr>
									<td style="padding:10px;">세입</td>
									<td style="padding:10px;">보전수입 등 및 내부거래 <br> 보전수입 등 <br> 잉여금 <br>순세계잉여금</td>
									<td rowspan="2" style="padding:10px;">교량재가설<br>L=17m<br>B=8m</td>
									<td style="text-align:right;padding:10px;">600</td>
									<td style="text-align:right;padding:10px;">600</td>
									<td style="text-align:center;padding:10px;">-</td>
								</tr>
								<tr>
									<td style="padding:10px;">세출</td>
									<td style="padding:10px;">(정책)도로관리<br>(단위)지역간균형발전기반구축<br>(세부)마을안길개선 및 정비<br>(401-01)시설비</td>
									<td style="text-align:right;padding:10px;">600</td>
									<td style="text-align:right;padding:10px;">600</td>
									<td style="text-align:center;padding:10px;">-</td>
								</tr>

							</tbody>

						</table>
						<div class="tb_bt">
														
								<a href="#" class="btn red">연계확인</a>
						
						<a href="#" class="btn blue">통보</a></div>
					</div>
					
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