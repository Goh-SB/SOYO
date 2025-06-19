<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰</title>
<style>
    body {
        font-family: 'Noto Sans KR', Arial, sans-serif;
        background: #fff;
        margin: 0;
        padding: 0;
    }

    @font-face {
        font-family: 'SBAggroB';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    #top-title {
        text-align: right;
        width: 90%;
        font-size: 30px;
        font-family: 'SBAggroB', Arial, sans-serif;
        color: #666;
    }

    .review-container {
        max-width: 1585px;
        margin: 40px auto;
        background: #fff;
        padding: 0 24px 24px 24px;
        margin-top: 20px;
    }
    .review-table {
        width: 100%;
        border-collapse: collapse;
        background: #fff;
    }
    .review-table th, .review-table td {
        text-align: left;
        padding: 14px 10px;
        font-size: 17px;
        padding-right: 20px;
    }
    .review-table th {
        color: #444;
        font-weight: 500;
        border-bottom: 2px solid #e5e5e5;
        background: #fafafa;
        letter-spacing: 0.02em;
    }
    .review-table td {
        border-bottom: 1px solid #f0f0f0;
        vertical-align: middle;
    }
    .review-no {
        width: 120px;
        color: #666;
        text-align: center;
    }
    .review-product {
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .review-thumbnail {
        width: 150px;
        height: 200px;
        object-fit: cover;
        border-radius: 4px;
        border: 1px solid #eee;
        background: #fafafa;
    }
    .review-product-name {
        font-weight: 500;
        color: #222;
        font-size: 15px;
    }
    .review-subject {
        color: #222;
        font-size: 15px;
        word-break: break-all;
    }
    .review-writer {
        color: #444;
        font-size: 15px;
        text-align: center;
        width: 120px;
    }
    .review-rating {
        text-align: center;
        font-size: 17px;
        color: #222;
        letter-spacing: 2px;
        width: 100px;
    }
    .review-photo-icon {
        font-size: 15px;
        color: #888;
        margin-right: 4px;
        vertical-align: middle;
    }
    @media (max-width: 700px) {
        .review-container { padding: 0 2px; }
        .review-table th, .review-table td { font-size: 13px; padding: 8px 4px; }
        .review-thumbnail { width: 38px; height: 48px; }
    }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <br><br><br><br>

    <p id="top-title">.Review</p>

    <div class="review-container">
        <table class="review-table">
            <thead>
                <tr>
                    <th>&nbsp;Product</th>
                    <th>Subject</th>
                    <th class="review-no">Date</th>
                    <th class="review-writer">Writer</th>
                    <th class="review-rating">Rating</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="review-product">
                            <img src="https://i.imgur.com/1.jpg" class="review-thumbnail" alt="상품 이미지">
                            <span class="review-product-name">뉴 청당초문 갈래 드레스</span>
                        </div>
                    </td>
                    <td class="review-subject">
                        <span class="review-photo-icon">&#128247;</span>
                        결혼 1주년 기념여행 때 챙겨가서 입었습니다!
                    </td>
                    <td class="review-no">2025-06-18</td>
                    <td class="review-writer">김수민</td>
                    <td class="review-rating">
                        <span style="color:#222;">★★★★★</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="review-product">
                            <img src="https://i.imgur.com/2.jpg" class="review-thumbnail" alt="상품 이미지">
                            <span class="review-product-name">피날레 드레스</span>
                        </div>
                    </td>
                    <td class="review-subject">
                        <span class="review-photo-icon">&#128247;</span>
                        예뻐요 진짜, 감사합니다~
                    </td>
                    <td class="review-no">2025-06-18</td>
                    <td class="review-writer">김가현</td>
                    <td class="review-rating">
                        <span style="color:#222;">★★★★☆</span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>