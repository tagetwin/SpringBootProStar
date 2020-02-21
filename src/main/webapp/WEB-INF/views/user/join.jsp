<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Stargram</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="/css/lib/bootstrap.min.css" />
<sec:csrfMetaTags/>
<style>
.agreement:link {
	color: gray;
	text-decoration: none;
}

.agreement:visited {
	color: gray;
	text-decoration: none;
}

.agreement:hover {
	color: gray;
	text-decoration: none;
}

ul li {
	list-style-type: none;
	display: inline;
	font-size: small;
}

.h1 {
	color: black;
	font-style: italic;
	text-align: center;
}

.card-body {
	color: gray;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row mb-5">
			<div class="col-md-7 text-center mt-5">
				<img src="/img/home.jpg" alt="" />
			</div>
			<div class="col-md-5">
				<h1 style="font-style: italic;"></h1>
				<div class="card">
					<div class="card-body">
						<div class="h1 card-title">Stargram</div>
						<p class="card-text text-center">친구들의 사진과 동영상을 보려면 가입하세요</p>
						<button class="btn btn-primary btn-block mb-4">facebook으로 로그인</button>
						<div class="form-group">
							<form>
								<input id="username" class="form-control mb-2" placeholder="아이디" />
								<input id="password" type="password" class="form-control mb-2" placeholder="비밀번호" />
								<input id="email" class="form-control mb-2" placeholder="이메일" />
							</form>
								<button id="join_btn" class="btn btn-primary btn-block mb-4">가입</button>
						</div>
						<p style="text-align: center;">
							가입하면 Stargram의 <a class="font-weight-bold agreement" href="https://help.instagram.com/581066165581870">약관</a>, <a class="font-weight-bold agreement"
								href="https://help.instagram.com/519522125107875"> 데이터<br /> 정책
							</a> 및 <a class="font-weight-bold agreement" href="https://help.instagram.com/1896641480634370?ref=ig">쿠키 정책</a>에 동의하게 됩니다.
						</p>
					</div>
				</div>
				<div class="card mt-3">
					<div class="card-body text-center">
						계정이 있으신가요? <a href="login">로그인</a>
					</div>
				</div>
				<div class="p text-center my-3 ">앱을 다운로드하세요</div>
				<div class="row d-flex justify-content-center">
					<div class="col-5">
						<a href="https://itunes.apple.com/app/instagram/id389801252?pt=428156&amp;ct=igweb.signupPage.badge&amp;mt=8&amp;vt=lo"> <img src="img/app.png" width="150" alt="" />
						</a>
					</div>
					<div class="col-5">
						<a
							href="https://play.google.com/store/apps/details?id=com.instagram.android&amp;referrer=utm_source%3Dinstagramweb%26utm_campaign%3DsignupPage%26ig_mid%3D74B4FC1F-0139-42E8-A745-767A09ECEC92%26utm_content%3Dlo%26utm_medium%3Dbadge">
							<img src="img/google.png" width="150" alt="" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="text-center mt-5">
		<ul>
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
/**
 * 회원가입로직
 */

$('#join_btn').on('click', function(){
	
	var data = {
		username : $('#username').val(),
		password : $('#password').val(),
		email : $('#email').val()
	};

	$.ajax({
		type : 'POST',
		url : '/join',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8', 
		dataType:'json'
		
	}).done(function(r){

		if(r.statusCode == 200){
			console.log(r);
			alert('회원가입 성공');
			location.href = '/login'

		}else {
// 			if(r.msg == '아이디중복'){
// 				console.log(r.msg);
// 				console.log(r);
// 				$('#username_check').append('<small>'+r.msg+'</small>');
// 					alert('아이디가 중복되었습니다.');	
// 			}
				alert('회원가입 실패');
			
		}
		
	}).fail(function(r){
			console.log(r);

// 		var check =r.responseJSON;
		
// 		if(check.username != null){
// 			$('#username_check').append('<small>'+check.username+'</small>');
// 		}

// 		if(check.password != null){
// 			$('#password_check').append('<small>'+check.password+'</small>');	
// 		}			
		
// 		$('#email_check').empty();
// 		if(check.email != null){
// 			$('#email_check').append('<small>'+check.email+'</small>');
// 		}
		alert('회원가입 실패');
	});

	
});

</script>
</body>
</html>
