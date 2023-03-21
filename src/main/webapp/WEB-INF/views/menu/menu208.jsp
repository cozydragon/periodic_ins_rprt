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
					<h4 class="title_txt02">집행계획 등록 관리</h4>
				</div>		


				<div class="con">
					<!-- <h4 class="title_txt">특별교부세 사업목록</h4> -->
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
								<th>수요구분</th>
								<td>
									<select class="form-control" style="width:90%;">
										<option>전체</option>
										<option>지역현안</option>
										<option>국가지방협력</option>
										<option>재난안전</option>
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
							<col width="15%;">
							<col width="5%;">
							<col width="15%;">
							<col width="10%;">
							<col width="10%;">
							<col width="10%;">
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
								<th>수요구분</th>
								<th>사업기간</th>
								<th>사업위치</th>
								<th>교부일자</th>
								<th>사업비(백만원)</th>
								<th>진행상태</th>
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
								<td>지역현안</td>
								<td>2019.04.01 ~ 2019.12.31</td>
								<td>본청</td>
								<td>2019.03.02</td>
								<td style="text-align:right;padding:10px;">398</td>
								<td>미작성</td>
							</tr>
							<tr>
								<td>2
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check2"></label>
								</td>
								<td>요금관리부 계측관리과</td>
								<td>홍길복</td>
								<td>동파 방지용 수도계량기 교체 지원</td>
								<td>지역현안</td>
								<td>2019.05.01 ~ 2019.08.28</td>
								<td>서울시 전체</td>
								<td>2019.02.08</td>
								<td style="text-align:right;padding:10px;">50</td>
								<td>작성중</td>
							</tr>
							<tr>
								<td>3
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check3"></label>
								</td>
								<td>도로보수과</td>
								<td>홍길순</td>
								<td>제설대책 추진</td>
								<td>재난안전</td>
								<td>2019.08.01 ~ 2020.02.28</td>
								<td>서울시 전체</td>
								<td>2018.12.27</td>
								<td style="text-align:right;padding:10px;">500</td>
								<td>작성완료</td>
							</tr>

						</tbody>
					</table>
				</div>
				
			
				<div class="con">
					<h4 class="title_txt02">집행상황</h4>
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
						<table class="user_infotable">
							<colgroup>
								<col width="4%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
								<col width="8%;">
							</colgroup>							
							<tbody>
								<tr>
									<th rowspan="2">구분</th>
									<th rowspan="2" colspan="2">전년도까지</th>
									<th colspan="8">2020년도</th>
									<th colspan="2">2021년도</th>
								</tr>
								<tr>
									<th colspan="2">1/4분기</th>
									<th colspan="2">2/4분기</th>
									<th colspan="2">3/4분기</th>
									<th colspan="2">4/4분기</th>
									<th colspan="2">1~2월까지</th>
								<tr>
								<tr>
									<td rowspan="6">집행실적</td>
									<td>계</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>계</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>계</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>계</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>계</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>계</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>특&nbsp;&nbsp;&nbsp;&nbsp;교</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>특&nbsp;&nbsp;&nbsp;&nbsp;교</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>특&nbsp;&nbsp;&nbsp;&nbsp;교</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>특&nbsp;&nbsp;&nbsp;&nbsp;교</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>특&nbsp;&nbsp;&nbsp;&nbsp;교</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>특&nbsp;&nbsp;&nbsp;&nbsp;교</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>국&nbsp;&nbsp;&nbsp;&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>국&nbsp;&nbsp;&nbsp;&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>국&nbsp;&nbsp;&nbsp;&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>국&nbsp;&nbsp;&nbsp;&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>국&nbsp;&nbsp;&nbsp;&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>국&nbsp;&nbsp;&nbsp;&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>시&nbsp;도&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시&nbsp;도&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시&nbsp;도&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시&nbsp;도&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시&nbsp;도&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시&nbsp;도&nbsp;비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>시군구비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시군구비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시군구비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시군구비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시군구비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>시군구비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>기&nbsp;&nbsp;&nbsp;&nbsp;타</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>기&nbsp;&nbsp;&nbsp;&nbsp;타</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>기&nbsp;&nbsp;&nbsp;&nbsp;타</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>기&nbsp;&nbsp;&nbsp;&nbsp;타</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>기&nbsp;&nbsp;&nbsp;&nbsp;타</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>기&nbsp;&nbsp;&nbsp;&nbsp;타</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>집행내역</td>
									<td colspan="2"><textarea name="" id="" cols="" rows="6" style="width:90%;"></textarea></td>
									<td colspan="2"><textarea name="" id="" cols="" rows="6" style="width:90%;"></textarea></td>
									<td colspan="2"><textarea name="" id="" cols="" rows="6" style="width:90%;"></textarea></td>
									<td colspan="2"><textarea name="" id="" cols="" rows="6" style="width:90%;"></textarea></td>
									<td colspan="2"><textarea name="" id="" cols="" rows="6" style="width:90%;"></textarea></td>
									<td colspan="2"><textarea name="" id="" cols="" rows="6" style="width:90%;"></textarea></td>
								</tr>
								<tr>
									<td rowspan="3">추진상황</td>
									<td>완료여부</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td>집행액</td>
									<td colspan="2"><input class="register_input" type="text" name="" placeholder=""></td>
									<td>집행잔액</td>
									<td colspan="2"><input class="register_input" type="text" name="" placeholder=""></td>
									<td>집행률</td>
									<td colspan="3"><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>미완료사유</td>
									<td colspan="11"><textarea name="" id="" cols="" rows="3" style="width:98%;"></textarea></td>
								</tr>
								<tr>
									<td>추진상황 상세설명<br/>(미완료시 작성)</td>
									<td colspan="11"><textarea name="" id="" cols="" rows="3" style="width:98%;"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="tb_bt"><a href="#" class="btn blue">초기화</a><a href="#" class="btn blue">저장</a><a href="#" class="btn red">작성완료</a></div>
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