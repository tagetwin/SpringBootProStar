<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%@ include file="../include/nav.jsp"%>
	<div class="container">
	
		<div class="row" style="margin-top: 75px">
		<c:forEach items="${board}" var="board">
			<div class="col-md-8 col-sm-12 col-12 mb-5">
				<div class="card">
					<div class="card-header d-flex">
						<div>
							<a href="#"><img class="otherProfile" src="/img/star.png"  alt="이미지가 없습니다."/></a><a href="/board/${board.username}">${board.username}</a>
						</div>
						<div class="ml-auto more">
							<i class="fas fa-ellipsis-h fa-2x"></i>
						</div>
					</div>
					<div class="card-body">
						<img src="/media/${board.fileName}"  width="100%"  alt="이미지가 없습니다."/>
					</div>
					<div class="card-footer d-flex">
						<div class="star">
						<c:choose>
							<c:when test="${board.star eq 1}">
								<i class="fas fa-star fa-2x" id="${board.id}" >${board.star}</i>
								<input type="text" id="star${board.id}" value="${board.star}"/>
							</c:when> 
							<c:otherwise>
								<i class="far fa-star fa-2x" id="${board.id}" >${board.star}</i>
								<input type="text" id="star${board.id}" value="${board.star}"/>
							</c:otherwise>
						</c:choose>
<%-- 							<i class="far fa-star fa-2x" id="star${board.id}" >${board.star}</i> --%>
<%-- 							<input type="hidden" id="star${board.id}" value="${board.star}"/> --%>
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
							<a>${board.starCount}명</a>이 좋아합니다.
						</p>
						<table border="1">
							<tr>
								<td class='my_td'><a href="/${board.username}">${board.username}</a></td>
								<td>${board.content}</td>
							</tr>
						</table>
						<table border="1" id="reple${board.id}">
						<c:forEach items="${board.listComment}" var="comment">
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
			</c:forEach>
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

	<!-- 부트스트랩 js, jquery 추가 -->
	<script src="/js/lib/jquery-3.4.1.min.js"></script>
	<script src="/js/lib/bootstrap.min.js"></script>
	<script src="/js/all.js"></script>
	<script>
	function logout(){
		$('#logout_Form').submit();
		alert('로그아웃되었습니다.');
	}

    $(function(){
    });
    
	$('.star').children('i').on('click',function(){
		
        let boardId = $(this).attr('id');
        let userId = $('#userId').val();
        
        let starNo = '#star'+boardId;
        
     	let star = $(starNo).val();
     	alert(star);
     	
        if(star == 0){

			let data={
				boardId : boardId,
				userId : userId
			}
			
			$.ajax({

				type : 'PUT',
				url : '/plusStar',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json'
			}).done(function(r){
				if(r.statusCode === 200){
					console.log(r);
					  $('#'+boardId).addClass('fas fa-star fa-2x');
			            star++;
					alert('별추가 성공');
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

				type : 'PUT',
				url : '/minusStar',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json'
			}).done(function(r){
				if(r.statusCode === 200){
					console.log(r);
					alert('별제거 성공');
		            $('#'+boardId).removeClass('fas');
		            $('#'+boardId).addClass('far');
		            star--;
				}

			}).fail(function(){
				alert('별제거 실패');
			});
            
        }

	});

	$('.more').on('click',function(){
		alert('폼 or 모달 생성');
	});
	
	
	$('button').on('click', function(e){

		let no =$(this).attr('value');
		let repleContent = '#repleContent'+no;
// 		let userId = '#userId'+no;
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

