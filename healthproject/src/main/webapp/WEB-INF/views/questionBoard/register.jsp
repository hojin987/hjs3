<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../myinclude/myheader.jsp" %>  

    <div class="row" style="display: flex; justify-content: center;">
        <div class="col-lg-8" style="min-width:1000px">
        
            <div class="panel panel-default">
                <div class="panel-heading">
                	<h4>게시글 등록</h4>
				</div><%-- /.panel-heading --%>
                
                <div class="panel-body">
					<form role="form" action="${contextPath}/questionBoard/register" method="post" name="frmBoard">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="qtitle">
						</div>
						<div class="form-group">
							<label>내용</label> <textarea class="form-control" rows="15" name="qcontent"></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> 
							<input class="form-control" name="qwriter" value="<sec:authentication property="name" />" readonly>
						</div>
							<button type="submit" class="btn btn-primary btn-sm">등록</button>
							<button type="button" class="btn btn-warning btn-sm" data-oper="list"
									onclick="location.href='${contextPath}/questionBoard/list'">취소
							</button>
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


<%-- 
<script>


</script> --%>

<%@include file="../myinclude/myfooter.jsp" %>    