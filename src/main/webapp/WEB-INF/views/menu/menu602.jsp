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
					<h4 class="title_txt02">일반조정교부금 산정 기초자료 입력</h4>
				</div>				
				<div class="con">
					<div>
						<table class="register_tb">
							<colgroup>
								<col width="10%;">
								<col width="20%;">
								<col width="10%;">
								<col width="20%;">
								<col width="10%;">
								<col width="20%;">
							</colgroup>							
							<tbody>
								<tr>
									<th style="text-align:left;padding:10px">자치구의회 의원정수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
									<th style="text-align:left;padding:10px">행정구역면적</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;㎢
									</td>
									<th style="text-align:left;padding:10px">학생수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">사업체종사자수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
									<th style="text-align:left;padding:10px">세대수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;세대
									</td>
									<th style="text-align:left;padding:10px">기초생활수급자수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">영유아수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
									<th style="text-align:left;padding:10px">노인수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
									<th style="text-align:left;padding:10px">아동청소년수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">등록장애인수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;명
									</td>
									<th style="text-align:left;padding:10px">도로면적</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;㎡
									</td>
									<th style="text-align:left;padding:10px">미개설도로면적</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;㎡
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">자동차등록대수</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;대
									</td>
									<th style="text-align:left;padding:10px">도시계획면적</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;㎢
									</td>
									<th style="text-align:left;padding:10px">하천연장</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;m
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">인구수</th>
									<td colspan="5">
										<table class="register_tb" >
											<colgroup>
												<col width="34%;">
												<col width="33%;">
												<col width="33%;">
											</colgroup>
											<thead>
												<tr>
													<th>계</th>
													<th>주민등록 인구수</th>
													<th>외국인 등록수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">하수도연장</th>
									<td colspan="5">
										<table class="register_tb" >
											<colgroup>
												<col width="20%;">
												<col width="20%;">
												<col width="20%;">
												<col width="20%;">
												<col width="20%;">
											</colgroup>
											<thead>
												<tr>
													<th>계</th>
													<th>관거</th>
													<th>암거</th>
													<th>개거</th>
													<th>U형 측구</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">도로시설물연장</th>
									<td colspan="5">
										<table class="register_tb" >
											<colgroup>
												<col width="20%;">
												<col width="16%;">
												<col width="16%;">
												<col width="16%;">
												<col width="16%;">
												<col width="16%;">
											</colgroup>
											<thead>
												<tr>
													<th>계</th>
													<th>교량</th>
													<th>고가차도</th>
													<th>보도육교</th>
													<th>지하보차도</th>
													<th>일반터널</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;m</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">녹지대면적</th>
									<td colspan="5">
										<table class="register_tb" >
											<colgroup>
												<col width="12%;">
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
											<thead>
												<tr>
													<th>계</th>
													<th>일반녹지</th>
													<th>분리대</th>
													<th>수벽</th>
													<th>수림대</th>
													<th>간이휴게소</th>
													<th>하천변조경</th>
													<th>지하철환기구주변</th>
													<th>건물주변</th>
													<th>아파트및학교</th>
													<th>친수공간 조성</th>
													<th>기타</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:85%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;㎡</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">공무원수</th>
									<td colspan="5">
										<table class="register_tb" >
											<colgroup>
												<col width="20%;">
												<col width="20%;">
												<col width="20%;">
												<col width="20%;">
												<col width="20%;">
											</colgroup>
											<thead>
												<tr>
													<th>계</th>
													<th>구청</th>
													<th>의회</th>
													<th>보건소</th>
													<th>동주민센터</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;명</td>
												</tr>
											</tbody>
										</table>
									</td>
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