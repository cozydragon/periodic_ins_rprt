﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
					<h4 class="title_txt02">특별조정교부금 수요별 관리카드 관리</h4>
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
							<col width="5%;">
							<col width="10%;">
							<col width="5%;">
							<col width="10%;">
							<col width="5%;">
							<col width="10%;">
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
										<option selected>강원</option>
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
										<option>본청</option>
										<option selected>강릉시</option>
										<option>고성군</option>
										<option>동해시</option>
										<option>삼척시</option>
										<option>속초시</option>
										<option>양구군</option>
										<option>양양군</option>
										<option>영월군</option>
										<option>원주시</option>
										<option>인제군</option>
										<option>정선군</option>
										<option>철원군</option>
										<option>춘천시</option>
										<option>태백시</option>
										<option>평창군</option>
										<option>홍천군</option>
										<option>화천군</option>
										<option>횡성군</option>
									</select>
								</td>
								<td>
									<a href="#" class="btn blue">검색</a>
								</td>
								
							</tr>

						</tbody>
					</table>
					<div class="tb_bt"><a href="#" class="btn blue">등록</a><a href="#" class="btn blue">상세</a></div>
					
					
					<table class="user_infotable" style="margin-top:20px;">
						<colgroup>
							<col width="5%;">
							<col width="15%;">
							<col width="5%;">
							<col width="30%;">
							<col width="15%;">
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
								<th>사업부서명</th>
								<th>담당자</th>
								<th>사업명</th>
								<th>사업기간</th>
								<th>사업위치</th>
								<th>교부일자</th>
								<th>사업비(백만원)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1
									<input type="checkbox" id="check1" class="checkSel" checked>
                                    <label for="check1"></label>
								</td>
								<td>수도자재관리센터</td>
								<td>홍길동</td>
								<td>지방공공요금 안정관리</td>
								<td>2019.04.01 ~ 2019.12.31</td>
								<td>본청</td>
								<td>2019.03.02</td>
								<td style="text-align:right;padding:10px;">398</td>
							</tr>
							<tr>
								<td>2
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check2"></label>
								</td>
								<td>요금관리부 계측관리과</td>
								<td>홍길복</td>
								<td>동파 방지용 수도계량기 교체 지원</td>
								<td>2019.05.01 ~ 2019.08.28</td>
								<td>서울시 전체</td>
								<td>2019.02.08</td>
								<td style="text-align:right;padding:10px;">50</td>
							</tr>
							<tr>
								<td>3
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check3"></label>
								</td>
								<td>도로보수과</td>
								<td>홍길순</td>
								<td>제설대책 추진</td>
								<td>2019.08.01 ~ 2020.02.28</td>
								<td>서울시 전체</td>
								<td>2018.12.27</td>
								<td style="text-align:right;padding:10px;">500</td>
							</tr>

						</tbody>
					</table>
				</div>





				<div class="con">
					<h4 class="title_txt">사업 개요</h4>
					<div>
						<table class="register_tb">
							<colgroup>
								<col width="12%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
							</colgroup>
							<tbody>
								<tr>
									<th>사업부서명</th>
									<td colspan="3">
										<input class="register_input" type="text" name="" placeholder="" value="수도자재관리센터">
									</td>
									<th colspan="2">담당자</th>
									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="홍길동">
									</td>
									<th colspan="2">연락처</th>
									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="02-000-0000">
									</td>
								</tr>
								<tr>
									<th>사업명</th>
									<td colspan="7">
										<input class="register_input" type="text" name="" placeholder="" value="지방공공요금 안정관리">
									</td>
									<th colspan="2">수요구분</th>
									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="지역현안">
									</td>										
								</tr>
								<tr>
									<th>용도변경 사업명</th>
									<td colspan="7">
										<input class="register_input" type="text" name="" placeholder="" value="">
									<th colspan="2">용도변경 승인일자</th>
									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="">
									</td>
								</tr>
								<tr>
									<th>사업기간</th>
									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="2019.04.01">
									</td>
									<td>
										<input class="register_input" type="text" name="" placeholder="" value="부터" readonly>
									</td>

									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="2019.12.31">
									</td>
									<td>
										<input class="register_input" type="text" name="" placeholder="" value="까지" readonly>
									</td>
									<td>
									</td>
									<th colspan="2">교부일자</th>
									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="2019.03.02">
									</td>
								</tr>
								<tr>
									<th>사업위치</th>
									<td colspan="11">
										<input class="register_input" type="text" name="" placeholder="" value="2019.03.02">
									</td>
								</tr>
								<tr>
									<th rowspan="2">사업비</th>
									<th>계</th>
									<th>특교</th>
									<th>국비</th>
									<th>시도비</th>
									<th>시군구비</th>
									<th>기타</th>
									<td colspan="3">
									</td>
									<td colspan="2">
										<input class="register_input" type="text" name="" placeholder="" value="(단위:백만원)" readonly>
									</td>
									
								</tr>
								<tr>
									<td>
										<input style="text-align:right;" class="register_input" type="text" name="" placeholder="" value="398">
									</td>
									<td>
										<input style="text-align:right;" class="register_input" type="text" name="" placeholder="" value="398">
									</td>
									<td>
										<input class="register_input" type="text" name="" placeholder="" value="">
									</td>
									<td>
										<input class="register_input" type="text" name="" placeholder="" value="">
									</td>
									<td>
										<input class="register_input" type="text" name="" placeholder="" value="">
									</td>
									<td>
										<input class="register_input" type="text" name="" placeholder="" value="">
									</td>
									<td colspan="5">
									</td>
								</tr>
								<tr>
									<th > 사업내용</th>
									<td colspan="11" >
										<textarea name="" placeholder="" rows="12" cols="192" style="text-align:left;">
고품질계량기 구매설치
1.대상 : 서울시 관내 80mm~200mm 계량기 설치업소
2. 구격별 수량 : 80mm용 42개소, 100mm용 21개소, 150mm용 11개소, 200mm용 7개소
										</textarea>
									</td>
								</tr>

								
																	
							</tbody>
						</table>
					</div>
					<div class="tb_bt"><a href="#" class="btn blue">저장</a><a href="#" class="btn blue">삭제</a><a href="#" class="btn red">등록완료</a></div>
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