<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세보기</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <style>
        :root {
            --main-color: #E3E4FA;
            --accent-blue: #A8C5DA;
            --accent-pink: #F4A6A6;
            --accent-yellow: #F6E5AC;
            --light-gray: #F8F8F8;
            --dark-gray: #A8A8A8;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: var(--light-gray);
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
        }

        .col {
            padding: 0 15px;
            flex: 1;
        }

        @media (max-width: 768px) {
            .col {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }

        #hrFirst{
            border: 1px solid #cacaca7c;
            margin-top: 20px;
            margin-bottom: 15px;
        }

        #hrSecond{
            border: 1px solid #cacaca7c;
            margin-top: 27px;
            margin-bottom: 20px;
        }

        .product-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin: 2rem auto;
            padding: 2rem;
            padding-bottom: 20px;
        }

        .product-image {
            width: 100%;
            height: 695px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-thumbnail {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 4px;
            cursor: pointer;
            margin: 0.5rem;
            transition: all 0.3s ease;
        }

        .product-thumbnail:hover {
            transform: scale(1.05);
        }

        .product-title {
            font-size: 2rem;
            font-weight: 500;
            margin: 1rem 0;
            color: #333;
        }

        .product-price {
            font-size: 1.5rem;
            color: var(--accent-pink);
            font-weight: 500;
        }

        .product-category {
            background-color: var(--main-color);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            display: inline-block;
            margin: 0.5rem 0;
        }

        .size-selector {
            margin: 1rem 0;
        }

        .size-selector-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .size-guide-btn {
            display: flex;
            align-items: center;
            background: none;
            border: none;
            color: rgba(80, 132, 175, 0.63);
            font-size: 1.1rem;
            cursor: pointer;
            font-weight: 500;
            transition: color 0.2s;
            padding: 0 0.5rem;
            text-decoration: none;
        }
        .size-guide-btn .material-icons {
            font-size: 1.5rem;
            margin-left: 2px;
        }
        .size-guide-btn:hover {
            color: var(--accent-pink);
        }

        .size-btn {
            background-color: white;
            border: 2px solid var(--main-color);
            padding: 0.5rem 1.5rem;
            margin: 0.25rem;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .size-btn.active {
            background-color: var(--main-color);
            color: #333;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            margin: 1.2rem 0;
            background-color: var(--main-color);
            padding: 0.3rem 1.2rem;
            border-radius: 12px;
            justify-content: space-between;
            height: 60px;
            box-shadow: 0 2px 8px rgba(168,197,218,0.10);
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            background-color: white;
            border-radius: 6px;
            margin-top: 0.4rem;
            margin-bottom: 0.4rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.03);
            height: 35px;
            padding: 0 8px;
        }

        .quantity-btn {
            background-color: transparent;
            border: none;
            width: 36px;
            height: 100%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
            font-size: 1.2rem;
            color: var(--dark-gray);
            padding: 0;
            line-height: 1;
            position: relative;

            outline: none !important;
            box-shadow: none !important;
            background-color: transparent !important;
        }

        .quantity-btn:hover {
            background-color: transparent;
            color: var(--accent-pink);
        }

        .quantity-input {
            width: 45px;
            text-align: center;
            margin: 0;
            border: none;
            font-size: 0.95rem;
            background: transparent;
            padding: 0;
            font-weight: 500;
            color: #333;
        }

        .quantity-input::-webkit-inner-spin-button,
        .quantity-input::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .quantity-label {
            font-size: 1rem;
            color: rgb(70, 70, 70);
            margin: 0;
            font-weight: 400;
        }

        .quantity-divider {
            width: 1px;
            height: 16px;
            background-color: var(--light-gray);
            margin: 0 4px;
        }

        .add-to-cart-btn {
            background-color: var(--accent-pink);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 25px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            margin: 1rem 0;
        }

        .add-to-cart-btn:hover {
            background-color: #e89595;
            transform: translateY(-2px);
        }

        .product-description {
            margin-bottom: 0.5rem;
            line-height: 1.6;
        }

        .tag-container {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin: 1rem 0;
        }

        .tag {
            background-color: var(--accent-yellow);
            padding: 0.25rem 1rem;
            border-radius: 15px;
            font-size: 0.9rem;
        }

        .stock-info {
            color: var(--dark-gray);
            margin: 1rem 0;
            padding-right: 10px;
            text-align: right;
        }

        .favorite-btn {
            position: absolute;
            top: 18px;
            right: 28px;
            background: white;
            border: none;
            border-radius: 50%;
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background 0.2s;
            z-index: 2;
            outline: none !important;
        }
        .favorite-btn:hover {
            background: var(--main-color);
        }
        .favorite-btn .material-icons {
            font-size: 2rem;
            color: #e57373;
            transition: color 0.2s;
        }

        .favorite-btn:focus,
        .favorite-btn:active,
        .favorite-btn:focus-visible {
            outline: none !important;
            box-shadow: none !important;
            background-color: transparent !important;
        }

        @media (max-width: 600px) {
            .product-container {
                margin: 1rem;
                padding: 1rem;
            }
            
            .product-image {
                height: 300px;
            }
        }

        .product-description-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin: 2rem auto;
            padding: 2rem;
            font-size: 1.1rem;
        }

        .review-container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin: 2rem auto;
            padding: 2rem;
        }

        .review-list {
            display: flex;
            flex-direction: column;
            gap: 2rem;
            margin-top: 2rem;
        }

        .review-card {
            background-color: var(--light-gray);
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .review-content-wrapper {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .review-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .review-title {
            font-size: 1.2rem;
            font-weight: 500;
            margin: 0 0 0.5rem 0;
            color: #333;
        }

        .review-rating {
            display: flex;
            gap: 2px;
            margin-bottom: 1rem;
        }

        .review-rating .material-icons {
            color: #FFB800;
            font-size: 1.2rem;
        }

        .review-text {
            margin: 1rem 0;
            line-height: 1.6;
            color: #555;
        }

        .review-footer {
            display: flex;
            justify-content: space-between;
            color: var(--dark-gray);
            font-size: 1rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid #eee;
        }

        .review-thumbnail {
            flex: 0 0 200px;
            width: 200px;
            height: 200px;
            margin-left: 2rem;
        }

        .review-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 4px;
        }

        @media (max-width: 768px) {
            .review-content-wrapper {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .review-info {
                width: 100%;
            }
            
            .review-thumbnail {
                width: 100%;
                height: 200px;
                margin-left: 0;
                margin-top: 1rem;
            }
        }

        .size-selector-row h6 {
            font-size: 1.1rem;
            font-weight: 500;
            margin-bottom: 15px;
        }

        .product-description h5,
        .review-container h5 {
            font-size: 1.5rem;
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0, 0, 0, 0.35);
            z-index: 1000;
            overflow-y: auto;
            transition: background 0.2s;
        }

        .modal.show {
            display: flex !important;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            position: relative;
            background: #fff;
            margin: 0 auto;
            padding: 2.5rem 2rem 1.5rem 2rem;
            width: 100%;
            max-width: 500px;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.18);
            animation: modalFadeIn 0.25s;
            box-sizing: border-box;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .modal-content h5 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
            text-align: left;
        }

        .modal-content p {
            font-size: 1.1rem;
            margin-bottom: 1rem;
        }

        .modal-footer {
            padding: 0 0 0.5rem 0;
            text-align: right;
            border-top: none;
            margin-top: 0.5rem;
        }

        .btn-flat {
            background: none;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            color: var(--accent-blue);
            font-weight: 500;
            transition: color 0.3s;
            font-size: 1.1rem;
        }
        .btn-flat:hover {
            color: var(--accent-pink);
        }

        @media (max-width: 600px) {
            .modal-content {
                padding: 1.2rem 0.5rem 1rem 0.5rem;
                max-width: 98vw;
            }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: var(--light-gray);
            font-weight: 500;
        }

        .divider {
            height: 1px;
            background-color: #eee;
            margin: 1rem 0;
        }

        .modal-close {
            position: absolute;
            top: 14px;
            right: 14px;
            background: none;
            border: none;
            color: var(--accent-blue);
            font-size: 2rem;
            font-weight: 700;
            cursor: pointer;
            z-index: 10;
            transition: color 0.2s;
            line-height: 1;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            padding: 0;
        }
        .modal-close:hover {
            color: var(--accent-pink);
            background: rgba(168,197,218,0.10);
        }
        
        #product-sort {
        	margin-left: 8px;
        	background: #d2e7f7a4;
        }

        .product-detail-content img {
            max-width: 100% !important;
            height: auto !important;
            display: block;
            margin: 0 auto;
        }

        .product-detail-content p {
            font-size: 18px;
            line-height: 2;
        }

        .tab-btn.active {
            background: var(--main-color);
            color: #333;
            box-shadow: 0 2px 8px rgba(168,197,218,0.10);
        }
        .tab-btn:not(.active):hover {
            background: var(--accent-yellow);
            color: #333;
        }

        .tab-nav-material {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 3rem;
            margin: 2rem 0 0 0;
            background: #fff;
            border-radius: 16px 16px 0 0;
            box-shadow: 0 4px 24px 0 rgba(80,132,175,0.10), 0 1.5px 4px 0 rgba(244,166,166,0.07);
            padding: 0.8rem 0.8rem;
            width: 100%;
            max-width: 100%;
            position: relative;
            z-index: 10;
        }
        .tab-btn-material {
            background: none;
            border: none;
            font-size: 1.15rem;
            font-weight: 500;
            color: #5084af;
            padding: 0.7rem 2.2rem;
            border-radius: 30px;
            transition: background 0.18s, color 0.18s, box-shadow 0.18s;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            letter-spacing: 0.01em;
            box-shadow: none;
            outline: none;
        }
        .tab-btn-material.active {
            background: linear-gradient(90deg, #f7f8fc 0%, #e7e9f7 60%, #faefd3 100%);
            color: #333;
            box-shadow: 0 2px 8px rgba(168,197,218,0.13);
            font-weight: 700;
            border: 1.5px solid #e3e4fa;
        }
        .tab-btn-material:not(.active):hover {
            background: #f4a6a61a;
            color: #e57373;
        }
        .tab-btn-material .material-icons {
            font-size: 1.3rem;
            vertical-align: middle;
            margin-right: 2px;
        }
        @media (max-width: 600px) {
            .tab-nav-material {
                max-width: 98vw;
                width: 100%;
                gap: 1rem;
                padding: 0.2rem 0.2rem;
            }
            .tab-btn-material {
                font-size: 1rem;
                padding: 0.5rem 1.1rem;
            }
        }

    </style>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<br><br><br>

<div class="container">
    <div class="product-container" style="position:relative;">
        <button class="favorite-btn" id="favoriteBtn" aria-label="찜하기">
            <span class="material-icons" id="favoriteIcon">favorite_border</span>
        </button>
        <div class="row">
        
            <div class="col s12 m6">
            	<img id="mainImage" class="product-image" src="http://localhost:8100/soyo/resources/product_upfile/${product.productChange}" alt="상품 이미지"/>
            </div>
            
            <div class="col s12 m6">
                <span class="product-category">${product.productCategory}</span>
                <span id="product-sort" class="product-category">
					<c:choose>
					  <c:when test="${product.productSort eq 'top'}">상의</c:when>
					  <c:when test="${product.productSort eq 'acc'}">장신구</c:when>
					  <c:otherwise>${product.productSort}</c:otherwise>
					</c:choose>
				</span>

                <h1 class="product-title">${product.productName}</h1>
                
                <p>${product.productCaption}</p>
                
                <hr id="hrFirst">
                
                <p class="product-price"><fmt:formatNumber value="${product.productPrice}" type="number" groupingUsed="true" />원</p>
                
                <div class="tag-container">
				    <c:forEach var="tag" items="${tagList}">
				        <span class="tag">#${tag}</span>
				    </c:forEach>
                </div>

                <hr id="hrSecond">

                <div class="size-selector">
                    <div class="size-selector-row">
                        <h6 style="margin-bottom: 15px;">&nbsp;&nbsp;사이즈 선택</h6>
                        <button class="size-guide-btn modal-trigger" data-target="sizeGuideModal">
                            사이즈 안내 <span class="material-icons">help_outline</span>
                        </button>
                    </div>
                    <button class="size-btn" data-size="S">S</button>
                    <button class="size-btn active" data-size="M">M</button>
                    <button class="size-btn" data-size="L">L</button>
                </div>

                <hr id="hrSecond">

                <div class="quantity-selector">
                    <span class="quantity-label">구매 수량</span>
                    <div class="quantity-controls">
                        <button class="quantity-btn" id="decreaseQuantity">-</button>
                        <div class="quantity-divider"></div>
                        <input type="number" value="1" min="1" class="quantity-input" id="quantity">
                        <div class="quantity-divider"></div>
                        <button class="quantity-btn" id="increaseQuantity">+</button>
                    </div>
                </div>

                <p class="stock-info">상품 재고 : <span id="stockCount">${product.productCount}</span>개</p>

                <button type="button" class="add-to-cart-btn waves-effect" onclick="insertCart()">장바구니 담기</button>

            </div>
        </div>
    </div>
    <!-- 탭 네비게이션 -->
    <div class="tab-nav-material">
        <button class="tab-btn-material active" data-target="#productDetailSection"><span class="material-icons">info</span> 상세 정보</button>
        <button class="tab-btn-material" data-target="#reviewSection"><span class="material-icons">rate_review</span> 리뷰</button>
    </div>
</div>

<div class="container">
    <div id="productDetailSection" class="product-description-container" style="margin-top:0; border-radius:0 0 16px 16px; box-shadow:0 4px 24px 0 rgba(80,132,175,0.07);">
        <div class="product-description">
            <h5>상품 상세 정보</h5>
            <div class="divider"></div>
            <br>
            <div class="product-detail-content">
                ${product.productSubCaption}
            </div>
        </div>
    </div>

    <!-- 리뷰 영역 상단에도 동일한 탭 네비게이션 -->
    <div class="tab-nav-material review-tab-nav" style="margin:0 0 0 0; border-radius:16px 16px 0 0;">
        <button class="tab-btn-material" data-target="#productDetailSection"><span class="material-icons">info</span> 상세 정보</button>
        <button class="tab-btn-material active" data-target="#reviewSection"><span class="material-icons">rate_review</span> 리뷰</button>
    </div>

    <div id="reviewSection" class="review-container" style="margin-top:0; border-radius:0 0 16px 16px; box-shadow:0 4px 24px 0 rgba(80,132,175,0.07);">
        <h5>상품 리뷰</h5>
        <div class="divider"></div>
        
        

	<div class="review-list">
	    <c:forEach var="review" items="${reviewList}">
	        <div class="review-card">
	            <div class="review-content-wrapper">
	                <div class="review-info">
	                    <h6 class="review-title">${review.reviewTitle}</h6>
	                    <div class="review-rating">
	                        <c:forEach var="i" begin="1" end="5">
	                            <c:choose>
	                                <c:when test="${i <= review.rating}">
	                                    <span class="material-icons">star</span>
	                                </c:when>
	                                <c:when test="${i - 0.5 == review.rating}">
	                                    <span class="material-icons">star_half</span>
	                                </c:when>
	                                <c:otherwise>
	                                    <span class="material-icons">star_border</span>
	                                </c:otherwise>
	                            </c:choose>
	                        </c:forEach>
	                    </div>
	                    <div class="review-text">
	                        <p><c:out value="${review.reviewContent}" escapeXml="true"/></p>
	                    </div>
	                    <div class="review-footer">
	                        <span class="review-author">${review.memberName}</span>
	                        <span class="review-date"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd"/></span>
	                    </div>
	                </div>
	                <div class="review-thumbnail">
	                    <img src="${pageContext.request.contextPath}/resources/review_upfile/${review.reviewThumbnailChange}" alt="리뷰 이미지">
	                </div>
	            </div>
	        </div>
	    </c:forEach>
	</div>


        
        
    </div>
</div>
<br>

<div id="sizeGuideModal" class="modal">
    <div class="modal-content">
        <button class="modal-close" aria-label="닫기">&times;</button>
        <h5>사이즈 안내</h5>
        <p>아래 표를 참고하여 본인에게 맞는 사이즈를 선택해 주세요.</p>
        <table class="striped centered">
            <thead>
                <tr>
                    <th>사이즈</th>
                    <th>총장(cm)</th>
                    <th>가슴둘레(cm)</th>
                    <th>권장 신장</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>S</td>
                    <td>110</td>
                    <td>88</td>
                    <td>150~160cm</td>
                </tr>
                <tr>
                    <td>M</td>
                    <td>115</td>
                    <td>94</td>
                    <td>160~170cm</td>
                </tr>
                <tr>
                    <td>L</td>
                    <td>120</td>
                    <td>100</td>
                    <td>170~180cm</td>
                </tr>
            </tbody>
        </table>
        <p style="margin-top:1rem; color:#888; font-size:0.95rem;">* 사이즈는 측정 방법에 따라 1~2cm 오차가 있을 수 있습니다.</p>
    </div>
    
</div>

<jsp:include page="../common/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 사이즈 선택 버튼
        const sizeBtns = document.querySelectorAll('.size-btn');
        sizeBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                sizeBtns.forEach(b => b.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // 수량 컨트롤
        const quantityInput = document.getElementById('quantity');
        const decreaseBtn = document.getElementById('decreaseQuantity');
        const increaseBtn = document.getElementById('increaseQuantity');

        decreaseBtn.addEventListener('click', function() {
            let value = parseInt(quantityInput.value);
            if (value > 1) {
                quantityInput.value = value - 1;
            }
        });

        increaseBtn.addEventListener('click', function() {
            let value = parseInt(quantityInput.value);
            let stock = parseInt(document.getElementById('stockCount').textContent);
            if (value < stock) {
                quantityInput.value = value + 1;
            }
        });

        // 썸네일 클릭 핸들링용
        const thumbnails = document.querySelectorAll('.product-thumbnail');
        const mainImage = document.getElementById('mainImage');
        
        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', function() {
                mainImage.src = this.src;
            });
        });

        // Favorite(찜) 버튼 토글
        const favoriteBtn = document.getElementById('favoriteBtn');
        const favoriteIcon = document.getElementById('favoriteIcon');
        let isFavorite = false;
        favoriteBtn.addEventListener('click', function() {
            isFavorite = !isFavorite;
            favoriteIcon.textContent = isFavorite ? 'favorite' : 'favorite_border';
        });

        // 모달 기능 구현
        const modalTriggers = document.querySelectorAll('.modal-trigger');
        const modals = document.querySelectorAll('.modal');
        const modalCloseBtns = document.querySelectorAll('.modal-close');

        modalTriggers.forEach(trigger => {
            trigger.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                const targetId = this.getAttribute('data-target');
                const targetModal = document.getElementById(targetId.replace('#', ''));
                if (targetModal) {
                    targetModal.classList.add('show');
                    targetModal.style.display = 'flex';
                    document.body.style.overflow = 'hidden';
                }
            });
        });

        modalCloseBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                const modal = this.closest('.modal');
                if (modal) {
                    modal.classList.remove('show');
                    modal.style.display = 'none';
                    document.body.style.overflow = '';
                }
            });
        });

        window.addEventListener('click', function(event) {
            modals.forEach(modal => {
                if (event.target === modal) {
                    modal.classList.remove('show');
                    modal.style.display = 'none';
                    document.body.style.overflow = '';
                }
            });
        });

        // material 탭 네비게이션 기능 (여러 개 동시 적용)
        function handleTabNav(tabNav) {
            const btns = tabNav.querySelectorAll('.tab-btn-material');
            btns.forEach(btn => {
                btn.addEventListener('click', function() {
                    // 모든 탭 네비게이션의 버튼 active 동기화
                    document.querySelectorAll('.tab-btn-material').forEach(b => {
                        if(b.getAttribute('data-target') === this.getAttribute('data-target')) {
                            b.classList.add('active');
                        } else {
                            b.classList.remove('active');
                        }
                    });
                    const target = document.querySelector(this.getAttribute('data-target'));
                    if(target) {
                        window.scrollTo({
                            top: target.getBoundingClientRect().top + window.pageYOffset - 80,
                            behavior: 'smooth'
                        });
                    }
                });
            });
        }
        document.querySelectorAll('.tab-nav-material').forEach(handleTabNav);
    });

    // 장바구니 담기 버튼 클릭 시 작동 로직
    function insertCart() {
    const productNo = "${product.productNo}"; // EL로 바로 값 삽입
    const productCount = document.getElementById("quantity").value;
    const productSize = document.querySelector(".size-btn.active").getAttribute("data-size");

    const formData = {
        productNo: productNo,
        productCount: productCount,
        productSize: productSize
    };

    fetch("${pageContext.request.contextPath}/cart/insert", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData)
    })
    .then(res => res.text())
    .then(msg => {
        if (msg === "success") alert("선택하신 상품이 장바구니에 담겼습니다.");
        else if (msg === "notLogin") alert("로그인 후 이용 가능합니다.");
        else alert("장바구니 담기에 실패했습니다.");
    });
}


</script>
</body>
</html>
