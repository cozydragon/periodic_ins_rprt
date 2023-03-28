<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String authrt_id_sidebar = session.getAttribute("ROLE").toString(); 
  
%>
				<div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/log/day-report"><i class="fa fa-table fa-fw"></i> 로그(월/일자별)합계</a>
                            <a href="/log/month-report"><i class="fa fa-table fa-fw"></i> 로그 월별 전체내역</a>
                            <%if (authrt_id_sidebar.equals("ADMIN")) { %>
                            <a href="/log/monthlysum-report"><i class="fa fa-table fa-fw"></i> 월별 통계</a>
                            <a href="/log/moduleserialsum-report"><i class="fa fa-table fa-fw"></i> 모듈 사용 이력</a>
                            <% } %>
                        </li>
                    </ul>
                </div>