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
					<h4 class="title_txt02">조사일정관리</h4>
				</div>		


				<div class="con">
					<ul class="tab">
						<li data-tab="tab1"><a class="tab_sel" href="#">보통교부세-수요조사</a></li>
						<li class="current" data-tab="tab2"><a class="tab_sel" href="#">보통교부세-기초통계조사</a></li>
						<li data-tab="tab3"><a class="tab_sel" href="#">보통교부세-수입자료조사</a></li>
						<li data-tab="tab4"><a class="tab_sel" href="#">부동산교부세-기초산정자료관리</a></li>
						<li data-tab="tab5"><a class="tab_sel" href="#">...</a></li>
					</ul>
					
					<table class="user_infotable" style="margin-top:20px;">
						<colgroup>
							<col width="5%;">
							<col width="15%;">
							<col width="*;">
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
								<th>제목</th>
								<th>내용</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>연장</th>
							</tr>
						</thead>
						<tbody>
							<tr row="2">
								<td>1
									<input type="checkbox" id="check1" class="checkSel">
                                    <label for="check1"></label>
								</td>
								<td style="text-align:left;padding:10px;">중앙통계 취합 자료 자치단체 통보</td>
								<td style="text-align:left;padding:10px;">○ 중앙부처에 통계 자료 제출 독려, 중앙통계 자치단체 이메일 전송(수시)<br/>※ 중앙통계는 이메일 전송 후 안내 문자 발송 예정</td>
								<td>2019.05.20.</td>
								<td>2019.05.20.</td>
								<td>-</td>
							</tr>
							<tr>
								<td>2
									<input type="checkbox" id="check2" class="checkSel">
                                    <label for="check2"></label>
								</td>
								<td style="text-align:left;padding:10px;">통계 자료 사전 점검</td>
								<td style="text-align:left;padding:10px;">○ 시․도별 점검일정, 준비사항 등 점검계획 별도 통보</td>
								<td>2019.06.10.</td>
								<td>2019.06.14.</td>
								<td>-</td>
							</tr>
							<tr>
								<td>3
									<input type="checkbox" id="check3" class="checkSel">
                                    <label for="check3"></label>
								</td>
								<td style="text-align:left;padding:10px;">자치단체 기초통계자료 중앙 합동검증</td>
								<td style="text-align:left;padding:10px;">○ 합동검증 계획 추후 별도 통보<br/>※ 작성기준일 미도래(19.6.30 기준) 또는 중앙통계 미확보로 합동검증 기간 내 검증하지 못한 통계는 수입자료 점검 시 별도 확인</td>
								<td>2019.06.18.</td>
								<td>2019.06.21.</td>
								<td>-</td>
							</tr>
							<tr>
								<td>4
									<input type="checkbox" id="check4" class="checkSel">
                                    <label for="check4"></label>
								</td>
								<td style="text-align:left;padding:10px;">중앙 합동검증 후 공문으로 1차 자료 제출</td>
								<td style="text-align:left;padding:10px;">○ 통계 작성자료(입력용 엑셀파일), 통계대장, 착오․오류내역<br/>※ 시·도는 시·군·구 자료를 취합하여 제출, 작성기준일 미도래(19.6.30 기준) 통계 제외</td>
								<td>2019.06.28.</td>
								<td>2019.06.28.</td>
								<td>-</td>
							</tr>
							<tr>
								<td>5
									<input type="checkbox" id="check5" class="checkSel">
                                    <label for="check5"></label>
								</td>
								<td style="text-align:left;padding:10px;">확인통계 자치단체 자료 확인</td>
								<td style="text-align:left;padding:10px;">○ 중앙부처 통계자료 취합 후 별도 확인</td>
								<td>2019.07.01.</td>
								<td>2019.08.31.</td>
								<td>-</td>
							</tr>
							<tr>
								<td>6
									<input type="checkbox" id="check6" class="checkSel" checked>
                                    <label for="check6"></label>
								</td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:90%;" value="통계 최종 수정시한"></td>
								<td><textarea name="" id="" cols="" rows="4" style="width:95%;">통계 최종 수정시한</textarea></td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:90%;" value=""></td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:90%;" value="2019.08.31."></td>
								<td><input class="register_input" type="text" name="" placeholder="" style="width:90%;" value=""></td>
							</tr>
						</tbody>
					</table>
					<div class="tb_bt"><a href="#" class="btn blue">추가</a><a href="#" class="btn blue">삭제</a><a href="#" class="btn red">저장</a><a href="#" class="btn red">이메일전송</a></div>
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