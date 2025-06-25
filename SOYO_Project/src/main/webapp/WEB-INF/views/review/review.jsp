<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    @font-face {
        font-family: 'paybooc-Bold';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    @font-face {
        font-family: 'KakaoSmallSans-Bold';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2503@1.0/KakaoSmallSans-Bold.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

    #top-title {
        text-align: center;
        width: 100%;
        padding-top: 20px;
        font-size: 23px;
        font-family: 'paybooc-Bold', Arial, sans-serif;
        color: #606060;
        margin: 0 auto 17px auto;
        letter-spacing: 0.02em;
    }

    .review-container {
        max-width: 1540px;
        margin: 40px auto;
        background: #fff;
        padding: 0 24px 24px 24px;
        margin-top: 25px;
        padding-bottom: 33px;
        margin-bottom: 60px;
        border-radius: 14px;
        box-shadow: 0 4px 24px rgba(0,0,0,0.07);
    }
    .review-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        background: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,0.03);
    }
    .review-table th, .review-table td {
        padding: 18px 12px;
        font-size: 17px;
        vertical-align: middle;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .review-table th {
        color: #444;
        font-weight: 600;
        border-bottom: 2px solid #e5e5e5;
        background: #fafafa;
        letter-spacing: 0.02em;
        text-align: center;
    }
    .review-table td {
        border-bottom: 1px solid #f0f0f0;
        background: #fff;
        text-align: center;
    }
    .review-no {
        width: 110px;
        color: #666;
        text-align: center;
    }
    .review-product {
        display: flex;
        align-items: center;
        gap: 18px;
        min-width: 220px;
        max-width: 320px;
        text-align: left;
    }
    .review-thumbnail {
        width: 60px;
        height: 80px;
        object-fit: cover;
        border-radius: 4px;
        border: 1px solid #eee;
        background: #fafafa;
        flex-shrink: 0;
    }
    .review-product-name {
        font-weight: 500;
        color: #222;
        font-size: 15px;
        max-width: 180px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .review-subject {
        color: #222;
        font-size: 15px;
        word-break: break-all;
        max-width: 320px;
        text-align: left;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .review-writer {
        color: #444;
        font-size: 15px;
        text-align: center;
        width: 110px;
    }
    .review-rating {
        text-align: center;
        font-size: 15px;
        color: #222;
        width: 110px;
        letter-spacing: 1.5px;
    }
    .review-rating>span {
        font-size: 17px;
        color: #eb9f9f !important;
    }
    .review-photo-icon {
        font-size: 15px;
        color: #888;
        margin-right: 5px;
        vertical-align: middle;
    }
    @media (max-width: 900px) {
        .review-container { padding: 0 2px; }
        .review-table th, .review-table td { font-size: 13px; padding: 10px 4px; }
        .review-thumbnail { width: 38px; height: 48px; }
        .review-product, .review-subject { max-width: 120px; }
    }
    @media (max-width: 600px) {
        .review-table th, .review-table td { font-size: 11px; padding: 6px 2px; }
        .review-thumbnail { width: 28px; height: 36px; }
        .review-product, .review-subject { max-width: 80px; }
    }
    /* Best Review 카드 스타일 */
    .best-review-section {
        max-width: 1540px;
        margin: 0 auto 30px auto;
    }
    .best-review-title {
        font-family: 'KakaoSmallSans-Bold', Arial, sans-serif;
        font-size: 26px;
        color: #606060;
        margin-bottom: 0px;
        margin-left: 6px;
        letter-spacing: 0.02em;
    }
    .best-review-list {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        overflow-x: hidden;
        width: 100%;
        gap: 10px;
    }
    .best-review-card {
        background: #fff;
        box-shadow: 0 2px 8px rgba(0,0,0,0.07);
        width: calc((100% - 40px) / 5);
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        padding: 18px 18px 12px 18px;
        position: relative;
        border: 1px solid #e2e2e28c;
        box-sizing: border-box;
    }
    .best-review-img {
        width: 100%;
        object-fit: contain;
        border-radius: 8px;
        border: 1px solid #eee;
        background: #fafafa;
        margin-bottom: 12px;
    }

    .best-review-subject {
        font-weight: 600;
        font-size: 16px;
        color: #222;
        margin-bottom: 6px;
        max-width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .best-review-content {
        color: #555;
        font-size: 14px;
        margin-bottom: 10px;
        min-height: 42px;
        max-height: 80px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }
    .best-review-rating {
        color: #ff9800;
        font-size: 15px;
        margin-bottom: 6px;
        letter-spacing: 1.5px;
    }
    .best-review-footer {
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 13px;
        color: #888;
        margin-top: auto;
        width: 100%;
        position: relative;
    }
    .best-review-writer {
        font-weight: 500;
        color: #444;
    }
    .best-review-shop {
        font-size: 12px;
        color: #b07aff;
        background: #f5f1ff;
        border-radius: 8px;
        padding: 2px 8px;
        margin-left: 4px;
        position: absolute;
        right: 0px;
        bottom: 0px;
    }
    @media (max-width: 900px) {
        .best-review-card { min-width: 180px; max-width: 200px; padding: 10px 8px 8px 8px; }
        .best-review-img { height: 90px; }
        .best-review-title { font-size: 18px; }
    }
	
	.paging-area {
		margin-top: 30px;
		text-align: center;
	}

	.pagination {
		display: inline-flex;
		list-style: none;
		gap: 5px;
		padding: 0;
	}

	.page-item {
		display: inline-block;
	}

	.page-link {
		display: block;
		padding: 8px 12px;
		text-decoration: none;
		color: #495057;
		border: 1px solid #dee2e6;
		border-radius: 4px;
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
</head>
<body>

    <jsp:include page="../common/menubar.jsp" />

    <br><br><br><br>

    <div class="best-review-section">
        <div class="best-review-title">TOP-5</div>
        <div class="best-review-list">
            <c:forEach var="review" items="${bestReviewList}" varStatus="status">
                <c:if test="${status.index lt 5}">
                    <div class="best-review-card">
                        <img src="http://localhost:8100/soyo/resources/product_upfile/${review.productChange}" class="best-review-img" alt="리뷰 이미지">
                        <div class="best-review-subject">${review.reviewTitle}</div>
                        <div class="best-review-content">${review.reviewContent}</div>
                        <div class="best-review-rating">
                            <c:forEach begin="1" end="5" var="i">
                                <c:choose>
                                    <c:when test="${i <= review.rating}">★</c:when>
                                    <c:otherwise>☆</c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div class="best-review-footer">
                            <span class="best-review-writer">${review.memberName}</span>
                            <span class="best-review-shop">
                                <b>TOP-${status.index + 1}</b>
                            </span>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <div class="review-container">
        <p id="top-title">리뷰 전체보기</p>
        <table class="review-table">
            <thead>
                <tr>
                    <th style="width: 240px; text-align:left;">&nbsp;Product</th>
                    <th style="width: 320px; text-align:left;">Subject</th>
                    <th class="review-no">Date</th>
                    <th class="review-writer">Writer</th>
                    <th class="review-rating">Rating</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="review" items="${reviewList}">
                    <tr>
                        <td style="text-align:left;">
                            <div class="review-product">
                                <img src="http://localhost:8100/soyo/resources/product_upfile/${review.productChange}" class="review-thumbnail">
                                <span class="review-product-name">${review.reviewTitle}</span>
                            </div>
                        </td>
                        <td class="review-subject" style="text-align:left;">
                            <!--
                            <span class="review-photo-icon">&#128247;</span>
                            -->
                            ${review.reviewContent}
                        </td>
                        <td class="review-no">
                            <fmt:formatDate value="${review.reviewDate}" pattern="yyyy-MM-dd"/>
                        </td>
                        <td class="review-writer">${review.memberName}</td>
                        <td class="review-rating">
                            <span style="color:#222;">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= review.rating}">★</c:when>
                                        <c:otherwise>☆</c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            


        </table>
		
		<div class="paging-area">
			<ul class="pagination">
				<c:if test="${ pi.currentPage > 1 }">
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/review/review?page=${ pi.currentPage - 1 }">&lt;</a>
					</li>
				</c:if>

				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<li class="page-item <c:if test='${ p eq pi.currentPage }'>active</c:if>">
						<a class="page-link" href="${ pageContext.request.contextPath }/review/review?page=${ p }">${ p }</a>
					</li>
				</c:forEach>

				<c:if test="${ pi.currentPage < pi.maxPage }">
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/review/review?page=${ pi.currentPage + 1 }">&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>

    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>