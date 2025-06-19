<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남성 상품 목록</title>
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
    background: #f8f4fcc5;
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
  }
  .container {
    max-width: 1550px;
    margin: 40px auto;
    background: #ffffff;
    border-radius: 18px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.06);
    padding: 40px 32px 32px 32px;
    font-family: 'NEXON Lv2 Gothic';
  }
  .product-category {
    font-size: 2.5rem;
    font-weight: 700;
    text-align: center;
    color: #3B2A5A;
    margin-bottom: 10px;
    letter-spacing: 2px;
  }
  .product-count {
    color: #7B5FA1;
    font-size: 1.1rem;
    margin-bottom: 24px;
    display: block;
    text-align: center;
  }
  .top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 24px;
  }
  .sort-tabs {
    display: flex;
    gap: 12px;
  }
  .sort-tab {
    background: #F5EFFA;
    color: #7B5FA1;
    border: none;
    border-radius: 16px;
    padding: 8px 20px;
    font-size: 1rem;
    cursor: pointer;
    transition: background 0.2s, color 0.2s;
    background: #f5effad7;
    border: 1px groove #92929260;
    font-family: 'NanumSquareRound', sans-serif;
  }
  .sort-tab.active, .sort-tab:hover {
    background: #EADCF1;
    color: #3B2A5A;
    font-weight: 600;
  }
  .search-box {
    display: flex;
    align-items: center;
    border-radius: 16px;
    padding: 6px 16px;
    background: #f5effad7;
    border: 1px groove #92929260;
  }
  .search-box input {
    border: none;
    background: transparent;
    outline: none;
    font-size: 1rem;
    width: 160px;
    color: #3B2A5A;
    font-family: 'NanumSquareRound', sans-serif;
  }
  .search-box button {
    display: flex;
    align-items: center;
    justify-content: right;
    background: none;
    border: none;
    color: #7B5FA1;
    font-size: 1.6rem;
    cursor: pointer;
    margin-left: 4px;
    width: 36px;
    height: 36px;
    padding: 0;
  }
  .search-box .material-icons {
    font-size: 1.8rem;
    line-height: 1;
  }

  hr {
    border: none;
    height: 2px;
    background: linear-gradient(to right, #EADCF1, #CBB4E7, #EADCF1);
    margin: 20px 0;
    border-radius: 4px;
    opacity: 0.7;
  }

  /* 상품 카드 스타일 */
  .product-list {
    display: flex;
    flex-wrap: wrap;
    gap: 32px;
    justify-content: flex-start;
    margin-top: 32px;
  }
  .product-card {
    width: 320px;
    background: #fdf8ff;
    border-radius: 18px;
    box-shadow: 0 2px 8px rgba(203,180,231,0.08);
    padding: 18px;
    text-align: center;
    cursor: pointer;
    transition: box-shadow 0.2s, transform 0.2s;
    text-decoration: none;
    display: block;
    border: 1px groove #92929260;
  }
  .product-card:hover {
    box-shadow: 0 4px 16px rgba(123,95,161,0.13);
    transform: translateY(-4px) scale(1.03);
  }
  .product-card img {
    width: 100%;
    height: 220px;
    object-fit: cover;
    border-radius: 12px;
    margin-bottom: 16px;
  }
  .product-card-title {
    font-size: 1.1rem;
    color: #3B2A5A;
    font-weight: 600;
    margin-bottom: 8px;
  }
  .product-card-price {
    color: #3B2A5A;
    font-size: 1.1rem;
    margin-bottom: 8px;
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

    
    <span class="product-count">총 <b>10</b> 개의 상품</span>
    <hr>
    <div class="top-bar">
      <div class="sort-tabs">
        <button class="sort-tab active">인기순</button>
        <button class="sort-tab">최신순</button>
        <button class="sort-tab">가격순</button>
      </div>
      <form class="search-box" action="#" method="get">
        <input type="text" name="search" placeholder="상품명 검색" />
        <button type="submit"><span class="material-icons">search</span></button>
      </form>
    </div>
    <!-- 상품 리스트 영역이 여기에 들어감 -->
    <div class="product-list">
      <a href="/product/detail?id=1" class="product-card">
        <img src="https://cdn.pixabay.com/photo/2016/11/29/09/32/adult-1868750_1280.jpg" alt="샘플 상품" />
        <div class="product-card-title">한글 반팔 셔츠 저고리 [베이지]</div>
        <div class="product-card-price">₩169,000</div>
      </a>
    </div>
  </div>

  <br>

  <jsp:include page="../common/footer.jsp" />

</body>
</html>