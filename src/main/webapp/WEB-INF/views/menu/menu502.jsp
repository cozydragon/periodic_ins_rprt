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
					<h4 class="title_txt02">??????????????? ?????????????????? ?????? ??????</h4>
				</div>		

				<div class="con">
					<table class=table_wrap>
						<colgroup>
							<col>
						</colgroup>							
						<tbody>
							<tr>
								<td style="text-align:right;border:none;">(?????? : ??????, %)</td>
							</tr>
						</tbody>
					</table>
					<p></p>
					<table class="user_infotable">
						<colgroup>
							<col width="1%">
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
								<th rowspan="2" colspan="2">??????</th>
								<th rowspan="2">'18??? ????????? (A)<br/><br/>??????+??????+?????????</th>
								<th colspan="4">'19?????? ?????????</th>
								<th rowspan="2">????????? (C=B-A)</th>
								<th rowspan="2">????????? (C/A)</th>
							</tr>
							<tr>
								<th>??? (B)</th>
								<th>?????? (??????)</th>
								<th>?????? (??????)</th>
								<th>?????????</th>
							</tr>
							<tr>
								<td colspan="2">???&nbsp;&nbsp;&nbsp;&nbsp;???&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="410,323" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="452,118" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="424,696" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="27,422" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">41,795</td>
								<td style="text-align:right;padding:10px">10.2</td>
							</tr>
							<tr>
								<td rowspan="7"></td>
								<td>???&nbsp;&nbsp;???</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="398,034" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="438,555" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="411,955" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="26,600" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">40,521</td>
								<td style="text-align:right;padding:10px">10.2</td>
							</tr>
							<tr>
								<td>?????????</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="1,212" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="1,417" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="1,331" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="86" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">205</td>
								<td style="text-align:right;padding:10px">16.9</td>
							</tr>
							<tr>
								<td>?????????</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="38,052" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="45,996" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="43,206" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="2,790" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">7,944</td>
								<td style="text-align:right;padding:10px">20.9</td>
							</tr>
							<tr>
								<td>?????????</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="793" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="494" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="464" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="30" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">-299</td>
								<td style="text-align:right;padding:10px">-37.7</td>
							</tr>
							<tr>
								<td>???&nbsp;&nbsp;???</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="56,312" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="63,658" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="59,797" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="3,861" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">7,346</td>
								<td style="text-align:right;padding:10px">13.0</td>
							</tr>
							<tr>
								<td>???&nbsp;&nbsp;???</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="153,777" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="169,538" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="159,255" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="10,283" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">15,761</td>
								<td style="text-align:right;padding:10px">10.2</td>
							</tr>
							<tr>
								<td>???&nbsp;&nbsp;???</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="147,888" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="157,452" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="147,902" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="9,550" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">9,564</td>
								<td style="text-align:right;padding:10px">6.5</td>
							</tr>
							<tr>
								<td colspan="2">???&nbsp;???&nbsp;???&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><input class="register_input" type="text" name="" placeholder="" value="12,289" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="13,563" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="12,741" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="" style="text-align:right;padding:10px"></td>
								<td><input class="register_input" type="text" name="" placeholder="" value="822" style="text-align:right;padding:10px"></td>
								<td style="text-align:right;padding:10px">1,274</td>
								<td style="text-align:right;padding:10px">10.4</td>
							</tr>
						</tbody>
					</table>
					
					<div class="tb_bt"><a href="#" class="btn red">??????</a><a href="#" class="btn blue">??????</a><a href="#" class="btn blue">??????</a></div>
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