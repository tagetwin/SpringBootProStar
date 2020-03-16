<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/nav.jsp"%>


    <div class="container">
      <div class="row" style="margin-top: 75px">
        <div class="col-md-3 mt-5">
          <img id="writeListImg" src="/media/${user.profile}" alt="" />
        </div>
        <div class="col-md-9 mt-5">
          <table style="height: 200px;">
            <tr>
              <td>${user.username}</td>
              <c:if test="${principal.username eq user.username}">
              <td><a href="/user/profile" class="btn btn-outline-secondary"><b>프로필편집</b></a></td>
              </c:if>
            </tr>
            <tr>
              <td>게시글 : ${countList.writeCount}</td>
              <td>팔로워 : ${countList.followerCount}</td>
              <td>팔로우 : ${countList.followCount}</td>
            </tr>
            <tr>
              <td colspan="3">${user.info}</td>
            </tr>
          </table>
        </div>
      </div>
      <hr />
      <div class="d-flex justify-content-center mb-2">
      	<c:if test="${principal.username eq user.username}">
        <div class="mr-5"><button class="btn" id="writeList_btn">게시물</button></div>
<!--         <div class="mr-5"><button class="btn">IGTV</button></div> -->
 		
        <div class="mr-5"><button class="btn" id="favorite_btn">저장됨</button></div>
        </c:if>
<!--         <div><button class="btn">태그됨</button></div> -->
      </div>
    
    <div class="listorwrite">  
	<c:if test="${empty board}">
		<c:choose>
			<c:when test="${principal.username eq user.username}">
				<div class="text-center mt-5"><i class="fas fa-edit fa-4x"></i></div>
				<div class="h3 text-center mt-3">게시물을 작성해주세요</div>
				<div class="text-center"><a href="write" class="btn btn-info">작성하기</a></div>
			</c:when>
			<c:otherwise>
				<div class="h3 text-center mt-3">게시물이 없습니다.</div>
			</c:otherwise>
		</c:choose>
	</c:if>
	</div>
      <div class="row wait">
      <c:forEach var="board" items="${board}">
        <div class="col-md-4 mb-5 album" >
          <a href="/board/detail/${board.id}">
            <img src="/media/${board.fileName}" alt="이미지가 없습니다."/>
          </a>
        </div>
        </c:forEach>
      </div>
    </div>

    <!-- 부트스트랩 js, jquery 추가 -->
    <script src="/js/lib/jquery-3.4.1.min.js"></script>
    <script src="/js/lib/bootstrap.min.js"></script>
    <script src="/js/all.js"></script>
    <script>
    $(function(){
       $('.writeList').addClass('fas');
    });

	$('.album').on('mouseover', function(){
		})
    $('#writeList_btn').on('click', function(){
		$('.wait').empty();
		$.ajax({
			type : 'GET',
			url : '/writeList',
		}).done(function(r){
			for(key in r){
			var res = '';
			res += "<div class='col-md-4 mb-5 album'>";
			res += "<a href=/board/detail/"+r[key].id+">";
	        res += "<img src=/media/"+r[key].fileName+"/></a></div>";
	        $('.wait').append(res);
			}
		}).fail(function(){
			alert('북마크불러오기 실패');
		});
		
	})
	$('#favorite_btn').on('click', function(){
		$('.wait').empty();
		$.ajax({
			type : 'GET',
			url : '/favorite',
		}).done(function(r){
			for(key in r){
			var res = '';
			res += "<div class='col-md-4 mb-5 album'>";
			res += "<a href=/board/detail/"+r[key].id+">";
	        res += "<img src=/media/"+r[key].fileName+"/></a></div>";
	        $('.wait').prepend(res);
			}
		}).fail(function(){
			alert('북마크불러오기 실패');
		});
		
	});
	
    </script>
  </body>
</html>

