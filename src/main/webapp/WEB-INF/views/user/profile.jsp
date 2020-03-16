<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>

<div class="container">
	<div class="row" style="margin-top: 75px">
		<div class="col-md-4 list-group">
			<a href="/user/profile" class="list-group-item list-group-item-action active">프로필 편집</a>
			<a href="/user/password" class="list-group-item list-group-item-action">비밀번호 변경</a>
<!-- 			<a href="#" class="list-group-item list-group-item-action">Third item</a> -->
		</div>
		<div class="col-md-8 pt-3" style="border: 1px solid gray;">
			<div class="row">
				<div class="col-md-4 text-right test">
					<img id="test" src="/media/${profile.profile}" style="width:50px; height: 50px; border-radius: 25px; cursor: pointer;"  alt="" data-toggle="modal" data-target="#myModal">
				</div>
				<div class="col-md-8 my-auto text-primary" data-toggle="modal" data-target="#myModal" style="cursor: pointer;">
					프로필 사진 바꾸기
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

<!-- The Modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal body -->
			<div class="modal-body upload">
				<button class="text-primary btn btn-default w-100 mt-3" id="upload">사진 업로드</button>
				<form id="ajaxForm" method="post">
					<!-- display:none으로 화면상에서 파일 확인 창을 숨겨둔다 -->
					<input type="file" id="ajaxFile" onChange="ajaxFileChange();" style="display: none;"/>
	<%--				<input type="button" onClick="ajaxFileUpload();" value="업로드"/>--%>
				</form>
			</div>
			
			<div class="modal-body profile_default">
				사진 삭제
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
	
		</div>
	</div>
</div>
<!-- 부트스트랩 js, jquery 추가 -->
<script src="/js/lib/jquery-3.4.1.min.js"></script>
<script src="/js/lib/bootstrap.min.js"></script>
<script src="/js/all.js"></script>
<script>
	$('.profile_default').on('click', function(){
	});

	$('#upload').on('click',function () {
		$('#ajaxFile').click();
		
	});

	function ajaxFileChange() {
		// 파일이 선택되면 업로드를 진행한다.
		ajaxFileTransmit();
	}

	function ajaxFileTransmit() {
		let form = $("ajaxForm")[0];
		let formData = new FormData(form);
		formData.append("message", "파일 확인 창 숨기기");
		formData.append("file", $("#ajaxFile")[0].files[0]);

		$.ajax({
			type : "POST",
			url : "/upload",
			contentType : false,
			data : formData,
			processData : false
		}).done(function (r) {
			console.log(r);
			$('#test').attr("src",'/media/'+r);
			$('#myModal').modal('hide');
			// alert('업로드 성공');

		}).fail(function () {
			alert('업로드 실패');
		});
	}



	$('#img_btn').on('click',function(){
		$('#test').attr("src",'/media/star3.png');
	});

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
