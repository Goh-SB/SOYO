<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소요 - 상품 목록</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>

    @font-face {
        font-family: 'NEXON Lv2 Gothic';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: 'NanumSquareRound';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

  body {
    background: #fff;
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    color: #333;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }
  .container {
    max-width: 1600px;
    margin: 0 auto;
    padding: 44px 36px;
    flex: 1;
  }
  .product-category {
    font-size: 2rem;
    font-weight: 600;
    text-align: center;
    color: #333;
    margin-bottom: 8px;
    letter-spacing: -0.02em;
  }
  .product-count {
    color: #666;
    font-size: 1rem;
    margin-bottom: 35px;
    display: block;
    text-align: center;
    font-weight: 400;
  }
  .top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    gap: 16px;
    padding: 0 12px;
  }
  .sort-tabs {
    display: flex;
  }
  .sort-tab {
    background: transparent;
    color: #666;
    border: none;
    padding: 8px 20px;
    font-size: 0.95rem;
    cursor: pointer;
    transition: color 0.2s;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    outline: none;
  }
  .sort-tab.active, .sort-tab:hover {
    color: #000;
    font-weight: 500;
  }
  .search-box {
    display: flex;
    align-items: center;
    border-radius: 4px;
    padding: 6px 16px;
    background: #f8f8f8;
    border: 1px solid #eee;
  }
  .search-box input {
    border: none;
    background: transparent;
    outline: none;
    font-size: 0.95rem;
    width: 180px;
    color: #333;
    font-family: 'Noto Sans KR', sans-serif;
    padding: 4px 0;
  }
  .search-box button {
    display: flex;
    align-items: center;
    justify-content: center;
    background: none;
    border: none;
    color: #666;
    font-size: 1.4rem;
    cursor: pointer;
    padding: 0;
    transition: color 0.2s;
  }
  .search-box button:hover {
    color: #333;
  }
  .search-box .material-icons {
    font-size: 1.4rem;
    line-height: 1;
  }
  hr {
    border: none;
    height: 1px;
    background: #7f919d52;
    margin: auto;
    margin-bottom: 40px;
    opacity: 0.8;
    width: 98.4%;
  }
  
  .product-list {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    grid-template-rows: repeat(2, 1fr);
    gap: 32px;
    padding: 0 12px;
    margin-bottom: 80px;
  }
  .product-card {
    width: 100%;
    background: #fff;
    text-align: center;
    cursor: pointer;
    transition: transform 0.2s;
    text-decoration: none;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0;
  }
  .product-card:hover {
    transform: translateY(-4px);
  }
  .product-card img {
    width: 100%;
    aspect-ratio: 4/5;
    object-fit: contain;
    margin-bottom: 16px;
  }
  .product-card-title {
    font-size: 0.95rem;
    color: #333;
    font-weight: 400;
    margin-bottom: 8px;
    letter-spacing: -0.02em;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    width: 100%;
    text-align: left;
    padding: 0 4px;
  }
  .product-card-price {
    color: #000;
    font-size: 1rem;
    font-weight: 600;
    letter-spacing: -0.02em;
    text-align: left;
    width: 100%;
    padding: 0 4px;
  }


</style>
<script>
  // 정렬 탭 클릭 시 active 클래스 변경
  document.addEventListener('DOMContentLoaded', function() {
    const sortTabs = document.querySelectorAll('.sort-tab');
    sortTabs.forEach(tab => {
      tab.addEventListener('click', function() {
        sortTabs.forEach(t => t.classList.remove('active'));
        this.classList.add('active');
        // 실제 정렬 동작은 필요시 여기에 추가
      });
    });
  });
</script>
</head>
<body>

  <jsp:include page="../common/menubar.jsp" />

  <br><br><br>
    
  <div class="container">
  
  
    <c:choose>
	  <c:when test="${param.type eq 'mens'}">
	    <div class="product-category">남성복</div>
	  </c:when>
	  <c:when test="${param.type eq 'womens'}">
	    <div class="product-category">여성복</div>
	  </c:when>
	  <c:when test="${param.type eq 'kids'}">
	    <div class="product-category">아동복</div>
	  </c:when>
	  <c:when test="${param.type eq 'accessory'}">
	    <div class="product-category">액세서리</div>
	  </c:when>
	  <c:otherwise>
	    <div class="product-category">전체 상품</div>
	  </c:otherwise>
	</c:choose>

    
    <span class="product-count">총 <b>${fn:length(productList)}</b>개의 상품</span>
    <div class="top-bar">
      <div class="sort-tabs">
        <button class="sort-tab active">인기순</button>
        <button class="sort-tab">최신순</button>
        <button class="sort-tab">가격순</button>
      </div>


    <form class="search-box" action="/soyo/product/productList" method="get">
      <input type="hidden" name="type" value="${param.type}" />
      <input type="text" name="search" value="${param.search}" placeholder="상품명 검색" />
      <button type="submit"><span class="material-icons">search</span></button>
    </form>

      
    </div>
    
    <hr>
    
    <!-- 상품 리스트 영역 -->
    <div class="product-list">
    <c:forEach var="product" items="${productList}">
      <a href="/soyo/product/productDetail?no=${product.productNo}" class="product-card">
        <img id="mainImage" class="product-image" src="http://localhost:8100/soyo/resources/product_upfile/${product.productChange}" alt="${product.productName}"/>
        <div class="product-card-title">${product.productName}</div>
        <div class="product-card-price">₩<fmt:formatNumber value="${product.productPrice}" pattern="#,###" /></div>
      </a>
    </c:forEach>
    </div>
  </div>

  <jsp:include page="../common/footer.jsp" />

</body>
</html>