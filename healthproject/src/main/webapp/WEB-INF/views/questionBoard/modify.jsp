<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

<div id="page-wrapper">
    <div class="row">

    </div><%-- /.row --%>
    
    <div class="row">
        <div class="col-lg-8" style="min-width:1000px">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<h4>게시글 수정 - 삭제 </h4>
				</div><%-- /.panel-heading --%>
                <div class="panel-body">
                
                <form role="form" id="frmModify" method="post" name="frmBoard" >
                
					<div class="form-group">
						<label>글번호</label>
							<input class="form-control" name="qpost_number" value='<c:out value="${questionBoard.qpost_number}"/>'
								   readonly="readonly" />
					</div>
					<div class="form-group">
						<label>글제목</label>
							<input class="form-control" name="qtitle" value='<c:out value="${questionBoard.qtitle}"/>'/>
					</div>
					<div class="form-group">
						<label>글내용</label>
						<textarea class="form-control" rows="5" name="qcontent"
								><c:out value="${questionBoard.qcontent}"/></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label>
							<input class="form-control" name="qwriter" value='<c:out value="${questionBoard.qwriter}"/>'
								   readonly="readonly"/>
					</div>
					
					
					<sec:authorize access="isAuthenticated()" >
						<sec:authentication property="principal" var="principal"/>
						<c:if test="${principal.username eq questionBoard.qwriter}">
							<button type="button" class="btn btn-primary btn-sm btn-frmModify" id="btnModify" data-oper="modify">수정</button>
		 					<button type="button" class="btn btn-primary btn-sm btn-frmModify" id="btnRemove" data-oper="remove">삭제</button>
		 				</c:if>
					</sec:authorize>	
 					
 							<button type="button" class="btn btn-warning btn-sm btn-frmModify" id="btnList" data-oper="list">취소</button>
 					
		  	<sec:csrfInput/>
		  </form>
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
//form의 수정/삭제/목록보기 버튼 클릭 에벤트 처리
var frmModify = $("#frmModify");

var loginUser = "";

<sec:authorize access="isAuthenticated()">
 	loginUser = '<sec:authentication property="principal.username"/>';
</sec:authorize>

$(".btn-frmModify").on("click", function(e){ 

	var operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장
	var qwriter_value = '<c:out value="${questionBoard.qwriter}"/>';
	if (operation == "modify" && !confirm("수정하시겠습니까?")) {
	    return;
	} else if (operation == "remove" && !confirm("정말로 삭제하시겠습니까?")) {
	    return;
	}
 
 	if(operation == "list"){//게시물 목록 화면 요청
 		//기존 페이징 데이터 input 요소 복사
 		var pageNumInput = $("input[name='pageNum']").clone(); //추가
 		var rowAmountInput = $("input[name='rowAmountPerPage']").clone(); //추가
 		var scopeInput = $("input[name='scope']").clone(); //추가
 		var keywordInput = $("input[name='keyword']").clone(); //추가
 
		frmModify.empty();

 		frmModify.attr("action","${contextPath}/myboard/list").attr("method","get");
		frmModify.append(pageNumInput); //추가
 		frmModify.append(rowAmountInput); //추가
 		frmModify.append(scopeInput); //추가
 		frmModify.append(keywordInput); //추가
 
 	} else {
 		<%--로그인 안한 경우--%>
 		if(!loginUser){
 			alert("로그인 후, 수정/삭제가 가능합니다.");
 			return ;
 		}
 
 		<%--로그인 계정과 작성자가 다른 경우--%>
 		if(qwriter_value != loginUser){
 			alert("작성자만 수정/삭제가 가능합니다");
 			return ;
 
 		}
 	}
 
if(operation == "modify"){ //게시물 수정 요청
frmModify.attr("action", "${contextPath}/questionBoard/modify");
} else if(operation == "remove"){ //게시물 삭제 요청
frmModify.attr("action", "${contextPath}/questionBoard/remove");
} else if(operation == "list"){ //게시물 목록 화면 요청
frmModify.attr("action","${contextPath}/questionBoard/list").attr("method","get");
frmModify.empty();
}
 
frmModify.submit() ; //요청 전송
});

</script>

<%@include file="../myinclude/myfooter.jsp" %>    