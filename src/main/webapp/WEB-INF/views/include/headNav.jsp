<%@page import="com.api.reporting.dto.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%String site_id = session.getAttribute("site_id").toString(); 
  
  UserVO userVO = (UserVO) session.getAttribute("LOGIN");
%>
             <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">기본 게시판</a>
                <a class="navbar-brand" href="/log/day-report">로그확인</a>
                <%if (authrt_id.equals("ADMIN")) { %>
                <a class="navbar-brand" href="/admin/show-site">관리자</a>
                <% } %>
               
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                     <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="/user/read-information/"><i class="fa fa-user fa-fw"></i> 사용자 정보</a>
                        </li>
                         
                        <li class="divider"></li>
                        <li><a href="/user/logout"><i class="fa fa-sign-out fa-fw"></i> 로그아웃</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->