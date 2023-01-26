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
													<c:if test="${param.searchYear eq code_year.code}"> selected="selected"</c:if>>
												<c:out value="${code_year.code}"/>
											</option>
										</c:forEach>
	                            	</select>
									<label> 월 </label>
									<select name="searchMonth" id="searchMonth">
										<option value="12" <c:if test="${param.searchMonth eq 12}"> selected="selected" </c:if>>12</option>
										<option value="11" <c:if test="${param.searchMonth eq 11}"> selected="selected" </c:if>>11</option>
										<option value="10" <c:if test="${param.searchMonth eq 10}"> selected="selected" </c:if>>10</option>
										<option value="9" <c:if test="${param.searchMonth eq 9}"> selected="selected" </c:if>>9</option>
										<option value="8" <c:if test="${param.searchMonth eq 8}"> selected="selected" </c:if>>8</option>
										<option value="7" <c:if test="${param.searchMonth eq 7}"> selected="selected" </c:if>>7</option>
										<option value="6" <c:if test="${param.searchMonth eq 6}"> selected="selected" </c:if>>6</option>
										<option value="5" <c:if test="${param.searchMonth eq 5}"> selected="selected" </c:if>>5</option>
										<option value="4" <c:if test="${param.searchMonth eq 4}"> selected="selected" </c:if>>4</option>
										<option value="3" <c:if test="${param.searchMonth eq 3}"> selected="selected" </c:if>>3</option>
										<option value="2" <c:if test="${param.searchMonth eq 2}"> selected="selected" </c:if>>2</option>
										<option value="1" <c:if test="${param.searchMonth eq 1}"> selected="selected" </c:if>>1</option>
									</select>
									<label>모듈종류</label>
									<select class="form-control" name="module_variety" id="module_variety">
										<c:forEach var="code_module_variety" items="${code_module_variety}">
											<option value="<c:out value="${code_module_variety.code}" />"
													<c:if test="${param.module_variety eq code_module_variety.code }">selected="selected"</c:if>>
												<c:out value="${code_module_variety.code_name}"/>
											</option>
										</c:forEach>
									</select>
									<label>설치대수</label>
									<select class="form-control" name="code_variety_cnt" id="code_variety_cnt">
										<c:forEach var="code_variety_cnt" items="${code_variety_cnt}">
											<option value="<c:out value="${code_variety_cnt.code}" />"
													<c:if test="${param.code_variety_cnt eq code_variety_cnt.code }">selected="selected"</c:if>>
												<c:out value="${code_variety_cnt.code_name}"/>
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
                                <tbody>
								<tr role="row">
                                    <c:choose>
                                        <c:when test="${!empty list}">
                                            <c:forEach items="${list}" var="RegistActivateYearDTO">
                                                <td style="text-align: center;">${RegistActivateYearDTO.site_name}</td>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${empty list }">
                                                <td style="text-align: center;">조회된 내역이 없습니다.</td>
                                        </c:when>

                                    </c:choose>
								</tr>
								<tr role="row">
									<c:forEach items="${list}" var="RegistActivateYearDTO">
										<td style="text-align: center;"><fmt:formatNumber value="${RegistActivateYearDTO.summary}" pattern="#,###"/></td>
									</c:forEach>
								</tr>
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

        if ('${param.searchMonth}' == null || '${param.searchMonth}' == '') {
            $("#searchMonth").val(Now.getMonth()+1).prop("selected", true);
        }

        if ('${param.code_variety_cnt}' == null || '${param.code_variety_cnt}' == '') {
            $("#code_variety_cnt").val("2");
        }

        $("#module_variety").on("change",function(){

            $.ajax({
                type: 'POST',
                url: '<c:url value="/show-variety-cnt"/>',
                data: { "module_variety" : $("#module_variety").val() },
                success: function(data) {
                    try {

                        $("#code_variety_cnt").empty().data('options');


                        for( var i=0; i<data.map.length; i++) {
                            $('#code_variety_cnt').append("<option value='"+ data.map[i]['code'] + "'>"+ data.map[i]['code_name']+"</option>");

                        }

                        if ($("#module_variety").val() == "1") {

                            $("#code_variety_cnt").val("2");

                        }


                    } catch (e) {}
                },
                error: function(request,status,error) {

                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);


                }
            });

        });

		$("#searchBtn").on("click",function(){

			self.location = "/log/monthlysum-report"
				+"?searchYear="
				+$("#searchYear").val()
                +"&searchMonth="
                +$("#searchMonth").val()
                +"&module_variety="
                +$("#module_variety").val()
                +"&code_variety_cnt="
                +$("#code_variety_cnt").val()
				;
		});
		
		$("#excelBtn").on("click",function(){

			self.location = "/excelDownload"
				+"?target=monthlysum-report"
                +"&searchYear="
                +$("#searchYear").val()
                +"&searchMonth="
                +$("#searchMonth").val()
                +"&module_variety="
                +$("#module_variety").val()
                +"&code_variety_cnt="
                +$("#code_variety_cnt").val()
				;

		});


		
	});
	
	
	
	
	</script>
	
	
</body>

</html>