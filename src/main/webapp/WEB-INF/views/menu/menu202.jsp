<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="../include/header.jsp" %>

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

		// datepicker
        $("#datepicker,#datepicker02").datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            forceParse: false,
            Default: true,
            pickDate: true,
            todayHighlight: true,
            language: "kr",
            maxViewMode:"days",
            minViewMode:"days"
        }).datepicker('update', new Date());
    });
	</script>
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
				
<!-- ------------------------------------------------------------------------------------------------------------------------- -->

				<div class="title_con">
					<h4 class="title_txt02">특별교부세(지역현안, 재난안전수요) 교부신청</h4>
				</div>

				<div class="con">
					<div>
						<table class="register_tb">
							<colgroup>
								<col width="10%;">
								<col width="45%;">
								<col width="10%;">
								<col width="45%;">
							</colgroup>							
							<tbody>
								<tr>
									<th>사업명</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">
									</td>
									<th>사업유형</th>
									<td>
										<select class="form-control" style=" width: 88%;">
											<option>전체</option>
											<option>(지역현안수요)일자리 창출, 지역복지, 지방SOC 등</option>
											<option>(재난안전수요)풍수해저감시설, 재난위험시설, 생활안전 등</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>사업기간</th>
									<td>
										<div class="input-group" style="width:220px;">
											<input type="text" class="date_input" placeholder="mm/dd/yyyy" id="datepicker02">
											<label class="input-group-addon" for="datepicker02"><i class="ion-calendar"></i></label>
										</div>
										<div style="float: left; height: 35px;width: 20px;line-height: 34px;">~</div>
										<div class="input-group" style="width:220px;">
											<input type="text" class="date_input" placeholder="mm/dd/yyyy" id="datepicker02">
											<label class="input-group-addon" for="datepicker02"><i class="ion-calendar"></i></label>
										</div>
									</td>
									<th>위치</th>
									<td>
										<div><input class="register_input" type="text" name="" placeholder="" style="width:500px;">
										<a href="#" class="btn blue">첨부</a></div>
									</td>
								</tr>
								<tr>
									<th>사업의 필요성</th>
									<td colspan="3">
										<input class="register_input" type="text" name="" placeholder="">
									</td>
								</tr>
								<tr>
									<th>건의사항</th>
									<td colspan="3">
										<input class="register_input" type="text" name="" placeholder="">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<br/><br/>
					<p></p>
					<div>
						<h4 class="title_txt">사업개요</h4>
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
									<col width="12%;">
									<col width="11%;">
									<col width="11%;">
									<col width="11%;">
									<col width="11%;">
									<col width="11%;">
									<col width="11%;">
									<col width="11%;">
									<col width="11%;">
								</colgroup>							
								<tbody>
									<tr>
										<th rowspan="2">공종별</th>
										<th colspan="2">총 사업량</th>
										<th colspan="2">기 시행</th>
										<th colspan="2">2020년 계획</th>
										<th colspan="2">금후계획</th>
									</tr>
									<tr>
										<th>물량</th>
										<th>금액</th>
										<th>물량</th>
										<th>금액</th>
										<th>물량</th>
										<th>금액</th>
										<th>물량</th>
										<th>금액</th>
									</tr>
									<tr>
										<td>계</td>
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
								</tbody>
							</table>
						</div>
					</div>
					
					<br/><br/>
					<p></p>
					<h4 class="title_txt">재원계획</h4>
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
								<col width="14%;">
								<col width="14%;">
								<col width="14%;">
								<col width="14%;">
								<col width="14%;">
								<col width="14%;">
								<col width="16%;">
							</colgroup>							
							<tbody>
								<tr>
									<th rowspan="2">재원별</th>
									<th rowspan="2">총 사업비</th>
									<th rowspan="2">기투자</th>
									<th colspan="3">2020년 소요</th>
									<th rowspan="2">금후계획</th>
								</tr>
								<tr>
									<th>계</th>
									<th>확보</th>
									<th>미확보</th>
								</tr>
								<tr>
									<td>계</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>국비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>시·도 비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>시·군·구 비</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
								<tr>
									<td>기타</td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
									<td><input class="register_input" type="text" name="" placeholder=""></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tb_bt"><a href="#" class="btn blue">저장</a><a href="#" class="btn red">교부신청</a></div>
					
				</div>


				<div class="footer">
				©  2023 All rights reserved.
				</div>
			</div>
			
		</div>

</div>
</body>

</html>
