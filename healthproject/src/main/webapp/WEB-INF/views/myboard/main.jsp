<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

						<form id="frmSendValue">
						</form>
                        
                       	<!-- 광고 슬라이드 -->    
						<style>
						.carousel-caption h5 {
						    font-size: calc(10px + 1vw);
						    text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
						}
						.carousel-caption p {
						    font-size: calc(15px + 1.5vw);
						    text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
						}
						@media (max-width: 991px) {
						    .carousel-caption {
						        display: none;
						    }
						}
						</style>
						
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000">
						    <ol class="carousel-indicators">
						        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						    </ol>
						    <div class="carousel-inner">
						        <div class="item active">
						            <img src="${contextPath}/resources/images/img1.jpg" class="d-block w-100" alt="..." style="height:500px;">
						            <div class="carousel-caption" style="right:200px; bottom: 5px; text-align: right;">
						                <h5 class="font-weight-bold" style="color: #d9d6c3;">건강의 시작</h5>
						                <p class="font-weight-bold" style="color: #d9d6c3;">남녀노소 맞춤형 플랜!</p>
						            </div>
						        </div>
						        <div class="item">
						            <img src="${contextPath}/resources/images/img2.jpg" class="d-block w-100" alt="..." style="height:500px;">
						            <div class="carousel-caption" style="right:200px; bottom: 5px; text-align: right;">
						                <h5 class="font-weight-bold" style="color: #d9d6c3;">근육의 끝</h5>
						                <p class="font-weight-bold" style="color: #d9d6c3;">우수한 강사진과 함께하는 완벽한 관리! </p>
						            </div>
						        </div>
						        <div class="item">
						            <img src="${contextPath}/resources/images/img3.jpg" class="d-block w-100" alt="..." style="height:500px;">
						            <div class="carousel-caption" style="right:200px; bottom: 5px; text-align: right;">
						                <h5 class="font-weight-bold" style="color: #d9d6c3;">솔데스크 헬창클럽!</h5>
						                <p class="font-weight-bold" style="color: #d9d6c3;">수많은 기구를 월 2만7천원에!</p>
						            </div>
						        </div>
						    </div>
						    <a class="left carousel-control" href="#carouselExampleIndicators" role="button" data-slide="prev">
						        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						        <span class="sr-only">Previous</span>
						    </a>
						    <a class="right carousel-control" href="#carouselExampleIndicators" role="button" data-slide="next">
						        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						        <span class="sr-only">Next</span>
						    </a>
						</div>
						
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            공지사항
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/noticeBoard/list'">+</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th> </th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="noticeBoard" items="${noticeBoard.noticeboardList}" begin="0" end="4">
                                        <tr class="moveNoticeBoardDetail" data-npost_number="${noticeBoard.npost_number}">
                                            <td>공지</td>                                          
                                            <td>${noticeBoard.ntitle }</td>
                                            <td>${noticeBoard.nwriter }</td>
                                            <td>${noticeBoard.nregister_date }</td>
                                        	<td>${noticeBoard.nview_count }</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            자유게시판
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/freeBoard/list'">+</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="freeBoard" items="${freeBoard.freeboardList}" begin="0" end="4">
                                        <tr class="moveFreeBoardDetail" data-fpost_number="${freeBoard.fpost_number}">
                                            <td>${freeBoard.fpost_number }</td>
                                            <td>${freeBoard.ftitle }</td>
                                            <td>${freeBoard.fwriter }</td>
                                            <td>${freeBoard.fregister_date }</td>
                                            <td>${freeBoard.fview_count }</td>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg- -->
            </div><!-- /.row -->

            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원권
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/ticket/list'">+</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>정기권</th>
                                            <th>가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="ticket" items="${ticket}" begin="0" end="5">
                                        <tr class="moveTicketDetail" data-ticket_number="${ticket.ticket_number}">
                                            <td>${ticket.ticket_content}</td>
                                            <td>${ticket.ticket_price }</td>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            오늘의 추천운동
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/workout/list'">+</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                   	<c:choose>
					     			<c:when test="${principal eq 'anonymousUser'}">
					     				<tr>
				     						<th>목표를 설정해보세요</th>
				     					</tr>
					     			</c:when>
					     			<c:otherwise>
									    <tr>
									        <th colspan="3">${principal.username}님의 ${member.member_goal}를 응원합니다.</th>
									    </tr>
									    <c:forEach items="${workoutList}" var="workout" varStatus="loop">
									        <c:if test="${workout.workout_target eq member.member_goal}">
									            <td class="moveDetail" data-workout_code="${workout.workout_code}" style="text-align:left;">
									        	[<c:out value="${workout.workout_target}" />] <c:out value="${workout.workout_name}"/></td>
									        </c:if>
									    </c:forEach>
									</c:otherwise>
					    			</c:choose>
                                        
                                    </thead>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            장비&식품 SHOP
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/product/list'">+</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>상품이름</th>
                                            <th>상품가격</th>
                                            <th>상품재고</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${product}" begin="0" end="5">
                                        <tr class="moveProductDetail" data-product_number="${product.product_number}">
                                            <td>${product.product_content}</td>
                                            <td>${product.product_price}</td>
                                            <td>${product.product_stock}</td>
                                        </tr>
                                    </c:forEach>  
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
        
        <!-- /#page-wrapper -->

<script>

var frmSendValue = $("#frmSendValue") ;

$(".moveNoticeBoardDetail").on("click", function(){
	var npost_number = $(this).data("npost_number") ;
	
	frmSendValue.append("<input type='hidden' name='npost_number' value='" + npost_number + "'/>") ;
	frmSendValue.attr("action", "${contextPath}/noticeBoard/detail").attr("method", "get") ;
	frmSendValue.submit() ;
	frmSendValue.find('input[name="npost_number"]').remove() ; 
})

$(".moveFreeBoardDetail").on("click", function(){
	var fpost_number = $(this).data("fpost_number") ;
	
	frmSendValue.append("<input type='hidden' name='fpost_number' value='" + fpost_number + "'/>") ;
	frmSendValue.attr("action", "${contextPath}/freeBoard/detail").attr("method", "get") ;
	frmSendValue.submit() ;
	frmSendValue.find('input[name="fpost_number"]').remove() ; 
})


$(".moveTicketDetail").on("click", function(){
	var ticket_number = $(this).data("ticket_number") ;
	
	frmSendValue.append("<input type='hidden' name='ticket_number' value='" + ticket_number + "'/>") ;
	frmSendValue.attr("action", "${contextPath}/ticket/detail").attr("method", "get") ;
	frmSendValue.submit() ;
	frmSendValue.find('input[name="ticket_number"]').remove() ; 
})


$(".moveProductDetail").on("click", function(){
	var product_number = $(this).data("product_number") ;
	
	frmSendValue.append("<input type='hidden' name='product_number' value='" + product_number + "'/>") ;
	frmSendValue.attr("action", "${contextPath}/product/detail").attr("method", "get") ;
	frmSendValue.submit() ;
	frmSendValue.find('input[name="product_number"]').remove() ; 
})




</script>


<%@include file="../myinclude/myfooter.jsp" %>    