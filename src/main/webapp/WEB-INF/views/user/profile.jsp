<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>

<div class="container">
	<div class="row" style="margin-top: 75px">
		<div class="col-md-4 list-group">
			<a href="/user/profile" class="list-group-item list-group-item-action active">프로필 편집</a>
			<a href="/user/password" class="list-group-item list-group-item-action">비밀번호 변경</a>
			<a href="#" class="list-group-item list-group-item-action">Third item</a>
			<a href="#" class="list-group-item list-group-item-action">Fourth item</a>
			<a href="#" class="list-group-item list-group-item-action">Fifth item</a>
			<a href="#" class="list-group-item list-group-item-action">Sixth item</a>
			<a href="#" class="list-group-item list-group-item-action">Seven item</a>
			<a href="#" class="list-group-item list-group-item-action">Eight item</a>
		</div>
		<div class="col-md-8 pt-3" style="border: 1px solid gray;">
			<div class="row">
				<div class="col-md-4 text-right">
					<img src="/media/${profile.profile}" width="50px" alt="">
				</div>
				<div class="col-md-8 pt-2">
					<input type="file" id="img_btn"/>프로필 사진 바꾸기
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-4 text-right">
					<label>이름</label>
				</div>
				<div class="col-md-8">
					<p>${profile.username}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 text-right">
					<label for="info">소개</label>
				</div>
				<div class="col-md-8">
					<textarea id="info" class="form-control w-75" rows="5" cols="40">${profile.info}</textarea>
<!-- 					<input type="text" id="info" value=""/> -->
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-8 text-left">개인정보</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-4 text-right">
					<label for="email">이메일</label>
				</div>
				<div class="col-md-8">
					<input type="email" id="email" class="form-control w-75" value="${profile.email}"/>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-4 text-right">
					<label for="phoneNum">전화번호</label>
				</div>
				<div class="col-md-8">
					<input type="tel" id="phoneNum" class="form-control w-75" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" value="${profile.phoneNum}" maxlength="11"/>
				</div>
			</div>
			<br/>
			<br/>
			<div class="row">
				<div class="col-md-4 text-right">
				</div>
				<div class="col-md-8 text-right mr-1">
					<button id="profile_btn" class="btn btn-primary">제출</button>
				</div>
			</div>
			<br/>
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


	// $('a').on('click',function(){
	// 	$('.list-group-item').removeClass('active');
	// 	$(this).addClass('active');
	//
	// });
	
	$('#profile_btn').on('click', function(){
		let patt = new RegExp("[0-1]{3}[0-9]{4}[0-9]{4}");
		let res = patt.test( $("#phoneNum").val());

		if( !res ){
			alert("전화번호를 정확히 입력하여 주십시오.");
			return false;
		}

		let data = {
			info : $('#info').val(),
			email : $('#email').val(),
			phoneNum : $('#phoneNum').val()
		};

		$.ajax({
			type : 'PUT',
			url : '/profile',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
				
		}).done(function(r){
			if(r.statusCode === 200){
	        	alert('프로필변경 성공');
			}

		}).fail(function(r){
			alert('프로필변경 실패');
		});
	});
	
</script>
</body>
</html>
