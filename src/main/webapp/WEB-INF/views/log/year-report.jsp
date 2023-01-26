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
                    <h1 class="page-header">월별 통계</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	월별 통계 조회
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="overflow-y:scroll;height:600px;" >
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row">
                            <div class="col-sm-10">
                           	<!-- 검색 옵션 들어갈 자리 -->
	                            <div id="dataTables-example_filter" class="dataTables_filter">
	                            	<label> 년도 </label>
									<select name="searchYear" id="searchYear">
										<c:forEach var="code_year" items="${code_year}">
											<option value="<c:out value="${code_year.code}" />"
													<c:if test="${param.searchYear eq code_year.code}">selected="selected"</c:if>>
												<c:out value="${code_year.code}"/>
											</option>
										</c:forEach>

									</select>
	                           	</div>
                           	</div>
                           	<div class="col-sm-12" style="text-align:right;">
                           		<button class="btn btn-outline btn-info" id="searchBtn">검색</button>
	                            <button class="btn btn-success btn-excel" id="excelBtn">엑셀다운로드</button>
                           	</div>


							</div>
							<div class="row">
                           	<div class="col-sm-12">
                           		<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row">
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사이트명" style="width: 68px; text-align: center;">사이트명</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈종류" style="width: 68px; text-align: center;">모듈종류</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="주말여부" style="width: 68px; text-align: center;">주말여부</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="1월" style="width: 40px; text-align: center;">1월</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="2월" style="width: 40px; text-align: center;">2월</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="3월" style="width: 40px; text-align: center;">3월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="4월" style="width: 40px; text-align: center;">4월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="5월" style="width: 40px; text-align: center;">5월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="6월" style="width: 40px; text-align: center;">6월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="7월" style="width: 40px; text-align: center;">7월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="8월" style="width: 40px; text-align: center;">8월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="9월" style="width: 40px; text-align: center;">9월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="10월" style="width: 40px; text-align: center;">10월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="11월" style="width: 40px; text-align: center;">11월</th>
										<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="12월" style="width: 40px; text-align: center;">12월</th>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${list}" var="RegistActivateYearDTO">
                                  	<tr role="row">
                                        <td style="text-align: center;">${RegistActivateYearDTO.site_name}</td>
                                        <td style="text-align: center;">${RegistActivateYearDTO.variety_name}</td>
                                        <td style="text-align: center;">${RegistActivateYearDTO.holi_name}</td>
                                        <td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month1}" pattern="#,###"/></td>
                                        <td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month2}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month3}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month4}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month5}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month6}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month7}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month8}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month9}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month10}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month11}" pattern="#,###"/></td>
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.month12}" pattern="#,###"/></td>
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

		


		$("#searchBtn").on("click",function(){

			self.location = "/log/year-report"
				+"?searchYear="
				+$("#searchYear").val()
				;
		});
		
		$("#excelBtn").on("click",function(){

			self.location = "/excelDownload"
				+"?target=year-report"
				+"&searchYear="
				+$("#searchYear").val()
				;

		});


		
	});
	
	
	
	
	</script>
	
	
</body>

</html>