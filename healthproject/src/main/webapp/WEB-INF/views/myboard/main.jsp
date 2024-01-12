<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">메인 홈페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<h1>광고화면</h1>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            공지사항
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/noticeBoard/list'">+</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
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
                                        <tr>
                                            <td>공지</td>
                                            <td>${noticeBoard.ntitle }</td>
                                            <td>${noticeBoard.nwriter }</td>
                                            <td>${noticeBoard.nregister_date }</td>
                                        	<td>${noticeBoard.nview_count }</td>
                                        </tr>
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
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            자유게시판
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/noticeBoard/list'">+</button>
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
                                        <tr>
                                            <td>${freeBoard.fpost_number }</td>
                                            <td>${freeBoard.ftitle }</td>
                                            <td>${freeBoard.fwriter }</td>
                                            <td>${freeBoard.fregister_date }</td>
                                            <td>${freeBoard.fview_count }</td>
                                        </tr>
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
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원정보
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr text-align=center;>
                                            <th>저희 짐의 회원이 되어 보세요</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><button type="button" style="float:right" onclick="location.href='${contextPath}/myLogin'">로그인</button></td>
                                            <td><button type="button" style="float:right" onclick="location.href='${contextPath}/user/memberRegister'">회원가입</button></td>
                                        </tr>
                                    </tbody>
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
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-4">
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
                                        <tr>
                                            <td>${ticket.ticket_content}</td>
                                            <td>${ticket.ticket_price }</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            장비&식품 SHOP
                            <button type="button" style="float:right" onclick="location.href='${contextPath}/ticket/list'">+</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive table-bordered">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>상품이름</th>
                                            <th>가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>프로틴파우더(초코맛) 1.2kg</td>
                                            <td>58,000원</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>프로틴파우더(바닐라맛) 1.2kg</td>
                                            <td>58,000원</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>훈제 닭가슴살 10개</td>
                                            <td>22,000원</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>헬스 스트랩</td>
                                            <td>17,000원</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>헬스 벨트</td>
                                            <td>35,000원</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>무릎 보호대</td>
                                            <td>19,000원</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            오늘의 추천운동
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>목표를 설정해보세요</th>
                                        </tr>
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
            <!-- /.row -->
            
        </div>
        <!-- /#page-wrapper -->


<%@include file="../myinclude/myfooter.jsp" %>    