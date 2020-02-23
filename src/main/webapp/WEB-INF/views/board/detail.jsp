<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<%@ include file="../include/nav.jsp" %>

	<div class="container">
	
		<div class="row" style="margin-top: 75px">
			<div class="col-md-8 col-sm-12 col-12 mb-5">
				<div class="card">
					<div class="card-header d-flex">
						<div>
							<a href="#"><img class="otherProfile" src="/img/star.png"  alt="이미지가 없습니다."/></a><a href="/board/${board.username}">${board.username}</a>
						</div>
						<div class="ml-auto more">
							<i class="fas fa-ellipsis-h fa-2x"></i>
						</div>
					</div>
					<div class="card-body">
						<img src="/media/${board.fileName}"  width="100%"  alt="이미지가 없습니다."/>
					</div>
					<div class="card-footer d-flex">
						<div class="star">
						<c:choose>
							<c:when test="${star eq 1}">
								<i class="fas fa-star fa-2x" id="${board.id}" ></i>
								<input type="hidden" id="star${board.id}" value="${star}"/>
							</c:when>
							<c:otherwise>
								<i class="far fa-star fa-2x" id="${board.id}" ></i>
								<input type="hidden" id="star${board.id}" value="${star}"/>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="ml-4">
							<a href="/board/detail/${board.id}"><i class="far fa-comment fa-2x"></i></a>
						</div>
						<div class="ml-4">
							<a><i class="far fa-share-square fa-2x"></i></a>
						</div>
						<div class="ml-auto">
							<a><i class="far fa-bookmark fa-2x"></i></a>
						</div>
					</div>
					<div class="card-body">
						<p>
							<a id="starCount${board.id}">${board.starCount}</a>명이 좋아합니다.
						</p>
						<table border="1">
							<tr>
								<td class='my_td'><a href="/board/${board.username}">${board.username}</a></td>
								<td>${board.content}</td>
							</tr>
						</table>
						<table border="1" id="reple${board.id}">
<%-- 						<c:forEach items="${board.listComment}" var="comment"> --%>
							<tr>
								<td class="my_td"><a>{comment.username}</a></td>
								<td>{comment.content}</td>
							</tr>
<%-- 						</c:forEach> --%>
						</table>
					</div>
					<div class="card-footer d-flex">
						<div class="input-group mb-3">
							<input id="repleContent${board.id}" type="text" class="form-control reple_input" placeholder="댓글 달기..." required="required"/>
							<input id="boardId${board.id}" type="hidden" value="${board.id}"/>
							<div class="input-group-append">
								<button id="reple_btn${board.id}" class="btn btn-dark" type="submit" value="${board.id}">게시</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="myList_user" class="col-4" style="position: fixed; top:100px; right:70px">
				<div class="row">
					<div class="col-2 mb-3 text-center mt-4">
						<a><img id="myProfile" src="/media/${principal.profile}" alt="" /></a>
					</div>
					<div class="col-10">
						<input id="userId" type="hidden" value="${principal.id}"/>
						<div class="font-weight-bold">${principal.username}</div>
						<div class="p">${principal.info}</div>
					</div>
				</div>
				<div class="card">
					<div class="card-body"></div>
				</div>
			</div>
		</div>
	</div>

<!-- 부트스트랩 js, jquery 추가 -->
<script src="/js/lib/jquery-3.4.1.min.js"></script>
<script src="/js/lib/bootstrap.min.js"></script>
<script>
    
</script>
</body>
</html>

