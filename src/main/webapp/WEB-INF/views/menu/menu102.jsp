<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="../include/header.jsp" %>
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
					<h4 class="title_txt02">기초자료확인 및 의견등록</h4>
				</div>				
				<div class="con">
					<h4 class="title_txt">신청자 정보</h4>
					<div>
						<table class="register_tb">
							<colgroup>
								<col width="10%;">
								<col width="45%;">
								<col width="10%;">
								<col width="45%;">
							</colgroup>							
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="성명을 기입하여주십시오.">
									</td>
									<th>ID</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="ID를 기입하여주십시오.">
										<a href="#" class="btn gray">확인</a>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="비밀번호를 기입하여주십시오.">
									</td>
									<th>비밀번호 확인</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="비밀번호를 확인하여주십시오.">
									</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>
										<select class="form-control" style=" width: 50%;">
											<option>전체</option>
											<option>인사</option>
											<option>경영지원</option>
											<option>IT</option>
											<option>재무</option>
											<option>마케팅/홍보</option>
										</select>
									</td>
									<th>이메일</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="이메일을 입력하여주십시오.">
									</td>
								</tr>
								<tr>
									<th>직업</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="직업을 입력하여주십시오.">
									</td>
									<th>사번</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="사번을 입력하여주십시오.">
									</td>
								</tr>
								<tr>
									<th>전화번호 1</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="전화번호를 입력하여주십시오.">
									</td>
									<th>전화번호 2</th>
									<td>
										<input class="register_input" type="text" name="" placeholder="전화번호를 입력하여주십시오.">
									</td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td colspan="3">
										<input class="register_input" type="text" name="" placeholder="휴대전화번호를 입력하여주십시오.">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="con">
					<h4 class="title_txt">결재자 정보</h4>
					<div>
						<table class="register_tb">
							<colgroup>
								<col width="10%;">
								<col width="90%;">
							</colgroup>							
							<tbody>
								<tr>
									<th>부서장 승인</th>
									<td colspan="2"><input class="register_input" type="text" name="" placeholder=""><a href="#" class="btn gray">초기화</a></td>
								</tr>
								<tr>
									<th>이름</th>
									<td colspan="2"><input class="register_input" type="text" name="" placeholder=""><a href="#" class="btn gray">검색</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="footer">
				©  2019 All rights reserved.
				</div>
			</div>
			
		</div>

</div>
</body>

</html>
