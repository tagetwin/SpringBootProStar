<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>

<div class="container">
	<div class="row" style="margin-top: 75px">
		<div class="col-md-4 list-group">
			<a href="/user/profile" class="list-group-item list-group-item-action">프로필 편집</a>
			<a href="/user/password" class="list-group-item list-group-item-action active">비밀번호 변경</a>
			<a href="#" class="list-group-item list-group-item-action">Third item</a>
			<a href="#" class="list-group-item list-group-item-action">Fourth item</a>
			<a href="#" class="list-group-item list-group-item-action">Fifth item</a>
			<a href="#" class="list-group-item list-group-item-action">Sixth item</a>
			<a href="#" class="list-group-item list-group-item-action">Seven item</a>
			<a href="#" class="list-group-item list-group-item-action">Eight item</a>
		</div>
		<div class="col-md-8 pt-3" style="border: 1px solid gray;">
			<div class="row">
				<div class="col-sm-4 text-right">
					<img src="/media/${principal.profile}" width="50px" alt="">
				</div>
				<div class="col-sm-8 pt-2">${principal.username}</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-sm-4 text-right pt-2">
					<label for="password">현재 비밀번호</label>
				</div>
				<div class="col-sm-8">
					<input type="password" id="password" class="form-control w-75" />
					<div id="currentPassword"></div>
				</div>

			</div>
			<br/>
			<div class="row">
				<div class="col-sm-4 text-right pt-2">
					<label for="password1">새 비밀번호</label>
				</div>
				<div class="col-sm-8">
					<input type="password" id="password1" class="form-control w-75"/>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-sm-4 text-right pt-2">
					<label for="password2">새 비밀번호 확인</label>
				</div>
				<div class="col-sm-8">
					<input type="password" id="password2" class="form-control w-75"/>
					<div id="password_check"></div>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-sm-4 text-right">
				</div>
				<div class="col-sm-8 text-right mr-1">
					<button id="password_btn" class="btn btn-primary">제출</button>
				</div>
			</div>
		</div>
	</div>
</div>
<footer class="text-center mt-5">
	<ul id="footer">
		<li><a>Stargram 정보</a></li>
		<li><a>도움말</a></li>
		<li><a>홍보센터</a></li>
		<li><a>API</a></li>
		<li><a>채용정보</a></li>
		<li><a>개인정보처리방침</a></li>
		<li><a>약관</a></li>
		<li><a>디렉터리</a></li>
		<li><a>프로필</a></li>
		<li><a>해시태그</a></li>
		<li><a>언어</a></li>
		<li>© 2020 STAGRAM FROM YNDG</li>
	</ul>
</footer>
<!-- 부트스트랩 js, jquery 추가 -->
<script src="/js/lib/jquery-3.4.1.min.js"></script>
<script src="/js/lib/bootstrap.min.js"></script>
<script src="/js/all.js"></script>
<script>

	$('#password_btn').on('click', function(){

		let password1 = $('#password1').val();
		let password2 = $('#password2').val();

		if( password1 !== password2){
			let res = `<div class="p text-danger">두 비밀번호가 일치하는지 확인하세요</div>`;
			$('#password_check').append(res);
		}else if(password1.trim()!==''){
			$('#currentPassword').empty();
			$('#password_check').empty();
			let data = {
				password : $('#password').val(),
				password1 :password1,
				password2 : password2
			};

			$.ajax({
				type : 'PUT',
				url : '/user/updatePassword',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json'

			}).done(function(r){
				// console.log(r);
				if(r.statusCode === 200){
					alert('비밀번호 변경 성공');
					$('#password').val('');
					$('#password1').val('');
					$('#password2').val('');
					$('#currentPassword').empty();
				}

			}).fail(function(r){
				if(r.status === 400){
					let res = '';
					res += `<div class="p text-danger">현재 비밀번호가 일치하지 않습니다.</div>`;
					$('#currentPassword').append(res);
				}
				console.log(r);
				// alert('비밀번호 변경 실패');
			});
		}else{
			alert('비밀번호를 입력해주세요');
		}


	});
	
</script>
</body>
</html>
