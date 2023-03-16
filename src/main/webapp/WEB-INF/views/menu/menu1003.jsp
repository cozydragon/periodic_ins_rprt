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
   
	<%@ include file="../include/header.jsp" %>
<script src='/resources/vendor/jquery/checktree.js'></script>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="/resources/vendor/jquery/styles.css">
        <style>
        body { background-color:#fafafa;}
        .container { margin:150px auto; max-width:600px;}
        </style>
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
					<h4 class="title_txt02">권한별 메뉴관리</h4>
					<div style="float:right"><a href="#" class="btn red">권한등록</a></div>
					
				</div>				

				<div class="title_con">
					<table class="table_search">
						<colgroup>
							<col width="5%">
							<col width="10%;">							
							<col width="5%">
							<col width="10%;">							
							<col width="5%">
						</colgroup>
						
						<tbody>							
							<tr>														
								<th><label for="form-label">권한</label></th>
								<td>
									<select class="form-control">
										<option>전체</option>
										<option>행안부 교부세 담당 [ROLE001]</option>
										<option selected>시·도 교부세 담당 [ROLE002]</option>
										<option>시·군·구 교부세 담당 [ROLE003]</option>
										<option>중앙부처 시도/시군구 통계담당 [ROLE004]</option>
										<option>시도/시군구 사업담당 [ROLE005]</option>
										<option>CMS [ROLE006]</option>
									</select>
								</td>
								
								<td align="right"><a href="#" class="btn blue">검색</a></td>
							</tr>							
						</tbody>
					</table>
				</div>

				<div class="con">
					<h4 class="title_txt">권한별 메뉴 목록</h4>
				<ul class="checktree">
						<li>
						<input id="administration" type="checkbox"/><label for="administration">시·도 교부세 담당 [ROLE002]</label>
						<ul>
							<li>
								<input id="president" type="checkbox" checked/><label for="president">보통교부세[OT0000]</label>
								<ul>
									<li><input id="manager101" type="checkbox" checked/><label for="manager101">수요조사 기초자료 관리[OT0001]</label></li>
									<li><input id="manager102" type="checkbox" checked/><label for="manager102">수요조사 이상내역 검출[OT0002]</label></li>
									<li><input id="manager103" type="checkbox" checked/><label for="manager103">기초단체입력자료 검토[OT0003]</label></li>
									<li><input id="manager104" type="checkbox" checked/><label for="manager104">기초통계자료 업로드 및 수정[OT0004]</label></li>
									<li><input id="manager105" type="checkbox" checked/><label for="manager105">보통교부세 통계 일치 확인[OT0005]</label></li>
									<li><input id="manager106" type="checkbox" checked/><label for="manager106">수입 기초자료 업로드 및 수정[OT0006]</label></li>
									<li><input id="manager107" type="checkbox" checked/><label for="manager107">수입 기초자료 이상내역 검출[OT0007]</label></li>
								</ul>
							</li>
							<li>
								<input id="vicepresident" type="checkbox" /><label for="vicepresident">특별교부세[ST0000]</label>
								<ul>
									<li><input id="manager201" type="checkbox" checked/><label for="manager201">수요별 관리 카드 관리[ST0001]</label></li>
									<li><input id="manager202" type="checkbox" checked/><label for="manager202">수요별 서식 작성 및 파일 업로드[ST0002]</label></li>
									<li><input id="manager203" type="checkbox" /checked><label for="manager203">교부세 산정 적정성 확인[ST0003]</label></li>
									<li><input id="manager204" type="checkbox" checked/><label for="manager204">교부결정 사업 목록관리 및 통보[ST0004]</label></li>
									<li><input id="manager205" type="checkbox" checked/><label for="manager205">특별교부세 실시간 집행내역[ST0005]</label></li>
									<li><input id="manager206" type="checkbox" /><label for="manager206">사업진행사항 관리[ST0006]</label></li>
									<li><input id="manager207" type="checkbox" /><label for="manager207">용도변경 관리[ST0007]</label></li>
									<li><input id="manager208" type="checkbox" /><label for="manager208">집행계획 등록 관리[ST0008]</label></li>
									<li><input id="manager209" type="checkbox" /><label for="manager209">미집행,반환,감액 사업 자료관리[ST0009]</label></li>
								</ul>
							</li>
							<li>
								<input id="vicepresident" type="checkbox" /><label for="vicepresident">부동산교부세[ET0000]</label>
								<ul>
									<li><input id="manager301" type="checkbox" checked/><label for="manager301">기초 통계 항목 관리[ET0001]</label></li>
									<li><input id="manager302" type="checkbox" checked/><label for="manager302">기초산정자료 업로드 및 수정[ET0002]</label></li>
									<li><input id="manager303" type="checkbox" /checked><label for="manager303">기초산정 등록자료 검증 관리[ET0003]</label></li>
								</ul>
							</li>
							<li>
								<input id="president" type="checkbox" checked/><label for="president">감액관리[DT0000]</label>
								<ul>
									<li><input id="manager401" type="checkbox" checked/><label for="manager401">감액 심의 통계 항목 관리[DT0001]</label></li>
									<li><input id="manager402" type="checkbox" checked/><label for="manager402">감액 심의 안건등록 및 소명[DT0002]</label></li>
									<li><input id="manager403" type="checkbox" checked/><label for="manager403">감액 심의 기초자료 생성[DT0003]</label></li>
									<li><input id="manager404" type="checkbox" checked/><label for="manager404">감액심의 결정자료 관리[DT0004]</label></li>
									<li><input id="manager405" type="checkbox" checked/><label for="manager405">인센티브 결정 자료 등록[T0005]</label></li>
									<li><input id="manager406" type="checkbox" checked/><label for="manager406">감액 주요 사례 등록 관리[DT0006]</label></li>
								</ul>
							</li>
						</ul>
					</li>
			</ul>


					<div class="tb_bt"><a href="/menu/menu1002_1" class="btn blue">등록</a></div>
				</div>

				<div class="footer">
				©  2023 All rights reserved.
				</div>
			</div>
			
		</div>

	<!-- </div> -->
	
</div>
<script>
	$(function(){
		$("ul.checktree").checktree();
	});
	</script>
    <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>