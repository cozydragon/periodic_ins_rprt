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
                <%@ include file="../include/sidebar_admin.jsp" %>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">관리자Home</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                         	지점 종류
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row">


							</div>
							<div class="row">
                           	<div class="col-sm-12">
                           		<table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row">
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="지점" style="width: 68px; text-align: center;">지점</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="내역" style="width: 195px; text-align: center;">내역</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="종류" style="width: 101px; text-align: center;">종류</th>
                                    	<th aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="지역" style="width: 101px; text-align: center;">지역</th>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${list}" var="registActivateDTO">
                                  	<tr role="row">
                                        <td style="text-align: center;">${registActivateDTO.activate_date}</td>
                                        <td style="text-align: center;">${registActivateDTO.operation_code}</td>
                                        <td style="text-align: center;">${registActivateDTO.message}</td>
                                        <td style="text-align: center;">${registActivateDTO.cnt}</td>
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
</body>

</html>