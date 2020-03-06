<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ include file="../include/nav.jsp"%>
	<div class="container" style="margin-top: 70px">
		<div class="row">
			<div class="p col-12 mb-3" style="color: gray">탐색 탭</div>
			<c:forEach items="${board}" var="board">
				<div class="col-4 mb-4 album">
					<a href="/board/detail/${board.id}"><img src="/media/${board.fileName}" alt="이미지가 없습니다."/></a>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 부트스트랩 js, jquery 추가 -->
	<script src="/js/lib/jquery-3.4.1.min.js"></script>
	<script src="/js/lib/bootstrap.min.js"></script>
	<script src="/js/all.js"></script>
	<script>
		$('.album').on('mouseover', function(){
			// alert('마우스오버');
			$(this).children('img').css("background-color","black");
			$(this).css("opacity","1");
		})
	</script>
</body>
</html>

