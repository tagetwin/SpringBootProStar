<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authorize access="isRememberMe()"> </sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Stargram</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="/css/lib/bootstrap.min.css" />
<style>
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
<body onload="document.login.username.focus();">
	<div class="container">
		<div class="card mt-5">
			<div class="card-body">
				<div class="h1 card-title">Stargram</div>
				<div class="form-group">
					<form action="login" method="post" name="login">
						<input name="username" type="text" class="form-control mb-2" placeholder="아이디" value="${username}"/>
						<input name="password" type="password" class="form-control mb-2" placeholder="비밀번호" />
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<label class="form-check-label ml-3">
							<c:choose>
								<c:when test="${not empty username}">
									<input class="form-check-input" type="checkbox" name="rememberMe" checked /> Remember me
							</c:when>
								<c:otherwise>
									<input class="form-check-input" type="checkbox" name="rememberMe" /> Remember me
							</c:otherwise>
							</c:choose>

						</label>
						<input type="checkbox" id="autoLogin" name="autoLogin" /> <label class="form-check-label">자동로그인</label>

						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							<div class="p text-danger" >
								${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
								<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
							</div>
						</c:if>
						<button type="submit" class="btn btn-primary btn-block mb-4">로그인</button>
					</form>
					
				</div>
				<div class="p text-center mb-3">
					<a href="#">페이스북으로 로그인</a>
				</div>
				<div class="p text-center text-small">
					<a href="#"><small>비밀번호를 잊으셨나요?</small></a>
				</div>
			</div>
		</div>
		<div class="card mt-3">
			<div class="card-body text-center">
				계정이 없으신가요? <a href="/">가입하기</a>
			</div>
		</div>
		<div class="p text-center my-3 ">앱을 다운로드하세요</div>
		<div class="row d-flex justify-content-center">
			<div class="col-5">
				<a href="https://itunes.apple.com/app/instagram/id389801252?pt=428156&amp;ct=igweb.signupPage.badge&amp;mt=8&amp;vt=lo"> <img
					src="img/app.png" width="150" alt="" />
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
<script>
// $('#login_btn').on('click', function() {

// 	var data = {
// 		username : $('#username').val(),
// 		password : $('#password').val()
// 	}

// 	$.ajax({
// 		type : 'POST', // 로그인만 예외로 POST. GET을 쓰면 주소에 남기때문에
// 		url : '/login',
// 		data : data,
// 		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
// 		dataType : 'json'

// 	}).done(function(r) {
// 		if(r.statusCode == 200){
// 			console.log(r);
// 			alert('로그인 성공');
// 			location.href = "/"
// 		}else if(r.statusCode == 400){
// 			console.log(r);
// 			alert('로그인 실패');
// 		}

// 	}).fail(function(r) {
// 		console.log(r);
// 		alert('로그인 실패2');
		
// 		var check =r.responseJSON;
		
// 		if(check.username != null){
// 			$('#username_check').append('<small>'+check.username+'</small>');
// 		}

// 		if(check.password != null){
// 			$('#password_check').append('<small>'+check.password+'</small>');	
// 		}

// 	});
// })

// 엔터키 치면 바로 로그인 되게	
$("#password").keydown(function(key) {
	if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
		$('#login_btn').click();
	}
});
</script>
</body>
</html>
