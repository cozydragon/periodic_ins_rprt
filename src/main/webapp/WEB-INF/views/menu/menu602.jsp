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
					<h4 class="title_txt02">????????????????????? ?????? ???????????? ??????</h4>
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
									<th style="text-align:left;padding:10px">??????????????? ????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">??????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">?????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">?????????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">?????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;??????
									</td>
									<th style="text-align:left;padding:10px">????????????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">?????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">??????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">??????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">?????????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">?????????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">??????????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;???
									</td>
									<th style="text-align:left;padding:10px">????????????</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="">&nbsp;m
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">?????????</th>
									<td colspan="5">
										<table class="register_tb" >
											<colgroup>
												<col width="34%;">
												<col width="33%;">
												<col width="33%;">
											</colgroup>
											<thead>
												<tr>
													<th>???</th>
													<th>???????????? ?????????</th>
													<th>????????? ?????????</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">???????????????</th>
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
													<th>???</th>
													<th>??????</th>
													<th>??????</th>
													<th>??????</th>
													<th>U??? ??????</th>
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
									<th style="text-align:left;padding:10px">?????????????????????</th>
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
													<th>???</th>
													<th>??????</th>
													<th>????????????</th>
													<th>????????????</th>
													<th>???????????????</th>
													<th>????????????</th>
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
									<th style="text-align:left;padding:10px">???????????????</th>
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
													<th>???</th>
													<th>????????????</th>
													<th>?????????</th>
													<th>??????</th>
													<th>?????????</th>
													<th>???????????????</th>
													<th>???????????????</th>
													<th>????????????????????????</th>
													<th>????????????</th>
													<th>??????????????????</th>
													<th>???????????? ??????</th>
													<th>??????</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:85%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="" style="width:80%;">&nbsp;???</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<th style="text-align:left;padding:10px">????????????</th>
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
													<th>???</th>
													<th>??????</th>
													<th>??????</th>
													<th>?????????</th>
													<th>???????????????</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
													<td><input class="register_input" type="text" name="" placeholder="">&nbsp;???</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="tb_bt"><a href="#" class="btn blue">?????????</a><a href="#" class="btn blue">??????</a><a href="#" class="btn red">????????????</a></div>
				</div>



				<div class="footer">
				??  2019 All rights reserved.
				</div>
			</div>
			
		</div>

	<!-- </div> -->
	
</div>

</body>
</html>