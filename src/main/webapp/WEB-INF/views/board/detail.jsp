<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<%@ include file="../include/nav.jsp" %>

	<div class="container">
	
		<div class="row" style="margin-top: 75px">
			<div class="col-md-8 col-sm-12 col-12 mb-5">
				<div class="card">
					<div class="card-header d-flex">
						<div>
							<a href="/board/${board.username}"><img class="otherProfile" src="/media/${board.profile}"  alt="이미지가 없습니다."/></a><a href="/board/${board.username}">${board.username}</a>
						</div>
						<div class="ml-auto more">
							<span class="btn" data-toggle="modal" data-target="#myListModal"><i class="fas fa-ellipsis-h fa-2x"></i></span>
						</div>
					</div>
					<div class="card-body">
						<img src="/media/${board.fileName}"  width="100%"  alt="이미지가 없습니다."/>
					</div>
					<div class="card-footer d-flex">
						<div class="star">
						<c:choose>
							<c:when test="${star eq 1}">
								<i class="fas fa-star fa-2x" id="${board.id}" ></i>
								<input type="hidden" id="star${board.id}" value="${star}"/>
							</c:when>
							<c:otherwise>
								<i class="far fa-star fa-2x" id="${board.id}" ></i>
								<input type="hidden" id="star${board.id}" value="${star}"/>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="ml-4">
							<a href="/board/detail/${board.id}"><i class="far fa-comment fa-2x"></i></a>
						</div>
						<div class="ml-4">
							<a><i class="far fa-share-square fa-2x"></i></a>
						</div>
						<div class="favorite ml-auto">
							<c:choose>
								<c:when test="${favorite eq 1}">
									<a href="/favorite/${board.id}"><i class="fas fa-bookmark fa-2x"></i></a>
									<input type="hidden" class="id" value="${board.id}" />
									<input type="hidden" id="favorite${board.id}" value="${favorite}" />
								</c:when>
								<c:otherwise>
									<a href="/favorite/${board.id}"><i class="far fa-bookmark fa-2x"></i></a>
									<input type="hidden" class="id" value="${board.id}" />
									<input type="hidden" id="favorite${board.id}" value="${favorite}" />
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="card-body">
						<p>
							<a id="starCount${board.id}">${board.starCount}</a>명이 좋아합니다.
						</p>
						<table> 
							<tr class="font-weight-bold h5">
								<td class='my_td'>${board.username}</td>
								<td>${board.content}</td>
							</tr>
						</table>
						<table id="reple${board.id}">
						<c:forEach items="${comment}" var="comment">
							<tr>
								<td class="my_td"><a>${comment.username}</a></td>
								<td>${comment.content}</td>
							</tr>
						</c:forEach>
						</table>
					</div>
					<div class="card-footer d-flex">
						<div class="input-group mb-3">
							<input id="repleContent${board.id}" type="text" class="form-control reple_input" placeholder="댓글 달기..." required="required"/>
							<input id="boardId${board.id}" type="hidden" value="${board.id}"/>
							<div class="input-group-append">
								<button id="reple_btn${board.id}" class="btn btn-dark" type="submit" value="${board.id}">게시</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="myList_user" class="col-4" style="position: fixed; top:100px; right:70px">
				<div class="row">
					<div class="col-2 mb-3 text-center mt-4">
						<a><img id="myProfile" src="/media/${principal.profile}" alt="" /></a>
					</div>
					<div class="col-10">
						<input id="userId" type="hidden" value="${principal.id}"/>
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

	  <!-- The Modal -->
  <div class="modal" id="myListModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        
        <!-- Modal body -->
        <div class="modal-body text-center text-danger" style="border-bottom: 1px solid gray;">
         부적절한 콘텐츠 신고
        </div>
        <div class="modal-body text-center text-danger" style="border-bottom: 1px solid gray;">
         팔로우 취소
        </div>
        <div class="modal-body text-center" style="border-bottom: 1px solid gray;">
         <a href="/board/detail/${board.id}">게시물로 이동</a>
        </div>
        <div class="modal-body text-center" style="border-bottom: 1px solid gray;">
         공유하기
        </div>
        <div class="modal-body text-center" style="border-bottom: 1px solid gray;">
         링크 복사
        </div>
        <div class="modal-body text-center" style="border-bottom: 1px solid gray;">
         퍼가기
        </div>
        <div class="modal-body text-center" data-dismiss="modal" style="border-bottom: 1px solid gray;">
         취소
        </div>
      </div>
    </div>
  </div>


