<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Stargram</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 부트스트랩 css -->
    <link rel="stylesheet" href="/css/lib/bootstrap.min.css" />
    <style>
      ul li {
        list-style-type: none;
        display: inline;
        font-size: small;
      }
      .h1 {
        color: black;
        font-style: italic;
        text-align: center;
      }
      .card-body {
        color: gray;
      }
      .container {
        width: 20%;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="card mt-5">
        <div class="card-body">
          <div class="h1 card-title">Stargram</div>
          <div class="form-group">
            <form>
              <input
                name="username"
                class="form-control mb-2"
                placeholder="아이디"
              />
              <input
                name="password"
                class="form-control mb-2"
                placeholder="비밀번호"
              />

              <button class="btn btn-primary btn-block mb-4">
                로그인
              </button>
            </form>
          </div>
          <div class="p text-center mb-3">
            <a href="#">페이스북으로 로그인</a>
          </div>
          <div class="p text-center text-small">
            <a href="#"><small>비밀번호를 잊으셨나요?</small></a>
          </div>
        </div>
      </div>
      <div class="card mt-3">
        <div class="card-body text-center">
          계정이 없으신가요?
          <a href="/">가입하기</a>
        </div>
      </div>
      <div class="p text-center my-3 ">앱을 다운로드하세요</div>
      <div class="row d-flex justify-content-center">
        <div class="col-5">
          <a
            href="https://itunes.apple.com/app/instagram/id389801252?pt=428156&amp;ct=igweb.signupPage.badge&amp;mt=8&amp;vt=lo"
          >
            <img src="img/app.png" width="150" alt="" />
          </a>
        </div>
        <div class="col-5">
          <a
            href="https://play.google.com/store/apps/details?id=com.instagram.android&amp;referrer=utm_source%3Dinstagramweb%26utm_campaign%3DsignupPage%26ig_mid%3D74B4FC1F-0139-42E8-A745-767A09ECEC92%26utm_content%3Dlo%26utm_medium%3Dbadge"
          >
            <img src="img/google.png" width="150" alt="" />
          </a>
        </div>
      </div>
    </div>
    <footer class="text-center mt-5">
      <ul>
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
    <script></script>
  </body>
</html>
