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
    /* grid-template-rows: repeat(2, 1fr); */
    grid-template-rows: auto;
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
    position: relative;
    overflow: hidden;
  }
  .product-card:hover {
    transform: translateY(-4px);
  }
  .product-image-wrapper {
    position: relative;
    width: 100%;
    aspect-ratio: 4/5;
    margin-bottom: 16px;
    overflow: hidden;
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .product-image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    display: block;
    position: relative;
    z-index: 1;
  }
  .product-image-overlay {
    position: absolute;
    left: 0; top: 0;
    width: 100%;
    height: 100%;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    opacity: 0;
    transition: opacity 0.5s cubic-bezier(0.4,0,0.2,1);
    z-index: 2;
    pointer-events: none;
  }
  .product-card:hover .product-image-overlay {
    opacity: 1;
  }
  .product-card-title, .product-card-price {
    position: static;
    z-index: 3;
    width: 100%;
    text-align: left;
    padding: 0 4px;
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
  }
  .product-card-price {
    color: #000;
    font-size: 1rem;
    font-weight: 600;
    letter-spacing: -0.02em;
  }
  .no-product-message {
    grid-column: 1 / -1;
    text-align: center;
    padding: 140px 0 180px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    background: #fafafd;
    border-radius: 16px;
    box-shadow: 0 2px 8px 0 #eaeaea;
    margin: 0 auto;
    max-width: 700px;
    min-width: 1450px;
    width: 100%;
  }
  .no-product-icon {
    font-size: 4rem;
    color: #d1c4e9;
    margin-bottom: 16px;
  }
  .no-product-title {
    font-size: 1.3rem;
    color: #888;
    font-weight: 500;
    margin-bottom: 8px;
  }
  .no-product-sub {
    font-size: 1rem;
    color: #b0b0b0;
  }
  .paging-area {
    margin-top: 30px;
    margin-bottom: 35px;
    text-align: center;
  }
  .pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 4px;
    padding: 0;
    margin: 0;
    list-style: none;
  }
  .page-item {
    display: inline-block;
  }
  .page-link {
    display: block;
    padding: 6px 12px;
    text-decoration: none;
    color: #495057;
    border: 1px solid #dee2e6;
    border-radius: 4px;
    background: #fff;
    font-size: 0.9rem;
    transition: all 0.2s ease;
  }
  .page-link:hover {
    background-color: #e9ecef;
  }
  .page-item.active .page-link {
    background-color: #495057;
    color: white;
    border-color: #495057;
  }
  .page-item.disabled .page-link {
    color: #adb5bd;
    pointer-events: none;
    background-color: #f8f9fa;
  }

