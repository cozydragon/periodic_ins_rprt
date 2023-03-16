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
					<h4 class="title_txt02">기초통계자료 생성(중앙부처)</h4>
				</div>		

				<div class="con">
					<table class=table_clear>
						<colgroup>
							<col width="10%;">
							<col width="70%;">
							<col width="20%;">
						</colgroup>							
						<tbody>
							<tr>
								<th>엑셀파일 불러오기</th>
								<td>
									<input class="register_input" type="text" name="" placeholder="" value="5.2019_중앙통계(배포용).xlsx">
								</td>
								<td>
									<a href="#" class="btn blue">엑셀파일 불러오기</a><a href="#" class="btn red">엑셀업로드</a>
								</td>
							</tr>
						</tbody>
					</table>

					<ul class="tab">
						<li class="current" data-tab="tab1"><a class="tab_sel" href="#">기초생활보장수급자수(교육급여)</a></li>
						<li data-tab="tab2"><a class="tab_sel" href="#">북한이탈주민수</a></li>
						<li data-tab="tab3"><a class="tab_sel" href="#">군사시설보호구역면적</a></li>
						<li data-tab="tab4"><a class="tab_sel" href="#">연령별인구수</a></li>
						<li data-tab="tab5"><a class="tab_sel" href="#">월별인구수</a></li>
						<li data-tab="tab6"><a class="tab_sel" href="#">행정구역면적</a></li>
						<li data-tab="tab7"><a class="tab_sel" href="#">도농복합시(행정구역면적, 인구수)</a></li>
						<li data-tab="tab8"><a class="tab_sel" href="#">농어촌도로연장</a></li>
						<li data-tab="tab9"><a class="tab_sel" href="#">자전거인프라</a></li>
						<li data-tab="tab10"><a class="tab_sel" href="#">...</a></li>
					</ul>

					<!-- 기초생활보장수급자수(교육급여) -->
					<div id="tab1" class="user_infotable">
						<h4 class=title_txt>▶ 기초생활보장수급자수(교육급여)</h4>
						<table class="register_tb">
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th rowspan="2">단체별</th>
									<th colspan="3">입력란(기준 2019.6월말)</th>
									<th colspan="3">전년통계(기준 2018.6월말)</th>
									<th colspan="3">증감률</th>
									<th rowspan="2">증감사유</th>
								</tr>
								<tr>
									<th>소계</th>
									<th>일반</th>
									<th>시설</th>
									<th>소계</th>
									<th>일반</th>
									<th>시설</th>
									<th>계</th>
									<th>일반</th>
									<th>시설</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><font color="red">서&nbsp;&nbsp;&nbsp;울</font></td>
									<td></td>
									<td></td>
									<td></td>
									<td>49,091</td>
									<td>47,519</td>								
									<td>1,572</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">본&nbsp;&nbsp;&nbsp;청</td>
									<td></td>
									<td></td>
									<td></td>
									<td>-</td>
									<td>-</td>								
									<td>-</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;구&nbsp;&nbsp;&nbsp;계</td>
									<td></td>
									<td></td>
									<td></td>
									<td>49,091</td>
									<td>47,519</td>								
									<td>1,572</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">종로구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>479</td>
									<td>475</td>								
									<td>4</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">중&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>567</td>
									<td>545</td>								
									<td>22</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">용산구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>954</td>
									<td>874</td>								
									<td>80</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">성동구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,323</td>
									<td>1,285</td>								
									<td>38</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">광진구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,828</td>
									<td>1,824</td>								
									<td>4</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">동대문</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,922</td>
									<td>1,909</td>								
									<td>13</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">중랑구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>3,641</td>
									<td>3,615</td>								
									<td>26</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">성북구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,493</td>
									<td>2,456</td>								
									<td>37</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">강북구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,890</td>
									<td>2,866</td>								
									<td>24</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">도봉구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,568</td>
									<td>2,564</td>								
									<td>4</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">노원구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>3,657</td>
									<td>3,606</td>								
									<td>51</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">은평구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>3,891</td>
									<td>3,428</td>								
									<td>463</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">서대문</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,476</td>
									<td>1,400</td>								
									<td>76</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">마포구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,098</td>
									<td>1,070</td>								
									<td>28</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">양천구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,482</td>
									<td>2,437</td>								
									<td>45</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">강서구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>3,063</td>
									<td>3,030</td>								
									<td>33</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">구로구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,654</td>
									<td>1,547</td>								
									<td>107</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">금천구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,699</td>
									<td>1,657</td>								
									<td>42</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">영등포</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,041</td>
									<td>984</td>								
									<td>57</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">동작구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,474</td>
									<td>1,364</td>								
									<td>110</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">관악구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,189</td>
									<td>2,109</td>								
									<td>80</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">서초구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>990</td>
									<td>931</td>								
									<td>59</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">강남구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,481</td>
									<td>1,461</td>								
									<td>20</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">송파구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,290</td>
									<td>2,281</td>								
									<td>9</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">강동구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,941</td>
									<td>1,801</td>								
									<td>140</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><font color="red">부&nbsp;&nbsp;&nbsp;산</font></td>
									<td></td>
									<td></td>
									<td></td>
									<td>24,350</td>
									<td>23,391</td>								
									<td>959</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">본&nbsp;&nbsp;&nbsp;청</td>
									<td></td>
									<td></td>
									<td></td>
									<td>-</td>
									<td>-</td>								
									<td>-</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;구&nbsp;&nbsp;&nbsp;계</td>
									<td></td>
									<td></td>
									<td></td>
									<td>24,350</td>
									<td>23,391</td>								
									<td>959</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">중&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>392</td>
									<td>392</td>								
									<td>-</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">서&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,343</td>
									<td>1,000</td>								
									<td>343</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">동&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>972</td>
									<td>956</td>								
									<td>16</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">영도구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,463</td>
									<td>1,397</td>								
									<td>66</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">부산진</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,290</td>
									<td>2,266</td>								
									<td>24</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">동래구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,397</td>
									<td>1,335</td>								
									<td>62</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">남&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,722</td>
									<td>1,682</td>								
									<td>40</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">북&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,133</td>
									<td>2,129</td>								
									<td>4</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">해운대</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,690</td>
									<td>2,634</td>								
									<td>56</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">사하구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,494</td>
									<td>2,438</td>								
									<td>56</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">금정구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,696</td>
									<td>1,561</td>								
									<td>135</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">강서구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>517</td>
									<td>458</td>								
									<td>59</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">연제구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,295</td>
									<td>1,255</td>								
									<td>40</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">수영구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>990</td>
									<td>962</td>								
									<td>28</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">사상구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,699</td>
									<td>1,694</td>								
									<td>5</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">기&nbsp;&nbsp;&nbsp;장</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,257</td>
									<td>1,232</td>								
									<td>25</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><font color="red">대&nbsp;&nbsp;&nbsp;구</font></td>
									<td></td>
									<td></td>
									<td></td>
									<td>18,841</td>
									<td>18,191</td>								
									<td>650</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">본&nbsp;&nbsp;&nbsp;청</td>
									<td></td>
									<td></td>
									<td></td>
									<td>-</td>
									<td>-</td>								
									<td>-</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;구&nbsp;&nbsp;&nbsp;계</td>
									<td></td>
									<td></td>
									<td></td>
									<td>18,841</td>
									<td>18,191</td>								
									<td>650</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">중&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>506</td>
									<td>485</td>								
									<td>21</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">동&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,635</td>
									<td>2,537</td>								
									<td>98</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">서&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,168</td>
									<td>2,091</td>								
									<td>77</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">남&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>2,039</td>
									<td>1,878</td>								
									<td>161</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">북&nbsp;&nbsp;&nbsp;구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>3,029</td>
									<td>2,969</td>								
									<td>60</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">수성구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>3,085</td>
									<td>2,895</td>								
									<td>190</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">달서구</td>
									<td></td>
									<td></td>
									<td></td>
									<td>3,906</td>
									<td>3,865</td>								
									<td>41</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td style="text-align:right;">달&nbsp;&nbsp;&nbsp;성</td>
									<td></td>
									<td></td>
									<td></td>
									<td>1,473</td>
									<td>1,471</td>								
									<td>2</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tb_bt"><a href="#" class="btn blue">등록</a><a href="#" class="btn blue">상세</a></div>
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