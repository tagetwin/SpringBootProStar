<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Stargram</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="/css/lib/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
.otherProfile {
	height: 40px;
	width: 40px;
	border-radius: 20px;
}

#myProfile {
	height: 60px;
	width: 60px;
	border-radius: 30px;
}

.p {
	font-size: small;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="#"><i class="far fa-star fa-2x"></i></a>
		<form class="form-inline search" action="/board/search">
			<input class="form-control mr-sm-2" style="width: 200px" type="text" placeholder="Search" />
			<button class="btn btn-success" type="submit">Go</button>
		</form>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"><i class="far fa-compass fa-2x"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i class="far fa-heart fa-2x"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i class="far fa-user fa-2x"></i></a></li>
			</ul>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>
	<br />
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						<a href="#"><img class="otherProfile" src="/img/b1.jpg" /></a>팔로우중인 유저네임
					</div>
					<div class="card-body">
						<img src="/img/본문.png" />
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
							<a>0000명</a>이 좋아합니다.
						</p>
						<p>
							<a>작성자</a>본문
						</p>
						<p>
							<a>댓글작성자</a>댓글본문
						</p>
						<p>
							<a>댓글작성자</a>댓글본문
						</p>
					</div>
					<div class="card-footer d-flex">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="댓글 달기..." />
							<div class="input-group-append">
								<button class="btn btn-dark" type="submit">게시</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-2 mb-3 text-center mt-4">
						<a><img id="myProfile" src="/img/star2.png" alt="" /></a>
					</div>
					<div class="col-10">
						<div class="font-weight-bold">나의 유저네임</div>
						<div class="p">Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores atque quas error, ea earum modi numquam dolore reiciendis
							corporis culpa!</div>
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
	<script></script>
</body>
</html>

