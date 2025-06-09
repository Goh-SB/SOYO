<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소요 - 한복의 새로운 스타일</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #F9F3FF;
            --color1: #98acb6 !important;
            --color2: #F4A6A6;
            --color3: #F6E5AC;
            --color4: #F8F8F8;
            --color5: #A8A8A8;
        }
		
        @font-face {
            font-family: 'ChosunGu';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'NanumSquareRound';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'ChosunGu', sans-serif;
            line-height: 1.6;
            color: #333;
        }


        /* 히어로 섹션 */
        .hero {
            height: 80vh;
            background: linear-gradient(
                135deg,
                #F3ECFA 0%,
                #FCE4E7 25%,
                #F9F3DA 50%,
                #F2F2F2 100%
            );
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 0 1rem;
        }


        .hero-content h2 {
            font-size: 2.5rem;
            color: #5A6C7C;
            margin-bottom: 1rem;
        }

        .hero-content p {
            font-size: 1.5rem;
            color: #949494;
            margin-bottom: 2rem;
        }

        .cta-button {
            background-color: #7C8E9F;
            color: white;
            padding: 1rem 2rem;
            border-radius: 30px;
            text-decoration: none;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .cta-button:hover {
            background-color: #5b6c7c;
        }


        /* 상품 섹션 */
        .featured-products {
            padding: 5rem 10%;
            background-color: #fff;
        }

        .featured-products h2 {
            text-align: center;
            color: var(--color1);
            margin-bottom: 3rem;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }

        .product-card h3 {
            padding: 1rem;
            color: var(--color1);
        }

        .product-card p {
            padding: 0 1rem;
            color: var(--color5);
        }

        .product-card .price {
            display: block;
            padding: 1rem;
            color: var(--color2);
            font-weight: bold;
        }

        /* 소요의 이야기 섹션 */
        .about {
            padding: 5rem 0;
            background-color: #fff;
            text-align: center;
        }

        .about-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }

        .about-content p {
            color: var(--color5);
            line-height: 1.8;
            font-size: 1.5rem;
        }

        .about-content a {
            display: inline-block;
            padding: 1rem 2rem;
            background-color: var(--color1);
            color: white;
            text-decoration: none;
            border-radius: 30px;
            transition: background-color 0.3s ease;
            margin-top: 1rem;
        }

        .about-content a:hover {
            background-color: #8ABED1;
        }

        /* 컬렉션 섹션 */
        .collections {
            padding: 5rem 10%;
            background-color: var(--primary-color);
            font-family: 'NanumSquareRound', sans-serif;
        }

        .collections h2 {
            text-align: center;
            color: var(--color1);
            margin-bottom: 3rem;
            font-size: 1.8rem;
        }

        .collection-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .collection-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .collection-card img {
            width: 100%;
            height: 350px;
            object-fit: cover;
        }

        .collection-card h3 {
            padding: 1rem;
            color: var(--color1);
            text-align: center;
            font-size: 1.4rem;
        }

        .collection-card p {
            padding: 0 1rem;
            color: var(--color5);
            margin-bottom: 20px;
            text-align: center;
            font-size: 1.1rem;
        }

        /* 캐러셀 스타일 */
        .carousel-container {
            position: relative;
            width: 100%;
            height: 80vh;
            overflow: hidden;
        }

        .carousel-slides {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .carousel-slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        .carousel-slide.active {
            opacity: 1;
        }

        .carousel-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .carousel-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
            z-index: 10;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .carousel-arrow:hover {
            background: rgba(0, 0, 0, 0.7);
        }

        .carousel-arrow.prev {
            left: 20px;
        }

        .carousel-arrow.next {
            right: 20px;
        }

    </style>
</head>
<body>

	<!-- 항상 모든 페이지 상단에는 메뉴바가 보여지게끔 include -->
	<jsp:include page="common/menubar.jsp" />

    <main>

        <br><br>

        <div class="carousel-container">
            <div class="carousel-slides">
                <div class="carousel-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/slide-1.jpg" alt="슬라이드 1">
                </div>
                <div class="carousel-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/slide-2.jpg" alt="슬라이드 2">
                </div>
                <div class="carousel-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/slide-3.jpg" alt="슬라이드 3">
                </div>
            </div>
            <button class="carousel-arrow prev">
                <i class="fas fa-chevron-left"></i>
            </button>
            <button class="carousel-arrow next">
                <i class="fas fa-chevron-right"></i>
            </button>
        </div>

        <section class="hero">
            <div class="hero-content">
                <h2>한복의 새로운 스타일</h2>
                <p>오방색의 아름다움을 감각적으로 재해석해<br>당신의 일상에 부드럽게 스며든 한복 컬렉션</p>
                <a href="#collections" class="cta-button">컬렉션 보기</a>
            </div>
        </section>

		<!-- 테스트용 코드. 테스트 완료 후 지우기 -->
		<form action="<c:url value='/product/productDetail' />" method="get">
		  <button type="submit" style="padding: 20px; margin-left: 820px">상품 상세보기 테스트 페이지 - 삭제 예정</button>
		</form>

        <section class="featured-products">
            <h2>추천 상품</h2>
            <div class="product-grid">
                <div class="product-card">
                    <img src="https://via.placeholder.com/300" alt="상품1">
                    <h3>모던 한복 세트</h3>
                    <p>오방색의 현대적 재해석</p>
                    <span class="price">1,500,000원</span>
                </div>
                <div class="product-card">
                    <img src="https://via.placeholder.com/300" alt="상품2">
                    <h3>리본 장식 한복</h3>
                    <p>세련된 디테일</p>
                    <span class="price">1,200,000원</span>
                </div>
                <div class="product-card">
                    <img src="https://via.placeholder.com/300" alt="상품3">
                    <h3>모던 치마저고리</h3>
                    <p>일상적인 스타일</p>
                    <span class="price">800,000원</span>
                </div>
            </div>
        </section>

        <section class="about">
            <h2>소요의 이야기</h2>
            <div class="about-content">
                <p>한복의 아름다움을 감각적으로 재해석한 소요.<br>
				   전통과 현대를 넘나드는, 새로운 패션의 흐름을 이끕니다.</p>
                <a href="#about" class="cta-button">더 알아보기</a>
            </div>
        </section>

        <section class="collections">
            <h2>컬렉션</h2>
            <div class="collection-grid">
                <div class="collection-card">
                    <img src="${pageContext.request.contextPath}/resources/images/collection-card/c-card1.png" alt="컬렉션1">
                    <h3>오방색 컬렉션</h3>
                    <p>전통 색상의 현대적 재해석</p>
                </div>
                <div class="collection-card">
                    <img src="${pageContext.request.contextPath}/resources/images/collection-card/c-card2.png" alt="컬렉션2">
                    <h3>모던 컬렉션</h3>
                    <p>세련된 현대 스타일</p>
                </div>
                <div class="collection-card">
                    <img src="${pageContext.request.contextPath}/resources/images/collection-card/c-card3.png" alt="컬렉션3">
                    <h3>웨딩 컬렉션</h3>
                    <p>전통과 현대의 조화</p>
                </div>
            </div>
        </section>
    </main>

	<!-- 항상 모든 페이지 하단에는 푸터가 보여지게끔 include -->
	<jsp:include page="common/footer.jsp" />

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const slides = document.querySelectorAll('.carousel-slide');
            const prevBtn = document.querySelector('.carousel-arrow.prev');
            const nextBtn = document.querySelector('.carousel-arrow.next');
            let currentIndex = 0;

            // 초기 슬라이드 설정
            slides[0].classList.add('active');

            function showSlide(index) {
                // 모든 슬라이드 숨기기
                slides.forEach(slide => slide.classList.remove('active'));
                // 현재 슬라이드 보이기
                slides[index].classList.add('active');
            }

            function nextSlide() {
                currentIndex = (currentIndex + 1) % slides.length;
                showSlide(currentIndex);
            }

            function prevSlide() {
                currentIndex = (currentIndex - 1 + slides.length) % slides.length;
                showSlide(currentIndex);
            }

            // 이벤트 리스너 등록
            prevBtn.addEventListener('click', prevSlide);
            nextBtn.addEventListener('click', nextSlide);
        });
    </script>

</body>
</html>