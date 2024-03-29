 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  
    
    <div class="row" style="display: flex; justify-content: center;">
        <div class="col-lg-6" style="min-width:600px">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<h4>내 정보 수정하기</h4>
				</div><%-- /.panel-heading --%>
                <form role="form" method="post" name="frmModify" id="frmModify"> 
                
                <div class="panel-body">
                	<input type="hidden" name="member_id" value="${member.member_id}"/>
					<div class="form-group">
						<label>회원 이름</label>
							<input class="form-control" name="member_name" value='<c:out value="${member.member_name}"/>'/>
					</div>
					<div class="form-group">
						<label>회원 핸드폰번호</label>
							<input class="form-control" name="member_phonenumber" value='<c:out value="${member.member_phonenumber}"/>'/>
					</div>
					<div class="form-group">
						<label>회원 키</label>
							<input class="form-control" name="member_height" value='<c:out value="${member.member_height}"/>'/>
					</div>
					<div class="form-group">
						<label>회원 몸무게</label>
							<input class="form-control" name="member_weight" value='<c:out value="${member.member_weight}"/>'/>
					</div>
					<div class="form-group">
						<label>회원 골격근량</label>
							<input class="form-control" name="member_muscle_percent" value='<c:out value="${member.member_muscle_percent}"/>'/>
					</div>
					<div class="form-group">
						<label>회원 체지방률</label>
							<input class="form-control" name="member_fat_percent" value='<c:out value="${member.member_fat_percent}"/>'/>
					</div>
					<sec:authorize access="!hasAnyAuthority('TRAINER', 'ADMIN')">
					<div class="form-group" style="display:none">
						<input name="ticket_number" value="none">
					</div>
					</sec:authorize>
						
					<div class="form-group">
						<label>목표</label> <select class="form-control" name="member_goal">
							<option value="체력개선" selected>체력개선</option>
							<option value="가슴">가슴</option>
							<option value="등">등</option>
							<option value="어깨">어깨</option>
							<option value="하체">하체</option>
						</select>
					</div>
					<sec:authorize access="hasAnyAuthority('TRAINER', 'ADMIN')">
						<div class="form-group">
							<label>가입한 회원권</label> <select class="form-control" name="ticket_number">
								<option value="none" selected>등록하실 회원권을 선택하세요.</option>
								<option value="Ticket1">이용권 3개월</option>
								<option value="Ticket2">이용권 6개월</option>
								<option value="Ticket3">이용권 12개월</option>
								<option value="Ticket4">pt 10회권</option>
								<option value="Ticket5">pt 20회권</option>
								<option value="Ticket6">pt 30회권</option>
								<option value="Ticket7">이용권 3개월 + pt 10회</option>
							</select>
						</div>
					</sec:authorize>
					
					<sec:csrfInput/>
					
                    <button type="button" class="btn btn-primary btn-sm" id="btnModify" data-oper="modify">수정</button>
                    <c:if test="${principal.username eq member.member_id}">
                    	<button type="button" class="btn btn-primary btn-sm" id="btnDelete" data-oper="delete">회원탈퇴</button>
                    </c:if>
                    <button type="button" class="btn btn-waring btn-sm" id="btnList" data-oper="list">취소</button>

                    <!-- ADMIN buttons -->
                    <sec:authorize access="hasAuthority('ADMIN')">
                        <button type="button" class="btn btn-danger btn-sm pull-right" id="btnRmove" data-oper="remove">회원삭제</button>
                        <button type="button" class="btn btn-warning btn-sm pull-right" id="btnCancel" data-oper="cancel">탈퇴요청취소</button>
                        <button type="button" class="btn btn-primary btn-sm pull-right" id="btnAuthCancel" data-oper="authcancel">강사권한삭제</button>
                        <button type="button" class="btn btn-primary btn-sm pull-right" id="btnAuth" data-oper="auth">강사권한부여</button>
                    </sec:authorize>
			  			
          	</div><%-- /.panel-body --%>
          </form>  
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
//form의 수정/삭제/목록보기 버튼 클릭 에벤트 처리
var frmModify = $("#frmModify");
$('button').on("click", function(e){ 

var operation = $(this).data("oper");
 
if(operation == "modify"){ //회원권 정보 수정 요청
	frmModify.attr("action", "${contextPath}/member/modify");
} else if(operation == "delete"){ //회원 탈퇴 신청
	frmModify.attr("action","${contextPath}/member/delete");
} else if(operation == "list"){ //회원권 목록 화면 요청
	frmModify.attr("action","${contextPath}/").attr("method","get");
	frmModify.empty();
} else if(operation == "auth"){	//강사 권한 부여
	frmModify.attr("action","${contextPath}/member/auth");
} else if(operation == "authcancel"){	//강사 권한 삭제
	frmModify.attr("action","${contextPath}/member/authcancel");
} else if(operation == "cancel"){	//회원 탈퇴 신청 취소
	frmModify.attr("action","${contextPath}/member/cancel");
} else if(operation == "remove"){	//회원 삭제
	frmModify.attr("action", "${contextPath}/member/remove");
}
 
frmModify.submit() ; //요청 전송
});

</script>
<%@include file="../myinclude/myfooter.jsp" %>  