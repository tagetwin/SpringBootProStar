<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="/css/lib/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<a href="/">홈으로</a>
		<div class="form-group">
			<form>
				<input type="text" id="title" value="${board.title}" class="form-control" /><br />
				<input type="text" id="content" value="${board.content}" class="form-control" /><br />
				<input type="text" id="id" value="${board.id}" readonly="readonly"/>
			</form>
			<button id="up_btn">수정하기</button>
		</div>
	</div>
	<!-- 부트스트랩 js, jquery 추가 -->
	<script src="/js/lib/jquery-3.4.1.min.js"></script>
	<script src="/js/lib/bootstrap.min.js"></script>
	<script>
		$('#up_btn').on('click', function(){
			var data = {
				id : $('#id').val(),
				title : $('#title').val(),
				content : $('#content').val()
			}

			$.ajax({
				type : 'PUT',
				url : '/update',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',	
				dataType : 'text'

			}).done(function(r){
				console.log(r);
				if(r == 'ok'){
					alert('수정성공')
					location.href='/';
				}


			}).fail(function(){
				alert('수정실패')

			})
						
		});
			
	</script>

</body>
</html>