<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">workout - detail</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<h4>운동정보 상세<c:out value="${workout.workout_target}"/></h4>
				</div><%-- /.panel-heading --%>
                
                <div class="panel-body">
					<div class="form-group">
						<label>운동 이름</label>
							<input class="form-control" name="workout_name" value='<c:out value="${workout.workout_name}"/>'
								   readonly="readonly" />
					</div>
					<div class="form-group">
						<label>운동 내용</label>
							<input class="form-control" name="workout_content" value='<c:out value="${workout.workout_content}"/>'
								   readonly="readonly"/>
					</div>
					<div class="form-group">
						<label>운동 주의사항</label>
							<input class="form-control" name="workout_warning" value='<c:out value="${workout.workout_warning}"/>'
								   readonly="readonly"/>
					</div>
						
					<button type="button" class="btn btn-default" id="BtnMoveModify" data-oper="modify">수정</button>
					<button type="button" class="btn btn-info" id="BtnMoveList" data-oper="list">목록</button>

          </div><%-- /.panel-body --%>
            
        </div><%-- /.panel --%>
    </div><%-- /.col-lg-12 --%>
</div><%-- /.row --%>
  

</div><%-- /#page-wrapper --%>

<%-- Modal --%>
<div class="modal fade" id="yourModal" tabindex="-1" role="dialog" aria-labelledby="yourModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="yourModalLabel">Modal title</h4>
            </div>
            <div class="modal-body" id="yourModal-body">메시지</div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div><%-- /.modal-content --%>
    </div><%-- /.modal-dialog --%>
</div><%-- /.modal --%>

<script>
//상품정보 수정-삭제 페이지로 이동
$("#BtnMoveModify").on("click", function(){
 location.href='${contextPath}/workout/modify?workout_code=<c:out value="${workout.workout_code}"/>';
})
//상품 목록 페이지로 이동
$("#BtnMoveList").on("click", function(){
 location.href="${contextPath}/workout/list";
})
</script>

<%@include file="../myinclude/myfooter.jsp" %>    