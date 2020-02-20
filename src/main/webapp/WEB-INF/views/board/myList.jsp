<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="../include/nav.jsp"%>
	<div class="container">
	
		<div class="row">
<%-- 		<c:if test=""></c:if> --%>
		<c:forEach items="${board}" var="board">
			<div class="col-md-8 mb-5">
				<div class="card">
					<div class="card-header">
						<a href="#"><img class="otherProfile" src="/img/star.png" /></a><a href="/${board.username}">${board.username}</a>
					</div>
					<div class="card-body">
						<img src="/media/${board.fileName}"  width="100%"/>
					</div>
					<div class="card-footer d-flex">
						<div class="">
							<a><i class="far fa-star fa-2x"></i></a>
						</div>
						<div class="ml-4">
							<a><i class="far fa-comment fa-2x"></i></a>
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
							<a>${board.starCount}명</a>이 좋아합니다.
						</p>
						<table border="1">
							<tr>
								<td class='my_td'><a href="/${board.username}">${board.username}</a></td>
								<td>${board.content}</td>
							</tr>
						</table>
						<table border="1" id="reple">
							<tr>
								<td class="my_td"><a>{comment.username}</a></td>
								<td>{comment.content}</td>
							</tr>
						</table>
					</div>
					<div class="card-footer d-flex">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="댓글 달기..." />
							<div class="input-group-append">
								<button id="reple_btn" class="btn btn-dark" type="submit">게시</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<div id="myList_user" class="col-4" style="position: fixed; top:100px; right:70px">
				<div class="row">
					<div class="col-2 mb-3 text-center mt-4">
						<a><img id="myProfile" src="/img/${principal.profile}" alt="" /></a>
					</div>
					<div class="col-10">
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
	function logout(){
		$('#logout_Form').submit();
		alert('로그아웃되었습니다.');
	}
		

	
		$('#reple_btn').on('click', function(){

			var res = '';
			res += "<tr>";
			res += "<td width='100px'><a>r.username</a></td>";
			res += "<td>r.content</td>";
			res += "</tr>";
			$('#reple').prepend(res);				
// 			$.ajax({

// 				type : 'POST',
// 				url : '/comment',
// 				data : JSON.stringify(data),
// 				contentType : 'application/json; charset=utf-8',
// 				dataType : 'json'

// 			}).done(function(r){
// 				if(r.status.statusCode == 200){
// 					console.log(r);

// 					var res = '';
// 					res += "<tr>";
// 					res += "<td width='100px'><a>r.username</a></td>"
// 					res += "<td>r.content</td>""
// 					</tr>";`

					
// 					alert('댓글쓰기 성공');
// 				}

// 			}).fail(function(){
// 				alert('댓글등록실패');
// 			});

		})
		
	</script>
</body>
</html>