</style>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const sortTabs = document.querySelectorAll('.sort-tab');
    const productList = document.getElementById('productList');
    const pagingArea = document.querySelector('.paging-area');
    let currentPage = 1;

    // 페이징 처리 함수
    function updatePagination(pi) {
      let paginationHtml = '<ul class="pagination">';
      
      // 이전 페이지 버튼
      if (pi.currentPage === 1) {
        paginationHtml += '<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>';
      } else {
        paginationHtml += '<li class="page-item"><a class="page-link" href="#" data-page="' + (pi.currentPage - 1) + '">&laquo;</a></li>';
      }

      // 페이지 번호 버튼 (빈 버튼 방지)
      for (let p = pi.startPage; p <= pi.endPage; p++) {
        if (p > pi.maxPage) break;
        if (p === pi.currentPage) {
          paginationHtml += '<li class="page-item active"><a class="page-link" href="#" data-page="' + p + '">' + p + '</a></li>';
        } else {
          paginationHtml += '<li class="page-item"><a class="page-link" href="#" data-page="' + p + '">' + p + '</a></li>';
        }
      }

      // 다음 페이지 버튼
      if (pi.currentPage === pi.maxPage || pi.maxPage === 0) {
        paginationHtml += '<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>';
      } else {
        paginationHtml += '<li class="page-item"><a class="page-link" href="#" data-page="' + (pi.currentPage + 1) + '">&raquo;</a></li>';
      }

      paginationHtml += '</ul>';
      pagingArea.innerHTML = paginationHtml;

      // 페이지 클릭 이벤트 추가
      const pageLinks = pagingArea.querySelectorAll('.page-link');
      pageLinks.forEach(link => {
        link.addEventListener('click', function(e) {
          e.preventDefault();
          const page = this.getAttribute('data-page');
          if (page && !this.parentElement.classList.contains('disabled')) {
            currentPage = parseInt(page);
            const activeTab = document.querySelector('.sort-tab.active');
            if (activeTab) {
              loadSortedProducts(activeTab.getAttribute('data-sort-type'), currentPage);
            }
          }
        });
      });
    }

    // 정렬된 상품 로드 함수
    function loadSortedProducts(sortValue, page) {
      const validTypes = ['womens', 'mens', 'kids', 'accessory', 'outer', 'top', 'bottom'];
      let rawType = new URLSearchParams(window.location.search).get('type') || 'all';
      let type = rawType.split(':')[0];

      // 전체 상품인 경우 'all'로 설정
      if (!validTypes.includes(type) || type === 'all' || type === '') {
        type = 'all';
      }

      fetch('/soyo/product/sort?category=' + type + '&sort=' + sortValue + '&page=' + page)
        .then(res => res.json())
        .then(data => {
          if (!data.products || !Array.isArray(data.products)) {
            console.error("데이터가 올바른 형식이 아닙니다:", data);
            return;
          }

          if (data.products.length === 0) {
            productList.innerHTML = 
              '<div class="no-product-message">' +
                '<span class="material-icons no-product-icon">inventory_2</span>' +
                '<div class="no-product-title">등록된 상품이 없습니다.</div>' +
                '<div class="no-product-sub">다른 카테고리나 검색어를 시도해보세요</div>' +
              '</div>';
            return;
          }

          let productHTML = "";
          data.products.forEach(product => {
            const imageUrl = "http://192.168.40.32:8100/soyo/resources/product_upfile/" + product.productChange;
            const subImageUrl = "http://192.168.40.32:8100/soyo/resources/product_upfile/" + product.productSubChange;
            const price = product.productPrice
              ? new Intl.NumberFormat('ko-KR').format(product.productPrice)
              : '0';

            productHTML += '<a href="/soyo/product/productDetail?no=' + product.productNo + '" class="product-card">' +
              '<div class="product-image-wrapper">' +
                '<img class="product-image" src="' + imageUrl + '" alt="' + product.productName + '" />' +
                '<div class="product-image-overlay" style="background-image:url(' + subImageUrl + ');"></div>' +
              '</div>' +
              '<div class="product-card-title">' + product.productName + '</div>' +
              '<div class="product-card-price">₩' + price + '</div>' +
              '</a>';
          });

          productList.innerHTML = productHTML;
          
          // 페이징 정보 업데이트
          if (data.pi) {
            updatePagination(data.pi);
          }
        })
        .catch(err => {
          console.error("상품을 불러오는 중 오류 발생:", err);
          productList.innerHTML = '<p>상품을 불러오는 데 실패했습니다.</p>';
        });
    }

    sortTabs.forEach(tab => {
      tab.addEventListener('click', function (event) {
        event.preventDefault();
        const sortValue = this.getAttribute('data-sort-type');
        if (!sortValue) {
          console.error("정렬 값이 없습니다.");
          return;
        }

        // 버튼 UI 변경
        sortTabs.forEach(t => t.classList.remove('active'));
        this.classList.add('active');

        // 페이지를 1로 리셋하고 상품 로드
        currentPage = 1;
        loadSortedProducts(sortValue, currentPage);
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
    <c:when test="${param.type eq 'outer'}">
	    <div class="product-category">외투</div>
	  </c:when>
    <c:when test="${param.type eq 'bottom'}">
	    <div class="product-category">하의</div>
	  </c:when>
    <c:when test="${param.type eq 'top'}">
	    <div class="product-category">상의</div>
	  </c:when>
	  <c:otherwise>
	    <div class="product-category">전체 상품</div>
	  </c:otherwise>
	</c:choose>

    
    <span class="product-count">총 <b>${pi.listCount}</b>개의 상품</span>
    <div class="top-bar">
      <div class="sort-tabs">
        <button type="button" class="sort-tab active" data-sort-type="popular">인기순</button>
        <button type="button" class="sort-tab" data-sort-type="latest">최신순</button>
        <button type="button" class="sort-tab" data-sort-type="price-high">높은가격순</button>
        <button type="button" class="sort-tab" data-sort-type="price-low">낮은가격순</button>
      </div>

    <form class="search-box" action="/soyo/product/productList" method="get">
      <input type="hidden" name="type" value="${param.type}" />
      <input type="text" name="search" value="${param.search}" placeholder="상품명 검색" />
      <button type="submit"><span class="material-icons">search</span></button>
    </form>

      
    </div>
    
    <hr>
    
    <!-- 상품 리스트 영역 -->

    <div class="product-list" id="productList">
      <c:choose>
        <c:when test="${fn:length(productList) == 0}">
          <div class="no-product-message">
            <span class="material-icons no-product-icon">inventory_2</span>
            <div class="no-product-title">등록된 상품이 없습니다.</div>
            <div class="no-product-sub">다른 카테고리나 검색어를 시도해보세요</div>
          </div>
        </c:when>
        <c:otherwise>
          <c:forEach var="product" items="${productList}">
            <a href="/soyo/product/productDetail?no=${product.productNo}" class="product-card">
              <div class="product-image-wrapper">
                <img class="product-image" src="http://192.168.40.32:8100/soyo/resources/product_upfile/${product.productChange}" alt="${product.productName}" />
                <div class="product-image-overlay" style="background-image:url('http://192.168.40.32:8100/soyo/resources/product_upfile/${product.productSubChange}');"></div>
              </div>
              <div class="product-card-title">${product.productName}</div>
              <div class="product-card-price">₩<fmt:formatNumber value="${product.productPrice}" pattern="#,###" /></div>
            </a>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
    

	<!-- 페이징바 -->
	<div class="paging-area" align="center">
		<ul class="pagination">

			<c:choose>
				<c:when test="${pi.currentPage eq 1}">
					<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<c:url var="prevUrl" value="/product/productList">
							<c:param name="cpage" value="${pi.currentPage - 1}" />
							<c:if test="${not empty type and type ne 'all'}"><c:param name="type" value="${type}"/></c:if>
							<c:if test="${not empty search}"><c:param name="search" value="${search}"/></c:if>
						</c:url>
						<a class="page-link" href="${prevUrl}">&laquo;</a>
					</li>
				</c:otherwise>
			</c:choose>

			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<c:url var="pageUrl" value="/product/productList">
					<c:param name="cpage" value="${p}" />
					<c:if test="${not empty type and type ne 'all'}"><c:param name="type" value="${type}"/></c:if>
					<c:if test="${not empty search}"><c:param name="search" value="${search}"/></c:if>
				</c:url>
				<li class="page-item <c:if test='${p eq pi.currentPage}'>active</c:if>">
					<a class="page-link" href="${pageUrl}">${p}</a>
				</li>
			</c:forEach>

			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage or pi.maxPage eq 0}">
					<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<c:url var="nextUrl" value="/product/productList">
							<c:param name="cpage" value="${pi.currentPage + 1}" />
							<c:if test="${not empty type and type ne 'all'}"><c:param name="type" value="${type}"/></c:if>
							<c:if test="${not empty search}"><c:param name="search" value="${search}"/></c:if>
						</c:url>
						<a class="page-link" href="${nextUrl}">&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>

  </div>

  <jsp:include page="../common/footer.jsp" />

</body>
</html>