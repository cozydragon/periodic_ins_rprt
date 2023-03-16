<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<!-- 사이드 바 메뉴-->
	  <!-- 패널 타이틀1 -->
		<div class="scroll_style">
			<ul class="nav_1d">
				<li><a href="/home"><i class="fa fa-home"></i><span class="title">홈</span></a></li>
				<li><a href="#"><i class="fa fa-clipboard"></i><span class="title">정기점검내역</span><span class="arrow"></span></a>
					<ul class="nav_2d">
 						<li><a href="/menu/menu101">서버 상태점검</a></li>
 						<li><a href="/menu/menu102">Storage 점검</a></li>
					</ul>
				</li>
				<!-- 				
				<li><a href="#"><i class="fa fa-clipboard"></i><span class="title">보통교부세</span><span class="arrow"></span></a>
					<ul class="nav_2d">
 						<li><a href="/menu/menu101">수요조사 기초자료 관리</a></li>
						<li><a href="/menu/menu102">수요조사 이상내역 검출</a></li>						
						<li><a href="/menu/menu103">기초단체입력자료 검토</a></li>
						<li><a href="/menu/menu104"><font color="red">기초통계자료 업로드 및 수정</font></a></li>
						<li><a href="/menu/menu105"><font color="red">보통교부세 통계 일치 확인</font></a></li>
 						<li><a href="/menu/menu106">수입 기초자료 업로드 및 수정</a></li>
						<li><a href="/menu/menu107">수입 기초자료 이상내역 검출</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="fa fa-clipboard"></i><span class="title">특별교부세</span><span class="arrow"></span></a>
					<ul class="nav_2d">
						<li><a href="/menu/menu201"><font color="red">수요별 관리 카드 관리</font></a></li>
 						<li><a href="/menu/menu202"><font color="red">수요별 서식 작성 및 파일 업로드</font></a></li>						
						<li><a href="/menu/menu203">교부세 산정 적정성 확인</a></li>
						<li><a href="/menu/menu204"><font color="red">교부결정 사업 목록관리 및 통보</font></a></li>
 						<li><a href="/menu/menu205">특별교부세 실시간 집행내역</a></li>
						<li><a href="/menu/menu206">관리카드 사업별 관리</a></li>
						<li><a href="/menu/menu207">사업진행사항 관리</a></li>
						<li><a href="/menu/menu208"><font color="red">집행계획 등록 관리</font></a></li>
						<li><a href="/menu/menu209"><font color="red">용도변경 관리</font></a></li>
						<li><a href="/menu/menu210">미집행,반환,감액 사업 자료관리</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="fa  fa-clipboard"></i><span class="title">부동산교부세</span><span class="arrow"></span></a>	               
					<ul class="nav_2d">
 						<li><a href="/menu/menu301">기초 통계 항목 관리</a></li>
						<li><a href="/menu/menu302">기초산정자료 업로드및 수정</a></li>
						<li><a href="/menu/menu303">기초산정 등록자료 검증 관리</a></li>
					</ul>					
				</li>
				<li><a href="#"><i class="fa  fa-calendar-minus-o"></i><span class="title">감액관리</span><span class="arrow"></span></a>	               
					<ul class="nav_2d">
 						<li><a href="/menu/menu401">감액 심의 통계 항목 관리</a></li>
						<li><a href="/menu/menu402">감액 심의 안건등록 및 소명</a></li>
						<li><a href="/menu/menu403">감액 심의 기초자료 생성</a></li>
						<li><a href="/menu/menu404">감액심의 결정자료 관리</a></li>
						<li><a href="/menu/menu405">인센티브 결정 자료 등록</a></li>
						<li><a href="/menu/menu406"><font color="red">감액 주요 사례 등록 관리</font></a></li>
					</ul>					
				</li>
				<li><a href="#"><i class="fa  fa-calendar-minus-o"></i><span class="title">교부세 배정</span><span class="arrow"></span></a>	               
					<ul class="nav_2d">
 						<li><a href="/menu/menu501"><font color="red">교부세 배정관리</font></a></li>
						<li><a href="/menu/menu502"><font color="red">보통교부세 교부결정금액 자료 관리</font></a></li>
						<li><a href="/menu/menu503">부동산교부세 교부결정금액 자료 관리</a></li>
						<li><a href="/menu/menu504">특별교부세 교부결정금액 자료 관리</a></li>
						<li><a href="/menu/menu505">교부세 이의신청 관리 기능</a></li>
					</ul>					
				</li>
				<li><a href="#"><i class="fa  fa-calendar-minus-o"></i><span class="title">조정교부금</span><span class="arrow"></span></a>	               
					<ul class="nav_2d">
 						<li><a href="/menu/menu601">일반조정교부금 시도별 재원규모 자료 관리</a></li>
						<li><a href="/menu/menu602"><font color="red">일반조정교부금 기초 통계항목 관리</font></a></li>
						<li><a href="/menu/menu603">일반조정교부금 기준재정 수요 분석 통계자료 관리</a></li>
						<li><a href="/menu/menu604">일반조정교부금 수입 기초자료 이상내역 검출</a></li>
						<li><a href="/menu/menu605">특별조정교부금 신청,심의,집행관리 구분별 항목 관리</a></li>
						<li><a href="/menu/menu606"><font color="red">특별조정교부금 수요별 관리카드 관리</font></a></li>
						<li><a href="/menu/menu607">특별조정교부금 수요별 서식 작성및 파일 업로드</a></li>
						<li><a href="/menu/menu608">특별조정교부금 산정 적정성 확인</a></li>
						<li><a href="/menu/menu609">교부결정 사업 목록관리 및 통보</a></li>
						<li><a href="/menu/menu609">특별조정교부금 관리카드 사업별 관리</a></li>
						<li><a href="/menu/menu610">특별조정 교부금 실시간 집행내역</a></li>
						<li><a href="/menu/menu611">특별조정교부금 관리카드 사업별 관리</a></li>
						<li><a href="/menu/menu612">특별조정교부금 사업진행사항 관리</a></li>
						<li><a href="/menu/menu613">특별조정교부금 용도변경 관리</a></li>
						<li><a href="/menu/menu614">조정교부금 산정 기능</a></li>
						<li><a href="/menu/menu615">조정교부금 이의신청 관리 기능</a></li>
						<li><a href="/menu/menu616">조정교부금별 재원관리</a></li>
						<li><a href="/menu/menu617">조정교부금별 재원관리</a></li>
						<li><a href="/menu/menu618">조정교부금 배정처리</a></li>
					</ul>					
				</li>
				<li><a href="#"><i class="fa fa-calendar-minus-o"></i><span class="title">서식관리</span><span class="arrow"></span></a>
					<ul class="nav_2d">
 						<li><a href="/menu/menu701">보통교부세 통계 입력서식 관리</a></li>
						<li><a href="/menu/menu702">보통교부세 지자체<br> 기초통계 서식관리</a></li>
						<li><a href="/menu/menu703">수입 기초자료 입력서식 관리</a></li>
						<li><a href="/menu/menu704">부동산 교부세 입력서식 관리</a></li>
						<li><a href="/menu/menu705">조정교부금 기초자료 입력서식 관리</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="fa fa-line-chart"></i><span class="title">연계관리</span><span class="arrow"></span></a>
					<ul class="nav_2d">
 						<li><a href="/menu/menu801">보통교부세 기초자료 연계</a></li>
						<li><a href="/menu/menu802">보통교부세 수입자료 연계</a></li>
						<li><a href="/menu/menu803">특별교부세 실시간 집행내역</a></li>
						<li><a href="/menu/menu804">특별교부세 용도변경 연계</a></li>
						<li><a href="/menu/menu805">특별 교부세 세출예산사업 연계</a></li>
						<li><a href="/menu/menu806">자치구 조정교부금 자료관리 연계</a></li>
						<li><a href="/menu/menu807">시도별 시도세 징수실적 자료 연계</a></li>
						<li><a href="/menu/menu808">조정교부금 기초자료 연계</a></li>
						<li><a href="/menu/menu809">특별조정교부금 세출예산사업 연계</a></li>
					</ul>
				</li>				
				<li><a href="#"><i class="fa fa-user-plus"></i><span class="title">통계현황</span><span class="arrow"></span></a>
					<ul class="nav_2d">
 						<li><a href="/menu/menu901">기초수요항목별 재원별 <br>예산액 조회</a></li>
						<li><a href="/menu/menu902">지역균형수요항목별<br>재원별 예산액 조회</a></li>
						<li><a href="/menu/menu903">전출금 종류별 재원별<br>예산액 조회</a></li>
						<li><a href="/menu/menu904">보통교부세 수요조사<br>전년대비 증감내역 조회</a></li>
						<li><a href="/menu/menu905">보통교부세 기초통계 조회</a></li>
						<li><a href="/menu/menu906">보통교부세 기초자료 재구성 조회</a></li>
						<li><a href="/menu/menu907">보통교부세 수입기초자료<br>전년대비 증감내역 조회</a></li>
						<li><a href="/menu/menu908">일반조정교부금 수입분석 기초자료 재구성 조회</a></li>
						<li><a href="/menu/menu909">내국세 및 종합부동산세 현황관리</a></li>
						
					</ul>
				</li>
				<li><a href="#"><i class="fa fa-user-plus"></i><span class="title">환경설정</span><span class="arrow"></span></a>
					<ul class="nav_2d">
						<li><a href="/menu/menu1001"><font color="red">사용자 관리</font></a></li>
						<li><a href="/menu/menu1002"><font color="red">메뉴 관리</font></a></li>
						<li><a href="/menu/menu1003"><font color="red">권한별 메뉴 관리</font></a></li>
						
 						<li><a href="/menu/menu10012"><font color="red">진행일정 관리</font></a></li>
						<li><a href="/menu/menu1004">수요기초자료 종류 및 종류별 항목 관리</a></li>
						<li><a href="/menu/menu1005">수요 기초자료 분석 항목 관리</a></li>
						<li><a href="/menu/menu1006">보통교부세산정 기초통계 항목 관리</a></li>
						<li><a href="/menu/menu1007">보통교부세 산정 수입 분석 항목 관리</a></li>
						<li><a href="/menu/menu1008">신청,심의,집행관리 구분별 항목 관리</a></li>
					</ul>
				</li>
				-->
				<li><a href="#"><i class="fa fa-user-plus"></i><span class="title">환경설정</span><span class="arrow"></span></a>
					<ul class="nav_2d">
						<li><a href="/menu/menu1001"><font color="red">사용자 관리</font></a></li>
						<li><a href="/menu/menu1002"><font color="red">메뉴 관리</font></a></li>
						<li><a href="/menu/menu1003"><font color="red">권한별 메뉴 관리</font></a></li>
						
					</ul>
				</li>
		</div>