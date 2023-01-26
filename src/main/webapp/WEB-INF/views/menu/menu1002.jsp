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
					<h4 class="title_txt02">메뉴 관리</h4>
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

								<th><label for="form-label">메뉴종류</label></th>
								<td>
									<select class="form-control">
										<option selected>전체</option>
										<option>보통교부세</option>
										<option>특별교부세</option>
										<option>부동산교부세</option>
										<option>감액관리</option>
										<option>교부세 배정</option>
										<option>조정교부금</option>
										<option>서식관리</option>
										<option>연계관리</option>
										<option>통계현황</option>
										<option>환경설정</option>
									</select>
								</td>
								
								<td align="right"><a href="#" class="btn blue">검색</a></td>
							</tr>							
						</tbody>
					</table>
				</div>

				<div class="con">
					<h4 class="title_txt">Menu 목록</h4>
						<div id="tab1" class="tabcontent current">					
							<table class="user_infotable">
								<colgroup>
									<col width="10%;">
									<col width="20%;">
									<col width="30%;">
									<col width="15%;">
									<col width="10%;">
									<col width="10%;">
									<col width="10%;">
								</colgroup>
								<thead>
									<tr>
										<th>ID</th>
										<th>Menu</th>
										<th>설명</th>
										<th>URL</th>
										<th>표시여부</th>
										<th>Level</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>OT0000</td>
										<td>보통교부세</td>
										<td>보통교부세 관리</td>
										<td>/menu/menu1000</td>
										<td>Y</td>
										<td>1</td>
									</tr>
									<tr>
										<td>OT0001</td>
										<td>수요조사 기초자료 관리</td>
										<td>보통교부세 수요조사 기초자료 관리</td>
										<td>/menu/menu1001</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>OT0002</td>
										<td>수요조사 이상내역 검출</td>
										<td>보통교부세 수요조사 이상내역 검출</td>
										<td>/menu/menu1002</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>OT0003</td>
										<td>기초단체입력자료 검토</td>
										<td>기초단체 입력자료에 대한 검토</td>
										<td>/menu/menu1003</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>OT0004</td>
										<td>기초통계자료 업로드 및 수정</td>
										<td>기초단체 입력자료에 대한 검토</td>
										<td>/menu/menu1004</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>OT0005</td>
										<td>보통교부세 통계 일치 확인</td>
										<td>보통교부세 통계 전년도 대비 일치 확인</td>
										<td>/menu/menu1005</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>OT0006</td>
										<td>수입 기초자료 업로드 및 수정</td>
										<td>수입 기초자료 등록 및 수정</td>
										<td>/menu/menu1006</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>OT0007</td>
										<td>수입 기초자료 이상내역 검출</td>
										<td>수입 기초자료 전년도 대ㅣ 이상내역 검출</td>
										<td>/menu/menu1007</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0000</td>
										<td>특별교부세</td>
										<td>특별교부세 관리</td>
										<td>/menu/menu2000</td>
										<td>Y</td>
										<td>1</td>
									</tr>
									<tr>
										<td>ST0001</td>
										<td>수요별 관리 카드 관리</td>
										<td>관리카드의 수요별 관리 기능</td>
										<td>/menu/menu2001</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0002</td>
										<td>수요별 서식 작성 및 파일 업로드</td>
										<td>수요별 서식 업로드 및 수정</td>
										<td>/menu/menu2002</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0003</td>
										<td>교부세 산정 적정성 확인</td>
										<td>교부세 산정내역 적정성 확인</td>
										<td>/menu/menu2003</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0004</td>
										<td>교부결정 사업 목록관리 및 통보</td>
										<td>교부결정된 사업관리 및 지자체 통보</td>
										<td>/menu/menu2004</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0005</td>
										<td>특별교부세 실시간 집행내역</td>
										<td>특별교부세 실시간 집행내역 확인</td>
										<td>/menu/menu2005</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0006</td>
										<td>사업진행사항 관리</td>
										<td>특별교부세 사업 진행 사항 관리</td>
										<td>/menu/menu2006</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0007</td>
										<td>용도변경 관리</td>
										<td>특별교부세 용도변경 관리</td>
										<td>/menu/menu2007</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0008</td>
										<td>집행계획 등록 관리</td>
										<td>집행에 대한 계획 등록 관리</td>
										<td>/menu/menu2008</td>
										<td>Y</td>
										<td>2</td>
									</tr>
									<tr>
										<td>ST0009</td>
										<td>미집행,반환,감액 사업 자료관리</td>
										<td>미집행,반환,감액 사업 자료관리</td>
										<td>/menu/menu2009</td>
										<td>Y</td>
										<td>2</td>
									</tr>
								</tbody>
							</table>
						</div>
					<div class="tb_bt"><a href="/menu/menu1002_1" class="btn blue">등록</a></div>
				</div>

				<div class="footer">
				©  2019 All rights reserved.
				</div>
			</div>
			
		</div>

	
</div>

</body>
</html>