<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<div class="row mb-5" style="margin-top: 75px">
			<div class="p col-md-12 mb-2" style="color: gray">팔로우할 만한 계정 둘러보기</div>
			<div class="d-flex justify-content-between">
				<input type="hidden" id="userId" value="${principal.id}"/>
				<c:forEach items="${user}" var="user">
				<div class="card mr-5" style="width:150px">
					<img class="card-img-top" src="/media/${user.profile}" alt="Card image" >
					<div class="card-body">
						<p class="card-text">${user.username}</p>
						<button class="btn btn-primary follow_btn" value="${user.id}">팔로우</button>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="p col-12 mb-3" style="color: gray">탐색 탭</div>
			<c:forEach items="${board}" var="board">
			<div class="col-4 mb-4 album">
				<a href="/board/detail/${board.id}"><img src="/media/${board.fileName}" alt="이미지가 없습니다."/></a>
			</div>
			</c:forEach>
		</div>
	</div>

	<!-- 부트스트랩 js, jquery 추가 -->
	<script src="/js/lib/jquery-3.4.1.min.js"></script>
	<script src="/js/lib/bootstrap.min.js"></script>
	<script src="/js/all.js"></script>
	<script>
		$(function(){
			$('.explore').addClass('fas');
		});

		$('.follow_btn').on('click', function () {

			let userId = $('#userId').val();
			alert('유저아이디 : ' + userId);
			let followId = $(this).val();
			alert('팔로우아이디 : ' + followId);

			let data = {
				userId : userId,
				followId : followId
			}

			$.ajax({

				type : 'POST',
				url : '/follow',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json'
			}).done(function(r){
				if(r.statusCode === 200){
// 				console.log(r);
					alert('팔로우 성공');
				}

			}).fail(function(){
				alert('팔로우 실패');
			});

		});
	</script>
</body>
</html>

