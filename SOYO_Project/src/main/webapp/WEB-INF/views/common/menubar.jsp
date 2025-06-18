<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>SOYO - MENUBAR</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet"/>
  
  <!-- alertify 연동하기 -->
  <!-- CSS -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
  <!-- 테마 (옵션) -->
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
  <!-- JS -->
  <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
  
  <style>
    :root {
      --primary-color: #F9F3FF;
      --color1: #BFD7E4;
      --color2: #F4A6A6;
      --color3: #F6E5AC;
      --color4: #F8F8F8;
      --color5: #8d8d8d;
    }

    @font-face {
        font-family: 'HancomSans-Light';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2406-1@1.0/HancomSans-Light.woff2') format('woff2');
        font-weight: 300;
        font-style: normal;
    }

    @font-face { 
        font-family: 'S-CoreDream'; 
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff'); 
        font-weight: 500; 
        font-style: normal; 
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Noto Sans KR', sans-serif;
      line-height: 1.6;
      color: #333;
    }

	.navbar {
	  background-color: var(--primary-color);
	  padding: 0.7rem 5%;
	  display: flex;
	  justify-content: space-between;
	  align-items: center;
	  position: fixed;
	  width: 100%;
	  top: 0;
	  z-index: 1000;
	  box-shadow: 0 2px 5px rgba(0,0,0,0.15);
	  font-family: 'S-CoreDream', sans-serif;
	  font-size: 21px;
	}

	.logo h1 {
	  font-size: 2rem;
	  color: #C8A2C8;
	  font-family: 'HancomSans-Light', sans-serif;
	}

	.nav-links {
	  display: flex;
	  list-style: none;
	  gap: 5rem;
	  position: relative;
	}

    .heart-icon {
      color: #8d8d8d;
      transition: color 0.3s ease;
    }

    .heart-icon:hover {
      color: #F4A6A6;
    }

    .dropdown {
      position: relative;
    }

    .submenu {
      position: absolute;
      top: 100%;
      left: 50%;
      transform: translateX(-50%) translateY(10px);
      background-color: white;
      min-width: 140px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.15);
      z-index: 1000;
      list-style: none;
      opacity: 0;
      visibility: hidden;
      pointer-events: none;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      text-align: center;
    }

    .dropdown:hover .submenu {
      display: block;
      transform: translateX(-50%) translateY(0);
      opacity: 1;
      visibility: visible;
      pointer-events: auto;
    }

    .submenu a {
      display: block;
      padding: 0.8rem 1rem;
      color: var(--color5);
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .submenu a:hover {
      background-color: var(--color1);
      color: rgb(54, 54, 54) !important;
    }

	.nav-links a {
	  text-decoration: none;
	  color: var(--color5);
	  font-weight: 500;
	  transition: color 0.3s ease;
	}

    .nav-links a:hover {
      color: var(--color2);
    }

    .nav-icons a {
      color: var(--color5);
      text-decoration: none;
      margin-left: 0.5rem;
      font-size: 1.5rem;
      display: inline-block;
      width: 2.5rem;
      height: 2.5rem;
      border-radius: 50%;
      transition: all 0.3s ease;
      text-align: center;
    }

    .nav-icons a:hover {
      background-color: var(--color1);
      color: white;
    }

    .nav-icons .user-dropdown {
      position: relative;
      display: inline-block;
    }

    .user-submenu {
      position: absolute;
      top: 100%;
      left: 50%;
      transform: translateX(-50%) translateY(10px);
      background-color: white;
      min-width: 120px;
      border-radius: 12px;
      box-shadow: 0 0px 10px rgba(0,0,0,0.25);
      z-index: 1000;
      padding: 8px 0;
      list-style: none;
      border: 1px solid rgba(191, 215, 228, 0.3);
      opacity: 0;
      visibility: hidden;
      pointer-events: none;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .user-dropdown:hover .user-submenu {
      transform: translateX(-50%) translateY(0);
      opacity: 1;
      visibility: visible;
      pointer-events: auto;
    }

    .user-submenu li {
      margin: 0;
      padding: 0;
    }

    .user-submenu a {
      display: flex;
      align-items: center;
      justify-content: flex-start;
      padding: 0.8rem 1rem;
      color: var(--color5);
      text-decoration: none;
      transition: all 0.3s ease;
      font-weight: 500;
      line-height: 1.5;
      white-space: nowrap;
      width: 100%;
      border-radius: 0;
      font-size: 1.2rem;
    }

    .user-submenu a:hover {
      background-color: transparent;
      color: var(--color1);
      transform: translateX(2px);
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    #menu {
      cursor: none;
    }

  </style>
</head>
<body>

  <!-- 
		1회성 알람 기능
  -->
  <c:if test="${ not empty sessionScope.alertMsg }">
     <script>
		 alert("${ sessionScope.alertMsg }")
     </script>
     <c:remove var="alertMsg" scope="session" />
  </c:if>

  <nav class="navbar">
	<div class="logo">
	  <a href="${pageContext.request.contextPath}/" style="text-decoration: none; color: inherit;">
	    <h1 id="logo">SOYO</h1>
	  </a>
	</div>
    <ul class="nav-links">
    <li class="dropdown">
        <a id="menu">소개</a>
        <ul class="submenu">
            <li><a href="<c:url value='/location' />">오시는 길</a></li>
            <li><a href="<c:url value='/guide' />">쇼핑 가이드</a></li>
            <li><a href="<c:url value='/brand' />">브랜드 소개</a></li>
        </ul>
        </li>
      <li class="dropdown">
        <a id="menu">상품</a>
        <ul class="submenu">
          <li><a href="<c:url value='/product/productList' />">남성복</a></li>
          <li><a href="#">여성복</a></li>
          <li><a href="#">아동복</a></li>
          <li><a href="#">액세서리</a></li>
          <li><a href="#">맞춤 제작</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a id="menu">리뷰</a>
        <ul class="submenu">
          <li><a href="<c:url value='/review/review_best' />">베스트 리뷰</a></li>
          <li><a href="<c:url value='/review/review' />">리뷰 게시판</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a id="menu">갤러리</a>
        <ul class="submenu">
          <li><a href="#">룩북</a></li>
          <li><a href="<c:url value='/celeb' />">셀러브리티</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a id="menu" style="cursor: pointer;" href="<c:url value='/notice/noticeList'/>">공지사항</a>
      </li>
      <li class="dropdown">
        <a id="menu">문의</a>
        <ul class="submenu">
          <li><a href="<c:url value='/faq' />">FAQ</a></li>
          <li><a href="#" id="admin-contact">관리자 문의</a></li>
        </ul>
      </li>
    </ul>
    
    <script>
	  document.getElementById("admin-contact").addEventListener("click", function(e) {
	    e.preventDefault(); // a 태그의 기본 동작(페이지 이동) 막기
	    alertify.alert(
	    		"관리자 문의 안내",
	    		"문의 사항이 있으신 경우, 화면 우측 하단의 채팅 아이콘을<br>통하여 관리자에게 연락하실 수 있습니다."
	    		);
	  });
	</script>
    
    
	<!-- 관리자 문의 스크립트 -->
	<script type="text/javascript">
		var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
		(function(){
			var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
			s1.async=true;
			s1.src='https://embed.tawk.to/683ffb6a8f8920190c857464/1issus6t6';
			s1.charset='UTF-8';
			s1.setAttribute('crossorigin','*');
			s0.parentNode.insertBefore(s1,s0);
		})();
	</script>
	
    
    <c:choose>
    <c:when test="${ empty sessionScope.loginUser }">
	    <!-- 로그인 전 -->
	    <div class="nav-icons">
	      <a href="#search"><i class="fas fa-search"></i></a>
	      <div class="user-dropdown">
	        <a href="#user"><i class="fas fa-user"></i></a>
	        <ul class="user-submenu">
	          <li><a href="<c:url value='/member/login' />">로그인</a></li>
	          <li><a href="<c:url value='/member/memberEnrollForm' />">회원가입</a></li>
	        </ul>
	      </div>
	      <a href="#heart" class="heart-icon"><i class="fas fa-heart"></i></a>
	      <a href="${pageContext.request.contextPath}/cart/cart"><i class="fas fa-shopping-cart"></i></a>
	    </div>
	</c:when>
	
	<c:otherwise>
	    <!-- 로그인 후 -->
	    <div class="nav-icons">
	      <a href="#search"><i class="fas fa-search"></i></a>
	      <div class="user-dropdown">
	        <a href="#user"><i class="fas fa-user"></i></a>
	        <ul class="user-submenu">
	          <li style="cursor : none; margin-bottom: 10px;"><a><b>${ sessionScope.loginUser.memberName }</b>&nbsp;님</a></li>
	          <li><a href="<c:url value='/member/logout' />">로그아웃</a></li>
	          <li><a href="<c:url value='/member/myOrderPage' />">주문 목록</a></li>
	          <li><a href="<c:url value='/member/myInformation' />">마이페이지</a></li>
	          <li><a href="#">최근 본 상품</a></li>
	        </ul>
	      </div>
	      <a href="#heart" class="heart-icon"><i class="fas fa-heart"></i></a>
	      <a href="<c:url value='/cart/cart' />"><i class="fas fa-shopping-cart"></i></a> 
	    </div>
    </c:otherwise>
    </c:choose>
    
  </nav>
</body>
</html>
