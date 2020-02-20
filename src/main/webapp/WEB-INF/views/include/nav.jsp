<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal" />
</sec:authorize>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Stargram</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="/css/lib/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/css/style.css" />
<style>

</style>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="/board/myList"><i class="far fa-star fa-2x"></i></a>
		<form class="form-inline search" action="/board/search">
			<input class="form-control mr-sm-2" style="width: 200px" type="text" placeholder="Search" />
			<button class="btn btn-success" type="submit">Go</button>
		</form>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/board/write"><i class="far fa-edit fa-2x"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i class="far fa-compass fa-2x"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i class="far fa-heart fa-2x"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="/${principal.username}"><i class="far fa-user fa-2x"></i></a></li>
				<li class="nav-item">
				<a class="nav-link" href="javascript:void(0);" onclick="logout()"><i class="fas fa-sign-out-alt fa-2x"></i></a>
				</li>
			</ul>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>
	<form id="logout_Form" action="/logout" method="POST">
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
	</form>

	<br />