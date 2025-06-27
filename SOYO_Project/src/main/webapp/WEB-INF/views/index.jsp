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

        @font-face {
            font-family: 'PyeongChang-Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChang-Bold.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'Dolbomche_R';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/Dolbomche_R.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'SF_HailSnow';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/SF_HailSnow.woff') format('woff');
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
            overflow: hidden;
        }


        .hero-content h2 {
            font-size: 2.9rem;
            color: #5D4E47;
            margin-bottom: 1rem;
            font-family: 'PyeongChang-Bold', sans-serif;
        }

        .hero-content p {
            font-size: 1.6rem;
            color: #816a5fbb;
            margin-bottom: 2rem;
            font-weight: 500;
            line-height: 1.6;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            font-family: 'Dolbomche_R', sans-serif;
        }

        .cta-button {
            background: linear-gradient(135deg, rgba(212, 165, 116, 0.95) 0%, rgba(212, 165, 116, 0.85) 100%);
            color: white;
            padding: 0.7rem 1.5rem;
            border-radius: 30px;
            text-decoration: none;
            font-size: 1.7rem;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            font-family: 'SF_HailSnow', sans-serif;
            
        }

        .cta-button:hover {
            background-color: #bd9468;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3);
            transform: translateY(-3px);
        }

        .cta-button2 {
            background-color: #7C8E9F;
            color: white;
            padding: 1rem 2rem;
            border-radius: 30px;
            text-decoration: none;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .cta-button2:hover {
            background-color: #5b6c7c;
        }


        /* 상품 섹션 */
        .featured-products {
            padding: 5rem 10%;
            padding-top: 55px;
            padding-bottom: 65px;
            background-color: #fff;
        }

        .featured-products h2 {
            text-align: center;
            color: var(--color1);
            margin-bottom: 3rem;
            font-size: 30px;
            font-family: 'NanumSquareRound', sans-serif;
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
            text-decoration: none;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 100%;
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

        .about {
            position: relative;
            padding: 3.5rem 0 6rem 0;
            background: linear-gradient(135deg, #f7f8fa 0%, #ececec 100%);
            overflow: hidden;
        }

        .about::after {
            content: '';
            position: absolute;
            bottom: -100px; right: -100px;
            width: 350px; height: 350px;
            background: radial-gradient(circle, #98acb6 0%, transparent 70%);
            opacity: 0.13;
            z-index: 1;
        }
        .about-content {
            position: relative;
            z-index: 2;
            max-width: 700px;
            margin: 0 auto;
            padding: 3rem 2rem 2.5rem 2rem;
            background: rgba(255,255,255,0.75);
            border-radius: 30px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.10);
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeInUp 1.2s cubic-bezier(.23,1.01,.32,1) both;
        }
        .about-illust {
            width: 124px;
            height: 124px;
            margin-bottom: 1.5rem;
            border-radius: 50%;
            background: radial-gradient(circle at 60% 40%, #fff7ff 55%, #e9c6f7 80%, #f7b6d2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow:
                0 0 0 6px rgba(233,198,247,0.13),
                0 0 16px 4px #f7b6d2,
                0 4px 16px 0 rgba(233,198,247,0.10);
            overflow: hidden;
            position: relative;
            animation: soyo-glow 2.2s cubic-bezier(.23,1.01,.32,1) 0.2s both;
        }
        .about-illust::after {
            content: '';
            position: absolute;
            inset: 0;
            border-radius: 50%;
            box-shadow: 0 0 16px 4px #f7b6d2, 0 0 0 1px #fff7ff inset;
            pointer-events: none;
            opacity: 0.5;
        }
        .about-illust img {
            width: 90px;
            height: 90px;
            object-fit: contain;
            filter: drop-shadow(0 2px 12px rgba(233,198,247,0.18));
            z-index: 1;
        }
        .about-content p {
            color: #7c8e9f;
            line-height: 1.9;
            font-size: 1.38rem;
            margin-bottom: 1.5rem;
            font-family: 'NanumSquareRound', sans-serif;
            animation: fadeIn 1.8s 0.2s both;
        }
        .about-content a.cta-button2 {
            display: inline-flex;
            align-items: center;
            gap: 0.6em;
            padding: 1rem 2.2rem;
            background: linear-gradient(90deg, #98acb6 0%, #f4a6a6 100%);
            color: #fff;
            text-decoration: none;
            border-radius: 30px;
            font-size: 1.13rem;
            font-family: 'NanumSquareRound', sans-serif;
            font-weight: 700;
            box-shadow: 0 4px 16px rgba(152,172,182,0.13);
            letter-spacing: 0.01em;
            text-shadow: 0 1px 4px rgba(244,166,166,0.13);
            transition: background 0.3s, transform 0.2s, box-shadow 0.2s;
        }
        .about-content a.cta-button2 i {
            font-size: 1.1em;
            transition: transform 0.2s;
        }
        .about-content a.cta-button2:hover {
            background: linear-gradient(90deg, #8ABED1 0%, #f4a6a6 100%);
            transform: translateY(-3px) scale(1.06);
            box-shadow: 0 8px 24px rgba(152,172,182,0.18);
            filter: brightness(1.08);
        }
        .about-content a.cta-button2:hover i {
            transform: translateX(3px) scale(1.1);
        }
        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(40px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
        @keyframes soyo-glow {
            0% { opacity: 0; transform: scale(0.8);}
            100% { opacity: 1; transform: scale(1);}
        }

        /* 컬렉션 섹션 */
        .collections {
            padding: 5rem 10%;
            padding-bottom: 90px;
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
            aspect-ratio: 3.6 / 3;
            object-fit: cover;
            display: block;
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
            pointer-events: none;
        }

        .carousel-slide.active {
            opacity: 1;
            pointer-events: auto;
            cursor: pointer;
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

        /* 캐러셀 컨트롤 버튼 스타일 */
        .carousel-controls {
            position: absolute;
            bottom: 50px;
            left: 80px;
            display: flex;
            gap: 10px;
            z-index: 10;
        }

        .carousel-control-btn {
            width: 25px;
            height: 25px;
            border-radius: 50%;
            border: 2px solid white;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .carousel-control-btn.active {
            background: white;
        }

        .carousel-control-btn.play-pause {
            width: 25px;
            height: 25px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.8);
            border: 2px solid white;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .carousel-control-btn.play-pause:hover {
            background: rgba(255, 255, 255, 1);
        }

        .carousel-control-btn.play-pause i {
            color: rgb(107, 107, 107);
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
        }

        .carousel-control-btn.play-pause i.fa-play {
            padding-left: 2px;
        }

        .hero-inner {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 220px;
            flex-wrap: wrap;
        }

        .hero-image {
            flex: 0 0 auto;
        }

        .hero-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100%;
        }

        .about h2 {
            font-family: 'PyeongChang-Bold', sans-serif;
            text-align: center;
            color: var(--color1);
            font-size:2.4rem;
            font-weight: 800;
            letter-spacing:0.04em;
            margin-bottom:0.7em;
            z-index:2;
            position:relative;
        }

        .about-illust {
            animation: soyo-glow 2.2s cubic-bezier(.23,1.01,.32,1) 0.2s both, floatY 3.5s ease-in-out infinite;
        }
        @keyframes floatY {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
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
	            	<a href="${pageContext.request.contextPath}/product/productDetail?no=12">
		                <img src="${pageContext.request.contextPath}/resources/images/slide-1.jpg" alt="슬라이드 1">
	                </a>
	            </div>
                
                <div class="carousel-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/slide-2.jpg" alt="슬라이드 2">
                </div>
                <div class="carousel-slide">
                	<a href="${pageContext.request.contextPath}/product/productDetail?no=17">
                    	<img src="${pageContext.request.contextPath}/resources/images/slide-3.jpg" alt="슬라이드 3">
                	</a>
                </div>
            </div>
            <button class="carousel-arrow prev">
                <i class="fas fa-chevron-left"></i>
            </button>
            <button class="carousel-arrow next">
                <i class="fas fa-chevron-right"></i>
            </button>
            <div class="carousel-controls">
                <button class="carousel-control-btn" data-slide="0"></button>
                <button class="carousel-control-btn" data-slide="1"></button>
                <button class="carousel-control-btn" data-slide="2"></button>
                <button class="carousel-control-btn play-pause">
                    <i class="fas fa-pause"></i>
                </button>
            </div>
        </div>

        <section class="featured-products">
            <h2>추천 상품</h2>
            <div class="product-grid">
                <a href="${pageContext.request.contextPath}/product/productDetail?no=23" class="product-card">
                    <div class="product-card">
                        <img src="http://192.168.40.32:8100/soyo/resources/product_upfile/2025062310514752932.jpg" alt="상품1">
                        <h3>오마주 적삼 자켓 블랙</h3>
                        <p>적삼의 간결한 실루엣에서 영감을 받은 자켓</p>
                        <span class="price">426,000원</span>
                    </div>
                </a>
                
                <a href="${pageContext.request.contextPath}/product/productDetail?no=22" class="product-card">
                    <div class="product-card">
                        <img src="http://192.168.40.32:8100/soyo/resources/product_upfile/2025062310484038247.jpg" alt="상품3">
                        <h3>극락정토 말기 뷔스티에 옥색</h3>
                        <p>한복 말기, 코르셋 디테일을 감각적으로 재해석</p>
                        <span class="price">430,000원</span>
                    </div>
                </a>

                <a href="${pageContext.request.contextPath}/product/productDetail?no=24" class="product-card">
                    <div class="product-card">
                        <img src="http://192.168.40.32:8100/soyo/resources/product_upfile/2025062312055694227.jpg" alt="상품2">
                        <h3>극락정토 말기 뷔스티에 라벤더</h3>
                        <p>문양의 디테일을 살린 은은한 라벤더색 뷔스티에</p>
                        <span class="price">430,000원</span>
                    </div>
                </a>
                

            </div>
            
            	<br>
		        <div id="test-div" style="text-align: center;">
		            <br>
                    <button id="test-button"
                    style="
                        font-size: 1.1rem;
                        font-weight: 600;
                        background: linear-gradient(135deg, #8e8dfa, #a275e3);
                        color: white;
                        padding: 12px 28px;
                        border: none;
                        border-radius: 12px;
                        cursor: pointer;
                        font-family: 'NEXON Lv2 Gothic', 'Noto Sans KR', sans-serif;
                        box-shadow: 0 4px 10px rgba(130, 130, 250, 0.25);
                        transition: all 0.3s ease;
                    "
                    onclick="location.href='${pageContext.request.contextPath}/ai/recommend'"
                    onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 6px 14px rgba(130, 130, 250, 0.35)'"
                    onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 4px 10px rgba(130, 130, 250, 0.25)'"
                >
                    소요 AI - 상품 추천
                </button>
                
		        </div>
		        
        </section>
        
        <section class="about">
            <h2>소요의 이야기</h2>
            <div class="about-content">
                <div class="about-illust">
                    <img src="${pageContext.request.contextPath}/resources/images/real-soyo-logo-resize.png" alt="한복 일러스트">
                </div>
                <p>한복의 아름다움을 감각적으로 재해석한 소요.<br>
                   전통과 현대를 넘나드는, 새로운 패션의 흐름을 이끕니다.</p>
                <a href="<c:url value='/brand' />" class="cta-button2">
                    <i class="fas fa-arrow-right"></i> 더 알아보기
                </a>
            </div>
        </section>


        <section class="hero">
            <div class="hero-inner">
                <div class="hero-image">
                    <img src="${pageContext.request.contextPath}/resources/images/banner-model.png" alt="모델 이미지">
                </div>
                <div class="hero-content">
                    <h2>한복의 새로운 스타일</h2>
                    <p>오방색의 아름다움을 감각적으로 재해석해<br>당신의 일상에 부드럽게 스며든 한복 컬렉션</p>
                    <a href="<c:url value='/celeb' />" class="cta-button">컬렉션 보기</a>
                </div>
            </div>
        </section>


        <section class="collections">
            <h2>소요의 컬렉션</h2>
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
            const controlBtns = document.querySelectorAll('.carousel-control-btn:not(.play-pause)');
            const playPauseBtn = document.querySelector('.carousel-control-btn.play-pause');
            let currentIndex = 0;
            let slideInterval;
            let isPlaying = true;

            // 초기 슬라이드 설정
            slides[0].classList.add('active');
            controlBtns[0].classList.add('active');

            function showSlide(index) {
                // 모든 슬라이드 숨기기
                slides.forEach(slide => slide.classList.remove('active'));
                controlBtns.forEach(btn => btn.classList.remove('active'));
                // 현재 슬라이드 보이기
                slides[index].classList.add('active');
                controlBtns[index].classList.add('active');
            }

            function nextSlide() {
                currentIndex = (currentIndex + 1) % slides.length;
                showSlide(currentIndex);
            }

            function prevSlide() {
                currentIndex = (currentIndex - 1 + slides.length) % slides.length;
                showSlide(currentIndex);
            }

            function startSlideShow() {
                if (slideInterval) clearInterval(slideInterval);
                slideInterval = setInterval(nextSlide, 4000);
            }

            function togglePlayPause() {
                isPlaying = !isPlaying;
                if (isPlaying) {
                    startSlideShow();
                    playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';
                } else {
                    clearInterval(slideInterval);
                    playPauseBtn.innerHTML = '<i class="fas fa-play"></i>';
                }
            }

            // 이벤트 리스너 등록
            prevBtn.addEventListener('click', () => {
                prevSlide();
                if (isPlaying) {
                    startSlideShow();
                }
            });

            nextBtn.addEventListener('click', () => {
                nextSlide();
                if (isPlaying) {
                    startSlideShow();
                }
            });

            controlBtns.forEach((btn, index) => {
                btn.addEventListener('click', () => {
                    currentIndex = index;
                    showSlide(currentIndex);
                    if (isPlaying) {
                        startSlideShow();
                    }
                });
            });

            playPauseBtn.addEventListener('click', togglePlayPause);

            // 자동 슬라이드 시작
            startSlideShow();

            slides.forEach((slide, idx) => {
                // 첫 번째 슬라이드에만 특별 처리
                if(idx === 0) {
                    const firstSlideLink = slide.querySelector('a');
                    slide.addEventListener('click', function(e) {
                        if (slide.classList.contains('active')) {
                            if(firstSlideLink) {
                                firstSlideLink.click();
                            }
                        }
                    });
                    if(firstSlideLink) {
                        firstSlideLink.style.pointerEvents = 'auto';
                    }
                } else if(idx === 1) {
                    // 두 번째 슬라이드 클릭 시 이동
                    slide.addEventListener('click', function(e) {
                        if (slide.classList.contains('active')) {
                            window.location.href = `${pageContext.request.contextPath}/product/productDetail?no=13`;
                        }
                    });
                } else if(idx === 2) {
                    // 세 번째 슬라이드 클릭 시 이동
                    slide.addEventListener('click', function(e) {
                        if (slide.classList.contains('active')) {
                            window.location.href = `${pageContext.request.contextPath}/product/productDetail?no=14`;
                        }
                    });
                }
            });
        });
    </script>

</body>
</html>