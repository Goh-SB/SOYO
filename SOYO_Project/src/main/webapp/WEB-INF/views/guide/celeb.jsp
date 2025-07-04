<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>셀러브리티 게시판</title>
    <style>

        @font-face {
            font-family: 'NEXON Lv2 Gothic';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .celeb-container {
            max-width: 1500px;
            margin: 0 auto;
            padding: 20px;
            font-family: 'NEXON Lv2 Gothic';
        }
        .celeb-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
            margin-top: 30px;
        }
        .celeb-item {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .celeb-item:hover {
            transform: translateY(-5px);
        }
        .celeb-image {
            width: 100%;
            height: 500px;
        }
        .celeb-info {
            padding: 15px;
            background: white;
        }
        .celeb-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 15px;
        }
        .celeb-description {
            font-size: 0.9rem;
            color: #666;
            text-align: right;
        }

        #celeb-title {
            font-size: 2rem;
            font-weight: 600;
            text-align: center;
        }
    </style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<br><br><br><br>

    <div class="celeb-container">
        <h1 id="celeb-title">GALLERY</h1>
        <br>
        <div class="celeb-grid">
            
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/1.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">청하 (가수)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/4.PNG" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">신승태 (가수)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/2.png" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">이창호 (개그맨)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/3.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">린 (가수)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>

            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/12.png" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">레드스퀘어 (모델)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>

            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/5.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">다니엘 (뉴진스)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/7.PNG" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">타이거JK (래퍼)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/8.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">김태리 (배우)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/6.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">김연아 (前 피겨선수)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/9.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">신유진 (소리꾼)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/11.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">장갑수 (배우)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
            <div class="celeb-item">
                <img src="${pageContext.request.contextPath}/resources/images/celeb/10.jpg" alt="셀러브리티 이미지" class="celeb-image">
                <div class="celeb-info">
                    <h3 class="celeb-title">김서윤 (배우)</h3>
                    <p class="celeb-description">with SOYO</p>
                </div>
            </div>
        </div>
    </div>
    
    <br><br><br>
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>
