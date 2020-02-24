<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/nav.jsp"%>


<div class="container">
	<div class="row" style="margin-top: 75px">
		<div class="col-md-8">
			<div class="card">
				<form action="/board/write" method="post" enctype="multipart/form-data" id="write">
					<div class="card-header d-flex justify-content-between">
						<div>
							<a href="#"><img class="otherProfile" src="/media/${principal.profile}" /></a>${principal.username}
						</div>
						<div>
							<label class="btn btn-primary btn-file">이미지업로드<input type="file" name="fileName" style="display: none;" id="input_img"  onchange="checkFile(this)"/>
							</label>
						</div>
					</div>

					<div class="card-body">
						<div class="img_wrap">
							<img id="img" width="100%" />
						</div>
					</div>
					<div class="card-footer d-flex">
						<div class="input-group mb-3">
							<input type="text" name="content" class="form-control" placeholder="글쓰기..." />
							<input type="hidden" name="userId" class="form-control" value="${principal.id}"/>
							<sec:csrfInput />
							<div class="input-group-append">
								<button class="btn btn-dark" type="submit">게시</button>
							</div>	
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-4">
			<div class="row">
				<div class="col-2 mb-3 text-center mt-4">
					<a><img id="myProfile" src="/media/${principal.profile}" alt="" /></a>
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
<script src="/js/all.js"></script>
<script>
	var sel_file;
	$(document).ready(function() {
		$('#input_img').on("change", handleImgFileSelect);
	});
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	function checkFile(e){
		let file = e.files;
		if(file[0].size > 1024*1024*1){
			alert('1MB 이하의 사진만 업로드 할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
// 			e.outerHTML = e.outerHTML;
		}
		// 체크를 통과했다면 종료.
		else return;
		// 체크에 걸리면 선택된 내용 취소 처리를 해야함.
		// 파일선택 폼의 내용은 스크립트로 컨트롤 할 수 없습니다.
		// 그래서 그냥 새로 폼을 새로 써주는 방식으로 초기화 합니다.
		// 이렇게 하면 간단 !?
		$('#write')[0].reset();
		
	}
</script>
</body>
</html>

