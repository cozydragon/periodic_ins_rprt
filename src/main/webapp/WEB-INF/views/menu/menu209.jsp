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
					<h4 class="title_txt02">특별교부세 용도변경 신청</h4>
				</div>		

<!-- 
				<div class="title_con">
					<table class="table_search" border="0">
						<colgroup>
							<col width="10%">
							<col width="20%;">							
							<col width="10%">
							<col width="20%">
							<col width="15%">
						</colgroup>
						<tbody>							
							<tr>														
								<th><label for="form-label">시도</label></th>
								<td>
									<select class="form-control" style="width:50%;">
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

								<th><label for="form-label">시군구</label></th>
								<td>
									<select class="form-control" style="width:50%;">
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
								<td rowspan="2"><a href="#" class="btn blue">검색</a></td>
							</tr>
							<tr>
								<th>사업명</th>
								<td colspan="3"><input class="register_input" type="text" name="" placeholder=""></td>
							</tr>							
						</tbody>
					</table>
				</div>
 -->				
				
				
				<div class="con">
					<!-- <h4 class="title_txt">특별교부세 사업목록</h4> -->
					<table class=table_clear>
						<colgroup>
							<col width="10%;">
							<col width="10%;">
							<col width="10%;">
							<col width="10%;">
							<col width="10%;">
							<col width="40%;">
							<col width="10%;">
						</colgroup>							
						<tbody>
							<tr>
								<th>시도</th>
								<td>
									<select class="form-control" style="width:90%;">
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
									<select class="form-control" style="width:90%;">
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
								<th>사업명</th>
								<td>
									<input class="register_input" type="text" name="" placeholder="">
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
								<th>시도</th>
								<th>시군구</th>
								<th>사업명</th>
								<th>교부액(백만원)</th>
								<th>집행액(백만원)</th>
								<th>집행잔액(백만원)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1
									<input type="checkbox" id="check1" class="checkSel" checked>
                                    <label for="check1"></label>
								</td>
								<td>서울</td>
								<td>본청</td>
								<td>2019 전국체육대회 대비 목동 주경기장 주변 환경 정비</td>
								<td style="text-align:right;padding:10px">1,600</td>
								<td style="text-align:right;padding:10px">1,403.3</td>
								<td style="text-align:right;padding:10px">196.7</td>
							</tr>
							<tr>
								<td>2
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check2"></label>
								</td>
								<td>서울</td>
								<td>마포구</td>
								<td>마포장애인종합복지관 확장이전(리모델링) 사업</td>
								<td style="text-align:right;padding:10px">4,284</td>
								<td style="text-align:right;padding:10px">3,699</td>
								<td style="text-align:right;padding:10px">585</td>
							</tr>
							<tr>
								<td>3
									<input type="checkbox" id="check3" class="checkSel">
                                    <label for="check3"></label>
								</td>
								<td>서울</td>
								<td>마포구</td>
								<td>마포구립장애인직업재활센터 공간확대 조성 사업</td>
								<td style="text-align:right;padding:10px">598</td>
								<td style="text-align:right;padding:10px">502</td>
								<td style="text-align:right;padding:10px">96</td>
							</tr>
							<tr>
								<td>4
									<input type="checkbox" id="check4" class="checkSel">
                                    <label for="check4"></label>
								</td>
								<td>서울</td>
								<td>노원구</td>
								<td>우이천 주민 쉼터 내 실버 카페조성</td>
								<td style="text-align:right;padding:10px">123</td>
								<td style="text-align:right;padding:10px">123</td>
								<td style="text-align:right;padding:10px">0</td>
							</tr>
							<tr>
								<td>5
									<input type="checkbox" id="check5" class="checkSel">
                                    <label for="check5"></label>
								</td>
								<td>서울</td>
								<td>노원구</td>
								<td>공릉가로공원 실버카페 조성</td>
								<td style="text-align:right;padding:10px">220</td>
								<td style="text-align:right;padding:10px">200</td>
								<td style="text-align:right;padding:10px">20</td>
							</tr>
						</tbody>
					</table>
				</div>





				<div class="con">
					<table class="register_tb" >
						<colgroup>
							<col width="10%;">
							<col width="45%;">
							<col width="45%;">
						</colgroup>
						<thead>
							<tr>
								<th>구분</th>
								<th>당초</th>
								<th>변경</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>사업명</td>
								<td align="left">2019 전국체육대회 대비 목동 주경기장 주변 환경 정비</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:100%;"><!-- 제100회  전국제육대회 대비 이촌 한강공원 롤러스케이트장 개보수  --></td>
							</tr>
							<tr>
								<td>위치</td>
								<td>서울특별시 양천구 안양천로 939</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:100%;"><!-- 서울특별시 용산구 이촌로 72길 62 --></td>
							</tr>
							<tr>
								<td>사업내용</td>
								<td>목동 주경기장 주변 보도 블럭 교체</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:100%;"><!-- 롤러스케이트장 전면 개보수 --></td>
							</tr>
							<tr>
								<td>사업기간</td>
								<td>2018.12.24 ~ 2019.06.31</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:100%;"><!-- 2018.12.24 ~ 2019.06.31 --></td>
							</tr>
							<tr>
								<td>사업비</td>
								<td>- 총사업비 : 1,600백만원(시비 800백만원, 특교세 800백만원)</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:100%;"><!-- - 총사업비 : 1,596.7(국비 420, 지방비 980, 미확보196.7) --></td>
							</tr>
							<tr>
								<td>집행액</td>
								<td>1,403.3백만원</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:100%;"></td>
							</tr>
							<tr>
								<td>집행잔액</td>
								<td>196.7백만원</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:100%;"></td>
							</tr>
						</tbody>
					</table>
					<div class="tb_bt"><a href="#" class="btn blue">저장</a><a href="#" class="btn blue">삭제</a><a href="#" class="btn red">용도변경 신청</a></div>
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