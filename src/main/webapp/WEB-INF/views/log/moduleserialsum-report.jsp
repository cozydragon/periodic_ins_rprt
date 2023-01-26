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
                    <h1 class="page-header">모듈 사용 이력</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							모듈별 사용 내역
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="overflow-y:scroll;height:600px;" >
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row">
                            <div class="col-sm-10">
                           	<!-- 검색 옵션 들어갈 자리 -->
	                            <div id="dataTables-example_filter" class="dataTables_filter">
									<label>메시지</label>
									<select class="form-control" name="operation_code" id="operation_code">
										<option value="">전체</option>
										<c:forEach var="code_regist" items="${code_regist}">
											<option value="<c:out value="${code_regist.code}" />"
													<c:if test="${param.operation_code eq code_regist.code or operation_code eq code_regist.code}">selected="selected"</c:if>>
												<c:out value="${code_regist.code_name}"/>
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
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="모듈SERIAL" style="width: 80px; text-align: center;">모듈SERIAL</th>
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="SERIAL명" style="width: 80px; text-align: center;">SERIAL명</th>
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="사이트명" style="width: 80px; text-align: center;">사이트명</th>
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="합계" style="width: 80px; text-align: center;">합계</th>
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="올해" style="width: 80px; text-align: center;">${thisyear}</th>
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="1년전" style="width: 80px; text-align: center;">${lastyear}</th>
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="2년전" style="width: 80px; text-align: center;">${twoyearsago}</th>
											<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="3년이전" style="width: 80px; text-align: center;">${threeyearsover}</th>
										</thead>
										<tbody>

										<c:forEach items="${list}" var="registActivateDTO">
											<tr role="row">
												<td style="text-align: center;">${registActivateDTO.module_serial}</td>
												<td style="text-align: center;">${registActivateDTO.serial_name}</td>
												<td style="text-align: center;">${registActivateDTO.site_name}</td>
												<td style="text-align: center;"><fmt:formatNumber value="${registActivateDTO.summary}" pattern="#,###"/></td>
												<td style="text-align: center;"><fmt:formatNumber value="${registActivateDTO.yearcur}" pattern="#,###"/></td>
												<td style="text-align: center;"><fmt:formatNumber value="${registActivateDTO.yearcur_1}" pattern="#,###"/></td>
												<td style="text-align: center;"><fmt:formatNumber value="${registActivateDTO.yearcur_2}" pattern="#,###"/></td>
												<td style="text-align: center;"><fmt:formatNumber value="${registActivateDTO.yearcur_3}" pattern="#,###"/></td>
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

        $("#searchBtn").on("click",function(){

			self.location = "/log/moduleserialsum-report"
                +"?operation_code="
                +$("#operation_code").val();

		});
		
		$("#excelBtn").on("click",function(){

			self.location = "/excelDownload"
				+"?target=moduleserialsum-report"
            	+"&operation_code="
            	+$("#operation_code").val()
            ;

		});


		
	});
	
	
	
	
	</script>
	
	
</body>

</html>