<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소요 - 베스트 리뷰</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');

        @font-face {
            font-family: 'Binggrae-Two';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'Dolbomche_R';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/Dolbomche_R.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #f5ebf4a2;
        }

        .container {
            max-width: 1600px;
            margin: auto;
            margin-top: 130px;
            margin-bottom: 80px;
            padding: 20px 150px 20px 150px;
            background-color: #ffffffa4;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
            border-radius: 15px;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header h1 {
            color: #505050;
            font-size: 2.5rem;
            margin-bottom: 20px;
            padding-top: 70px;
            font-family: 'Binggrae-Two', sans-serif !important;
        }

        .header p {
            color: #546E7A;
            font-size: 1.4rem;
            font-family: 'Dolbomche_R', sans-serif;
            padding-bottom: 10px;
        }

        .review-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .review-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 30px;
            transition: transform 0.3s ease;
            display: flex;
            gap: 30px;
            margin-bottom: 30px;
        }

        .review-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .review-thumbnail {
            width: 200px;
            height: 300px;
            object-fit: cover;
            border-radius: 4px;
        }

        .review-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .review-title {
            font-size: 1.6rem;
            color: #638aa7;
            margin-top: 15px;
        }

        .review-text {
            color: #444;
            line-height: 1.8;
            margin-top: 20px;
            flex: 1;
            font-size: 1.1rem;
        }

        .review-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #666;
            font-size: 1rem;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        .review-info {
            display: flex;
            gap: 35px;
            font-size: 1.1rem;
        }

        .rating {
            color: #ffc107;
        }

        .material-icons {
            font-size: 1.6rem;
            vertical-align: middle;
        }

        @media (max-width: 768px) {
            .review-card {
                flex-direction: column;
            }
            
            .review-thumbnail {
                width: 100%;
                height: 200px;
            }
        }
    </style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <div class="container">
        <div class="header">
            <h1>BEST REVIEW</h1>
            <p>소요에서 직접 선정한 최고의 리뷰 <b>TOP-5</b> 를 만나보세요.</p>
        </div>

        <div class="review-list">
            <!-- 베스트 리뷰 1 -->
            <div class="review-card">
                <img src="https://via.placeholder.com/200x150" alt="리뷰 썸네일" class="review-thumbnail">
                <div class="review-content">
                    <div class="review-meta">
                        <span class="rating">
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                        </span>
                        <div class="review-info">
                            <span>김**</span>
                            <span>2025.03.15</span>
                        </div>
                    </div>
                    <h2 class="review-title">정말 만족스러운 서비스였습니다</h2>
                    <p class="review-text">직원분들의 친절한 응대와 깔끔한 시설이 인상적이었어요. 특히 서비스 품질이 정말 좋았습니다.</p>
                </div>
            </div>
            <div class="review-card">
                <img src="https://via.placeholder.com/200x150" alt="리뷰 썸네일" class="review-thumbnail">
                <div class="review-content">
                    <div class="review-meta">
                        <span class="rating">
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                        </span>
                        <div class="review-info">
                            <span>김**</span>
                            <span>2025.03.15</span>
                        </div>
                    </div>
                    <h2 class="review-title">정말 만족스러운 서비스였습니다</h2>
                    <p class="review-text">직원분들의 친절한 응대와 깔끔한 시설이 인상적이었어요. 특히 서비스 품질이 정말 좋았습니다.</p>
                </div>
            </div>
            <div class="review-card">
                <img src="https://via.placeholder.com/200x150" alt="리뷰 썸네일" class="review-thumbnail">
                <div class="review-content">
                    <div class="review-meta">
                        <span class="rating">
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                        </span>
                        <div class="review-info">
                            <span>김**</span>
                            <span>2025.03.15</span>
                        </div>
                    </div>
                    <h2 class="review-title">정말 만족스러운 서비스였습니다</h2>
                    <p class="review-text">직원분들의 친절한 응대와 깔끔한 시설이 인상적이었어요. 특히 서비스 품질이 정말 좋았습니다.</p>
                </div>
            </div>
            <div class="review-card">
                <img src="https://via.placeholder.com/200x150" alt="리뷰 썸네일" class="review-thumbnail">
                <div class="review-content">
                    <div class="review-meta">
                        <span class="rating">
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                        </span>
                        <div class="review-info">
                            <span>김**</span>
                            <span>2025.03.15</span>
                        </div>
                    </div>
                    <h2 class="review-title">정말 만족스러운 서비스였습니다</h2>
                    <p class="review-text">직원분들의 친절한 응대와 깔끔한 시설이 인상적이었어요. 특히 서비스 품질이 정말 좋았습니다.</p>
                </div>
            </div>
            <div class="review-card">
                <img src="https://via.placeholder.com/200x150" alt="리뷰 썸네일" class="review-thumbnail">
                <div class="review-content">
                    <div class="review-meta">
                        <span class="rating">
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                            <i class="material-icons">star</i>
                        </span>
                        <div class="review-info">
                            <span>김**</span>
                            <span>2025.03.15</span>
                        </div>
                    </div>
                    <h2 class="review-title">정말 만족스러운 서비스였습니다</h2>
                    <p class="review-text">직원분들의 친절한 응대와 깔끔한 시설이 인상적이었어요. 특히 서비스 품질이 정말 좋았습니다.</p>
                </div>
            </div>

            <br>

        </div>
    </div>


    <jsp:include page="../common/footer.jsp" />
</body>
</html>