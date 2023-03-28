<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

									
									<ul>
									<c:if test="${!empty fnBoardPopupList}">	
												<c:forEach items="${fnBoardPopupList}" var="list" varStatus="sts">
												<li data-link="${list.extField2}" data-target="_self">
													<img src="${filePath1}${list.saveFilename}" alt="${list.subject}" />
												</li>
												</c:forEach>
											</c:if>
									</ul>
    
    
	<!-- 사이드 바 메뉴-->
	  <!-- 패널 타이틀1 -->
		<div class="scroll_style">
			<ul class="nav_1d">
				<li><a href="/home"><i class="fa fa-home"></i><span class="title">홈</span></a></li>
				
				<c:if test="${!empty sessionScope.menuDTO}">

				<c:forEach items="${sessionScope.menuDTO}" var="list" varStatus="sts">
				
					<c:if test="${list.getMenu_lvl() == 1}">
						<li><a href="#"><i class="fa fa-clipboard"></i><span class="title">${list.getMenu_nm()}</span><span class="arrow"></span></a>
					</c:if>
					
						<c:if test="${list.getMenu_lvl() == 2}">																	
							<ul class="nav_2d">
		 						<li><a href="${list.getMenu_url()}">서버 상태점검</a></li>
							</ul>
						</c:if>
						
					<c:if test="${list.getMenu_lvl() == 2}">
					</li>
					</c:if>
					
				</c:forEach>
				</c:if>
												
<!-- 
				<li><a href="#"><i class="fa fa-clipboard"></i><span class="title">정기점검내역</span><span class="arrow"></span></a>
					<ul class="nav_2d">
 						<li><a href="/menu/menu101">서버 상태점검</a></li>
 						<li><a href="/menu/menu102">Storage 점검</a></li>
					</ul>
				</li>

				<li><a href="#"><i class="fa fa-user-plus"></i><span class="title">환경설정</span><span class="arrow"></span></a>
					<ul class="nav_2d">
						<li><a href="/menu/menu1001"><font color="red">사용자 관리</font></a></li>
						<li><a href="/menu/menu1002"><font color="red">메뉴 관리</font></a></li>
						<li><a href="/menu/menu1003"><font color="red">권한별 메뉴 관리</font></a></li>
						
					</ul>
				</li>
 -->				
		</div>