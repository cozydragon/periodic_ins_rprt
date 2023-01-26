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
                    <h1 class="page-header">로그(월/일자별)합계</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <form id="form1" name="form1" >
            <input type="hidden" id="target" name="target" value="day-report">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	로그(월/일자별)합계 조회
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="overflow-y:scroll;height:600px;">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row">

                            <div class="col-sm-12">
                           	<!-- 검색 옵션 들어갈 자리 -->
	                            <div id="dataTables-example_filter" class="dataTables_filter">
	                               <% if (role_id.equals("ADMIN")) { %>
                                    <label>사이트</label>
									<select class="form-control" name="site_id" id="site_id">
										<option value="">선택</option>
										<c:forEach var="code_site" items="${code_site}">
											<option value="<c:out value="${code_site.code}" />"
											<c:if test="${param.site_id eq code_site.code }">selected="selected"</c:if>>
												<c:out value="${code_site.code_name} (${code_site.code})"/>
											</option>
										</c:forEach>
									</select>
									<% }else { %>
										<input type="hidden" name="site_id" id="site_id" value="<%=userVO.getSite_id()%>"> 
									<% } %>
									<label>모듈종류</label>
									<select class="form-control" name="module_variety" id="module_variety">
										<option value="">전체</option>
										<c:forEach var="code_module_variety" items="${code_module_variety}">
											<option value="<c:out value="${code_module_variety.code}" />"
											<c:if test="${param.module_variety eq code_module_variety.code }">selected="selected"</c:if>>
												<c:out value="${code_module_variety.code_name}"/>
											</option>
										</c:forEach>
									</select>
									
									<label>모듈serial</label>
									<select class="form-control" name="module_serial" id="module_serial">
										<option value="">전체</option>
										<c:forEach var="code_module" items="${code_module}">
											<option value="<c:out value="${code_module.code}" />"
											<c:if test="${param.module_serial eq code_module.code }">selected="selected"</c:if>>
												<c:out value="${code_module.code_name} (${code_module.code})"/>
											</option>
										</c:forEach>
									</select>
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
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="일자" style="width: 68px; text-align: center;">일자</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="메시지" style="width: 150px; text-align: center;">메시지</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="카운트" style="width: 101px; text-align: center;">카운트</th>
                                </thead>
                            	<tr role="row">
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="2" aria-label="전체건수" style="width: 218px; text-align: center;">전체건수</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="카운트" style="width: 101px; text-align: center;"><fmt:formatNumber value="${full_cnt}" pattern="#,###"/></th>
								</tr>            
                                <tbody>
                                
                                <c:forEach items="${list}" var="registActivateDTO">
                                  	<tr role="row">
                                  	
                                  	    <c:choose>
       									 <c:when test="${registActivateDTO.dayofweek eq 1 or registActivateDTO.dayofweek eq 7}">
                                          <td style="text-align: center;color: red;">
         								 </c:when>
      									 <c:otherwise>
        								 <td style="text-align: center;">
									     </c:otherwise>
									    </c:choose>
                                           ${registActivateDTO.activate_date}
                                        </td>
                                  	    <c:choose>
       									 <c:when test="${registActivateDTO.dayofweek eq 1 or registActivateDTO.dayofweek eq 7}">
                                          <td style="text-align: center;color: red;">
         								 </c:when>
      									 <c:otherwise>
        								 <td style="text-align: center;">
									     </c:otherwise>
									    </c:choose>
                                           ${registActivateDTO.message}
                                        </td>
                                  	    <c:choose>
       									 <c:when test="${registActivateDTO.dayofweek eq 1 or registActivateDTO.dayofweek eq 7}">
                                          <td style="text-align: center;color: red;">
         								 </c:when>
      									 <c:otherwise>
        								 <td style="text-align: center;">
									     </c:otherwise>
									    </c:choose>
                                           ${registActivateDTO.cnt}
                                        </td>

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
            </form>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    
	<%@ include file="../include/footer.jsp" %>
	
	<script type="text/javascript">
	
	$(document).ready(function(){

		var Now = new Date();

		if ($("#site_id").val() == '') {
			$("#module_serial").empty().data('options');
		}

		
		if ('${param.searchMonth}' == null || '${param.searchMonth}' == '') {
			$("#searchMonth").val(Now.getMonth()+1).prop("selected", true);
		}
		
		$("#site_id").on("change",function(){
			
			 $.ajax({
			  type: 'POST', 
			  url: '<c:url value="/show-code-module-variety"/>',
			  data: { "site_id" : $("#site_id").val() },
			  success: function(data) {
			   try {
				
				   $("#module_variety").empty().data('options'); 

				   for( var i=0; i<data.map.length; i++) {
					   if ( i == 0) {
					    $('#module_variety').append("<option value=''>전체</option>");
					   }
					    $('#module_variety').append("<option value='"+ data.map[i]['code'] + "'>"+ data.map[i]['code_name']+"</option>");
					    
					}
				   $("#module_variety").trigger('change'); 
				   	
			   } catch (e) {}
			  },
			  error: function(request,status,error) {
				  
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	
			  }
			 });
			
		});
		
		$("#module_variety").on("change",function(){
			
			 $.ajax({
			  type: 'POST', 
			  url: '<c:url value="/show-code-module-serial"/>',
			  data: { "module_variety" : $("#module_variety").val() 
				     , "site_id" : $("#site_id").val() },
			  success: function(data) {
			   try {
				
				   $("#module_serial").empty().data('options'); 

				   for( var i=0; i<data.map.length; i++) {
					   if ( i == 0) {
					    $('#module_serial').append("<option value=''>전체</option>");
					   }
					    $('#module_serial').append("<option value='"+ data.map[i]['code'] + "'>"+ data.map[i]['code_name']+"("+data.map[i]['code']+")"+"</option>");
					    
					  }
			    
			   } catch (e) {}
			  },
			  error: function(request,status,error) {
				  
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	
			  }
			 });
			
		});

		

		$("#searchBtn").on("click",function(){
			
			if ($("#site_id").val() == '') {
				
				alert('사이트를 선택하여 주십시요.');
				return false;
			}
			
	      $("#form1").attr('method', 'post');
	      $("#form1").attr("action", "/log/day-report");
		  $("#form1").submit();

		
		});
		
		$("#excelBtn").on("click",function(){
			
			if ($("#site_id").val() == '') {
				
				alert('사이트를 선택하여 주십시요.');
				return false;
			}
			
	      $("#form1").attr('method', 'post');
	      $("#form1").attr("action", "/excelDownload");
		  $("#form1").submit();

		
		});

		

	});
	

	
	</script>
	
	
</body>

</html>