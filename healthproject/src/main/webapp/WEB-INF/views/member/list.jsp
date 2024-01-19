<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

<style>
 th {text-align: center;}
</style>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Member - List</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    <div class="row">
        <div class="col-lg-12">
        
            <div class="panel panel-default">
                <div class="panel-heading">
					<div class="row">
						<div class="col-md-6" style="font-size:20px; height: 45px; padding-top:10px;">회원 목록</div>
					</div>
				</div><%-- /.panel-heading --%>
                
                <div class="panel-body">
<form id="frmSendValue">
</form>                
	<table class="table table-striped table-bordered table-hover" 
	       style="width:100%;text-align: center;">
	    <thead>
	        <tr>
	            <th>회원 아이디</th>
	            <th>회원 이름</th>
	            <th>회원 등록일</th>
	            <th>구매 정기권</th>
	        </tr>
	    </thead>
	    <tbody>
			<c:forEach items="${memberList}" var="member">
				<tr class="moveDetail" data-member_id="${member.member_id}">
					<td><c:out value="${member.member_id}" /></td>
					<td style="text-align:left;" ><c:out value="${member.member_name}"/></td>
					<td class="center"><fmt:formatDate value="${member.member_register_date }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
					<td><c:out value="${member.ticket_number}"/></td>
				</tr>
			</c:forEach>              

                    </tbody>
                </table><%-- /.table-responsive --%>

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

var frmSendValue = $("#frmSendValue") ;
var result = '<c:out value="${result}" />' ;

//상세페이지 이동
$(".moveDetail").on("click", function(){
	var member_id = $(this).data("member_id") ;
	
	frmSendValue.append("<input type='hidden' name='member_id' value='" + member_id + "'/>")
	frmSendValue.attr("action", "${contextPath}/member/detail").attr("method", "get") ;
	frmSendValue.submit() ;
	frmSendValue.find('input[name="member_id"]').remove() ;  	
	
});

//모달 호출 함수
function runModal(result) {
	
	if (result.length == 0) {
		return ;
	
	} else if ( result == "successRemove" ) {
		var myMsg =  "게시글이 삭제되었습니다. " ;
		
	} else if ( parseInt(result) > 0 ) {
		var myMsg =  result + "번 게시글이 등록되었습니다. "
	
	} 

	
	//$(".modal-body").html(myMsg) ;
	$("#yourModal-body").html(myMsg) ;
	
	$("#yourModal").modal("show") ;
	
	myMsg = "" ;
}


$(document).ready(function(){
	runModal(result) ;
	
	window.addEventListener("popstate", function(event){
		history.pushState(null, null, location.href) ;
		
	});
	
	history.pushState(null, null, location.href) ;
	
});



</script> 

<%@include file="../myinclude/myfooter.jsp" %>    