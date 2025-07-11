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
    
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    
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
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .product-category:hover {
            filter: brightness(0.9);
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
            position: relative;
        }

        .review-content-wrapper {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 0.5rem;
        }

        .review-title-section {
            flex: 1;
        }

        .review-title {
            font-size: 1.2rem;
            font-weight: 500;
            margin: 0 0 0.5rem 0;
            color: #333;
        }

        .review-meta {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #666;
        }

        .review-separator {
            color: #b3b3b3d8;
            font-size: 0.8rem;
        }

        .review-rating {
            display: flex;
            gap: 2px;
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
        }

        .review-rating .material-icons {
            color: #FFB800;
            font-size: 1.2rem;
        }

        .review-text {
            margin-bottom: 10px;
            line-height: 1.6;
            color: #555;
            background-color: white;
            padding: 1rem;
            border-radius: 8px;
            border-left: 4px solid var(--accent-pink);
            position: relative;
            padding-right: 80px;
            min-height: 56px;
            display: flex;
            align-items: center;
        }

        .review-like-btn {
            position: absolute;
            top: 50%;
            right: 1rem;
            transform: translateY(-50%);
            width: 80px;
            height: 32px;
            background: #f8f8f8;
            border: none;
            border-radius: 20px;
            box-shadow: none;
            cursor: pointer;
            z-index: 2;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.4rem;
            color: var(--dark-gray);
            font-size: 0.95rem;
            font-weight: 500;
            transition: background 0.2s, color 0.2s;
            padding: 0;
        }

        .review-like-btn .material-icons {
            font-size: 1.2rem;
            margin: 0 4px 0 0;
            display: flex;
            width : 19px;
            align-items: center;
         
        }

        .review-like-btn .like-count {
            min-width: 16px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .review-like-btn.liked {
            background: #fde6e6;
            color: var(--accent-pink);
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

        @media (max-width: 768px) {
            .review-content-wrapper {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .review-info {
                width: 100%;
            }

            .review-rating {
                position: static;
                margin-bottom: 1rem;
            }

            .review-header {
                flex-direction: column;
                align-items: flex-start;
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
            min-width: 600px;
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
            <span class="material-icons" id="favoriteIcon" data-wished="${isWished}">
              <c:choose>
                <c:when test="${isWished}">favorite</c:when>
                <c:otherwise>favorite_border</c:otherwise>
              </c:choose>
            </span>
        </button>
        <div class="row">
        
            <div class="col s12 m6">
            	<img id="mainImage" class="product-image" src="http://192.168.40.32:8100/soyo/resources/product_upfile/${product.productChange}" alt="상품 이미지"/>
            </div>
            
            <div class="col s12 m6">
                <span class="product-category" data-category="${product.productCategory}">
                    ${product.productCategory}
                </span>
                <span id="product-sort" class="product-category">
					<c:choose>
					  <c:when test="${product.productSort eq 'top'}">상의</c:when>
					  <c:when test="${product.productSort eq 'acc'}">장신구</c:when>
					  <c:when test="${product.productSort eq 'bottom'}">하의</c:when>
					  <c:when test="${product.productSort eq 'outer'}">외투</c:when>
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



                <c:choose>
                    <c:when test="${product.inCart}">
                        <button 
                        type="button" 
                        class="add-to-cart-btn waves-effect" 
                        onclick="insertCart(this)" 
                        data-product-no="${product.productNo}" 
                        data-in-cart="true">
                        장바구니 취소
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button 
                        type="button" 
                        class="add-to-cart-btn waves-effect" 
                        onclick="insertCart(this)" 
                        data-product-no="${product.productNo}" 
                        data-in-cart="false">
                        장바구니 담기
                        </button>
                    </c:otherwise>
                </c:choose>

                

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
	                <div class="review-header">
	                    <div class="review-title-section">
	                        <h6 class="review-title">${review.reviewTitle}</h6>
	                        <div class="review-meta">
	                            <span class="review-author">${review.memberName}</span>
	                            <span class="review-separator">•</span>
	                            <span class="review-date"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd"/></span>
	                        </div>
	                    </div>
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
	                </div>
                    
                    <div class="review-text">
                        <div class="review-content">
                            <c:out value="${review.reviewContent}" escapeXml="true"/>
                        </div>
                        <button class="review-like-btn" data-review-no="${review.reviewNo}" data-liked="${review.liked}">
                            <span class="material-icons">
                                <c:choose>
                                    <c:when test="${review.liked}">thumb_up</c:when>
                                    <c:otherwise>thumb_up_outlined</c:otherwise>
                                </c:choose>
                            </span>
                            <span class="like-count">${review.likeCount}</span>
                        </button>
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

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

 <script>
    document.addEventListener("DOMContentLoaded", function () {
      const categoryMap = {
        "여성": "womens",
        "남성": "mens",
        "아동": "kids",
        "악세사리": "accessory",
        "장신구" : "accessory",
        "상의" : "top",
        "하의" : "bottom",
        "외투" : "outer"
      };
  
      document.querySelectorAll(".product-category").forEach(span => {
        span.addEventListener("click", function () {
          const productCategoryKor = this.textContent.trim();
          const productCategoryEng = categoryMap[productCategoryKor] || "all";
          window.location.href = "/soyo/product/productList?type=" + productCategoryEng;
        });
      });
    });
  </script>
  

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const productNo = "${product.productNo}";

        // 사이즈 선택 버튼 + 재고 조회
        const sizeBtns = document.querySelectorAll('.size-btn');
        sizeBtns.forEach(btn => {
            btn.addEventListener('click', function () {
                sizeBtns.forEach(b => b.classList.remove('active'));
                this.classList.add('active');

                const selectedSize = this.dataset.size;

                fetch("/soyo/product/stock?productNo=" + productNo + "&size=" + selectedSize)
                    .then(response => response.json())
                    .then(data => {
                        console.log("선택된 사이즈:", selectedSize);
                        document.getElementById('stockCount').innerText = data.stock;
                    });
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

        
        const mainImage = document.getElementById('mainImage');
        mainImage.style.transition = 'opacity 1s cubic-bezier(0.4,0,0.2,1)';
        
        
        const mainImageUrl = mainImage.src;
        const subImageUrl = "http://192.168.40.32:8100/soyo/resources/product_upfile/${product.productSubChange}";
        let showMain = true;
        let autoChangeInterval;
        function fadeToImage(url) {
            mainImage.style.opacity = 0;
            setTimeout(() => {
                mainImage.src = url;
                mainImage.onload = () => {
                    mainImage.style.opacity = 1;
                };
            }, 350);
        }
        function startAutoChangeMainImage() {
            autoChangeInterval = setInterval(function() {
                showMain = !showMain;
                if (showMain) {
                    fadeToImage(mainImageUrl);
                } else {
                    fadeToImage(subImageUrl);
                }
            }, 4000);
        }
        function stopAutoChangeMainImage() {
            clearInterval(autoChangeInterval);
        }
        const thumbnails = document.querySelectorAll('.product-thumbnail');
        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', function() {
                fadeToImage(this.src);
                stopAutoChangeMainImage();
            });
        });
        startAutoChangeMainImage();

        // Favorite(찜) 버튼 토글
        const favoriteBtn = document.getElementById('favoriteBtn');
        const favoriteIcon = document.getElementById('favoriteIcon');
        /*
        let isFavorite = false;
        favoriteBtn.addEventListener('click', function() {
            isFavorite = !isFavorite;
            favoriteIcon.textContent = isFavorite ? 'favorite' : 'favorite_border';
        });
        */

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

        // 리뷰 좋아요 버튼 초기 상태 설정
        document.querySelectorAll('.review-like-btn').forEach(btn => {
            const isLiked = btn.getAttribute('data-liked') === 'true';
            if (isLiked) {
                btn.classList.add('liked');
            }
        });

        // 리뷰 좋아요 버튼 기능
        document.querySelectorAll('.review-like-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const reviewNo = this.getAttribute('data-review-no');
                const isLiked = this.getAttribute('data-liked') === 'true';
                const likeCountSpan = this.querySelector('.like-count');
                const iconSpan = this.querySelector('.material-icons');
                
                const url = isLiked 
                    ? "${pageContext.request.contextPath}/review/removeLike"
                    : "${pageContext.request.contextPath}/review/addLike";

                fetch(url, {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        reviewNo: reviewNo
                    })
                })
                .then(res => res.text())
                .then(msg => {
                    if (msg === "success") {
                        if (isLiked) {
                            // 좋아요 취소
                            this.classList.remove('liked');
                            this.setAttribute('data-liked', 'false');
                            iconSpan.textContent = 'thumb_up_outlined';
                            let currentCount = parseInt(likeCountSpan.textContent);
                            likeCountSpan.textContent = Math.max(0, currentCount - 1);
                        } else {
                            // 좋아요 추가
                            this.classList.add('liked');
                            this.setAttribute('data-liked', 'true');
                            iconSpan.textContent = 'thumb_up';
                            let currentCount = parseInt(likeCountSpan.textContent);
                            likeCountSpan.textContent = currentCount + 1;
                        }
                    } else if (msg === "notLogin") {
                        Swal.fire({
                            icon: 'info',
                            title: '로그인 필요',
                            text: '로그인 후 이용 가능합니다.',
                            confirmButtonText: '확인',
                            confirmButtonColor: '#A8C5DA',
                            background: '#fff'
                        });
                    } else if (msg === "duplicated") {
                        Swal.fire({
                            icon: 'warning',
                            title: '중복 좋아요',
                            text: '이미 좋아요를 누른 리뷰입니다.',
                            confirmButtonText: '확인',
                            confirmButtonColor: '#F6E5AC',
                            background: '#fff'
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '처리 실패',
                            text: isLiked ? '좋아요 취소 실패' : '좋아요 추가 실패',
                            confirmButtonText: '확인',
                            confirmButtonColor: '#F4A6A6',
                            background: '#fff'
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    Swal.fire({
                        icon: 'error',
                        title: '오류 발생',
                        text: '요청 처리 중 오류가 발생했습니다.',
                        confirmButtonText: '확인',
                        confirmButtonColor: '#F4A6A6',
                        background: '#fff'
                    });
                });
            });
        });
    });

    // 장바구니 담기 버튼 클릭 시 작동 로직
    function insertCart(button) {
    const productNo = button.dataset.productNo; // 버튼에서 가져옴
    const isInCart = button.dataset.inCart === "true";
    const productCount = document.getElementById("quantity").value;
    const productSize = document.querySelector(".size-btn.active").getAttribute("data-size");
    const stock = parseInt(document.getElementById("stockCount").textContent);

    // 재고가 0개일 때 장바구니 담기 불가
    if (!isInCart && stock === 0) {
        Swal.fire({
            icon: 'warning',
            title: '재고 부족',
            text: '해당 상품의 재고가 없습니다.',
            confirmButtonText: '확인',
            confirmButtonColor: '#F4A6A6',
            background: '#fff',
            customClass: {
                popup: 'swal2-custom-popup',
                title: 'swal2-custom-title',
                content: 'swal2-custom-content'
            }
        });
        return;
    }

    const formData = {
        productNo: productNo,
        productCount: productCount,
        productSize: productSize
    };

    const url = isInCart 
        ? "${pageContext.request.contextPath}/cart/remove" 
        : "${pageContext.request.contextPath}/cart/insert";

    fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData)
    })
    .then(res => res.text())
    .then(msg => {
        if (msg === "success") {
            if (isInCart) {
                Swal.fire({
                    icon: 'success',
                    title: '장바구니 삭제 완료',
                    text: '장바구니에서 삭제되었습니다.',
                    confirmButtonText: '확인',
                    confirmButtonColor: '#F4A6A6',
                    background: '#fff',
                    timer: 2000,
                    timerProgressBar: true,
                    showConfirmButton: false
                });
                button.textContent = "장바구니 담기";
                button.dataset.inCart = "false";
            } else {
                Swal.fire({
                    icon: 'success',
                    title: '장바구니 추가 완료',
                    text: '선택하신 상품이 장바구니에 담겼습니다.',
                    confirmButtonText: '확인',
                    confirmButtonColor: '#F4A6A6',
                    background: '#fff',
                    timer: 2000,
                    timerProgressBar: true,
                    showConfirmButton: false
                });
                button.textContent = "장바구니 취소";
                button.dataset.inCart = "true";
            }
        } else if (msg === "notLogin") {
            Swal.fire({
                icon: 'info',
                title: '로그인 필요',
                text: '로그인 후 이용 가능합니다.',
                confirmButtonText: '확인',
                confirmButtonColor: '#A8C5DA',
                background: '#fff'
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: '처리 실패',
                text: '요청 처리에 실패했습니다.',
                confirmButtonText: '확인',
                confirmButtonColor: '#F4A6A6',
                background: '#fff'
            });
        }
    });
}


   document.getElementById("favoriteBtn").addEventListener("click", function () {
       const productNo = "${product.productNo}";
       const productSize = document.querySelector(".size-btn.active").getAttribute("data-size");
       const favoriteIcon = document.getElementById("favoriteIcon");
       let isWished = favoriteIcon.getAttribute("data-wished") === "true";
       
       const url = isWished
           ? `${pageContext.request.contextPath}/wishlist/remove`
           : `${pageContext.request.contextPath}/wishlist/insert`;

       fetch(url, {
           method: "POST",
           headers: { "Content-Type": "application/json" },
           body: JSON.stringify({
               productNo: productNo,
               productSize: productSize
           })
       })
       .then(res => res.text())
       .then(msg => {
           if (msg === "success") {
               if (isWished) {
                   Swal.fire({
                       icon: 'success',
                       title: '찜 목록 삭제',
                       text: '찜 목록에서 삭제되었습니다.',
                       confirmButtonText: '확인',
                       confirmButtonColor: '#F4A6A6',
                       background: '#fff',
                       timer: 2000,
                       timerProgressBar: true,
                       showConfirmButton: false
                   });
                   favoriteIcon.textContent = "favorite_border";
                   favoriteIcon.setAttribute("data-wished", "false");
                   isWished = false;
               } else {
                   Swal.fire({
                       icon: 'success',
                       title: '찜 목록 추가',
                       text: '찜 목록에 추가되었습니다.',
                       confirmButtonText: '확인',
                       confirmButtonColor: '#F4A6A6',
                       background: '#fff',
                       timer: 2000,
                       timerProgressBar: true,
                       showConfirmButton: false
                   });
                   favoriteIcon.textContent = "favorite";
                   favoriteIcon.setAttribute("data-wished", "true");
                   isWished = true;
               }
           } else if (msg === "notLogin") {
               Swal.fire({
                   icon: 'info',
                   title: '로그인 필요',
                   text: '로그인 후 이용 가능합니다.',
                   confirmButtonText: '확인',
                   confirmButtonColor: '#A8C5DA',
                   background: '#fff'
               });
           } else if (msg === "duplicated") {
               Swal.fire({
                   icon: 'warning',
                   title: '중복 추가',
                   text: '이미 찜한 상품입니다.',
                   confirmButtonText: '확인',
                   confirmButtonColor: '#F6E5AC',
                   background: '#fff'
               });
           } else {
               Swal.fire({
                   icon: 'error',
                   title: '처리 실패',
                   text: isWished ? '찜 취소 실패' : '찜 목록 추가 실패',
                   confirmButtonText: '확인',
                   confirmButtonColor: '#F4A6A6',
                   background: '#fff'
               });
           }
       });
   });


</script>

</body>
</html>