<!-- 부트스트랩 js, jquery 추가 -->
<script src="/js/lib/jquery-3.4.1.min.js"></script>
<script src="/js/lib/bootstrap.min.js"></script>
<script src="/js/all.js"></script>
<script>
$('.favorite').on('click',function(e){
	e.preventDefault();
	let a = $(this).children();
	let href = a.attr('href');
	let i = a.children();
// 	let status = i.attr('class');
// 	i.removeClass('far');
// 	let status2 = i.attr('class');
// 	i.addClass('fas');

	let boardId= $(this).children('input').val();
// 	console.log(boardId);

	let favoriteNo = '#favorite'+boardId;
	let favorite= $(favoriteNo).val();
// 	alert(favorite);

	if(favorite == 0){
		$.ajax({

			type : 'POST',
			url : '/favorite/'+boardId,
			dataType : 'json'
		}).done(function(r){
			if(r.statusCode === 200){
// 				console.log(r);
				i.removeClass('far');
			  	i.addClass('fas');
	        	$('#favorite'+boardId).val(1);
			}

		}).fail(function(){
			alert('북마크추가 실패');
		});
	}else{
		$.ajax({

			type : 'DELETE',
			url : '/favorite/'+boardId,
			dataType : 'json'
		}).done(function(r){
			if(r.statusCode === 200){
// 				console.log(r);
				i.removeClass('fas');
			  	i.addClass('far');
	        	$('#favorite'+boardId).val(0);
			}

		}).fail(function(){
			alert('북마크제거 실패');
		});
	}

})



$('.star').children('i').on('click',function(){
	
    let boardId = $(this).attr('id');
    let userId = $('#userId').val();
    
    let starNo = '#star'+boardId;
    
 	let star = $(starNo).val();
 	star = Number(star);
 	
 	let starCount = $('#starCount'+boardId).text();
 	starCount = Number(starCount);
    if(star === 0){

		let data={
			boardId : boardId,
			userId : userId
		}
		
		$.ajax({

			type : 'POST',
			url : '/star',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r){
			if(r.statusCode === 200){
// 				console.log(r);
			  	$('#'+boardId).addClass('fas');
				$(starNo).val(1);
	        	let c= starCount+1;
				$('#starCount'+boardId).text(c);
			}

		}).fail(function(){
			alert('별추가 실패');
		});
		
    }else {

    	let data={
				boardId : boardId,
				userId : userId
		}
		
    	$.ajax({

			type : 'DELETE',
			url : '/star',
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json'
		}).done(function(r){
			if(r.statusCode === 200){
// 				console.log(r);
	            $('#'+boardId).removeClass('fas');
	            $('#'+boardId).addClass('far');
	            $(starNo).val(0);
	            let c= starCount-1;
				$('#starCount'+boardId).text(c);
			}

		}).fail(function(){
			alert('별제거 실패');
		});
        
    }

});

$('button').on('click', function(e){

	let no =$(this).attr('value');
	let repleContent = '#repleContent'+no;
//		let userId = '#userId'+no;
	let boardId = '#boardId'+no;
	let reple = '#reple'+no

	if($(repleContent).val().trim()==""){
		alert('댓글을 입력해주세요');
	}else{
	
	let data = {
		content : $(repleContent).val(),
		userId : $('#userId').val(),
		boardId : $(boardId).val()
	};
	$.ajax({

		type : 'POST',
		url : '/comment',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json'
	}).done(function(r){
		if(r.status.statusCode === 200){
			console.log(r);

            let res = '';
            res += "<tr>";
			res += "<td class='my_td'><a>"+r.username+"</a></td>";
			res += "<td>"+r.content+"</td>";
			res += "</tr>";
			$(reple).prepend(res);
			
			alert('댓글쓰기 성공');
		}

	}).fail(function(){
		alert('댓글등록실패');
	});
	}
})
</script>
</body>
</html>

