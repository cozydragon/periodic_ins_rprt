<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../include/header.jsp" %>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<%@ include file="../include/headNav.jsp" %>

            <div class="navbar-default sidebar" role="navigation">
                <%@ include file="../include/sidebar_report.jsp" %>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">로그 월별 전체 내역</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	로그확인 일자별
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="overflow-y:scroll;height:600px;" >
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row">

                            <div class="col-sm-10">
                           	<!-- 검색 옵션 들어갈 자리 -->
	                            <div id="dataTables-example_filter" class="dataTables_filter">
                                    <label>사이트</label>
									<select class="form-control" name="site_id" id="site_id">
										<option value="">선택</option>
										<c:forEach var="code_site" items="${code_site}">
											<option value="<c:out value="${code_site.code}" />"
											<c:if test="${param.site_id == code_site.code }">selected="selected"</c:if>>
												<c:out value="${code_site.code_name} (${code_site.code})"/>
											</option>
										</c:forEach>
									</select>
	                            	<label> 년도 </label>
									<select name="searchYear" id="searchYear">
										<c:forEach var="code_year" items="${code_year}">
											<option value="<c:out value="${code_year.code}" />"
													<c:if test="${param.searchYear eq code_year.code}">selected="selected"</c:if>>
												<c:out value="${code_year.code}"/>
											</option>
										</c:forEach>

									</select>
	                            	<label> 월 </label>
	                            	<select name="searchMonth" id="searchMonth">
	                            		<option value="12" <c:if test="${param.searchMonth == 12}"> selected="selected" </c:if>>12</option>
	                            		<option value="11" <c:if test="${param.searchMonth == 11}"> selected="selected" </c:if>>11</option>
	                            		<option value="10" <c:if test="${param.searchMonth == 10}"> selected="selected" </c:if>>10</option>
	                            		<option value="9" <c:if test="${param.searchMonth == 9}"> selected="selected" </c:if>>9</option>
	                            		<option value="8" <c:if test="${param.searchMonth == 8}"> selected="selected" </c:if>>8</option>
	                            		<option value="7" <c:if test="${param.searchMonth == 7}"> selected="selected" </c:if>>7</option>
	                            		<option value="6" <c:if test="${param.searchMonth == 6}"> selected="selected" </c:if>>6</option>
	                            		<option value="5" <c:if test="${param.searchMonth == 5}"> selected="selected" </c:if>>5</option>
	                            		<option value="4" <c:if test="${param.searchMonth == 4}"> selected="selected" </c:if>>4</option>
	                            		<option value="3" <c:if test="${param.searchMonth == 3}"> selected="selected" </c:if>>3</option>
	                            		<option value="2" <c:if test="${param.searchMonth == 2}"> selected="selected" </c:if>>2</option>
	                            		<option value="1" <c:if test="${param.searchMonth == 1}"> selected="selected" </c:if>>1</option>
	                            	</select>
	                            	<button class="btn btn-outline btn-info" id="searchBtn">검색</button>
	                            	<button class="btn btn-success btn-excel" id="excelBtn">엑셀다운로드</button>
	                           	</div>
                           	</div>



							</div>
							<div class="row">
                           	<div class="col-sm-12">
                           		<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row">
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="일자" style="width: 68px; text-align: center;">일자</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="시간" style="width: 68px; text-align: center;">시간</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈NO" style="width: 68px; text-align: center;">모듈NO</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈SERIAL" style="width: 68px; text-align: center;">모듈SERIAL</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="내역" style="width: 70px; text-align: center;">내역</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="메시지" style="width: 150px; text-align: center;">메시지</th>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${list}" var="registActivateDTO">
                                  	<tr role="row">
                                        <td style="text-align: center;">${registActivateDTO.activate_date}</td>
                                        <td style="text-align: center;">${registActivateDTO.activate_time}</td>
                                        <td style="text-align: center;">${registActivateDTO.module_no}</td>
                                        <td style="text-align: center;">${registActivateDTO.module_serial}</td>
                                        <td style="text-align: center;">${registActivateDTO.code_nm}</td>
                                        <td style="text-align: center;">${registActivateDTO.message}</td>
                                    </tr>
                                </c:forEach>
                                 </tbody>
                            	</table>
                            </div>
                            </div>


                       	</div>
                       </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
	<%@ include file="../include/footer.jsp" %>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		var Now = new Date();

		
		if ('${param.searchYear}' == null || '${param.searchYear}' == '') {
			$("#searchYear").val(Now.getFullYear()).prop("selected", true);
		}
		
		if ('${param.searchMonth}' == null || '${param.searchMonth}' == '') {
			$("#searchMonth").val(Now.getMonth()+1).prop("selected", true);
		}

		$("#searchBtn").on("click",function(){
			
			self.location = "/admin/show-sitelog"
				+"?searchYear="
				+$("#searchYear").val()
				+"&searchMonth="
				+$("#searchMonth").val()
				+"&site_id="
				+$("#site_id").val();

		});
		
		$("#excelBtn").on("click",function(){
			
			self.location = "/excelDownload"
				+"?target=show-sitelog"
				+"&searchYear="
				+$("#searchYear").val()
				+"&searchMonth="
				+$("#searchMonth").val()
				+"&site_id="
				+$("#site_id").val();
		});


	});
	
	
	
	</script>
	
	
</body>

</html>