<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/nav.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-8">
			<div class="card">
				<form action="/board/write" method="post" enctype="multipart/form-data">
					<div class="card-header d-flex justify-content-between">
						<div>
							<a href="#"><img class="otherProfile" src="/media/${principal.profile}" /></a>${principal.username}
						</div>
						<div>
							<label class="btn btn-primary btn-file">이미지업로드<input type="file" name="fileName" style="display: none;" id="input_img">
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
</script>
</body>
</html>

