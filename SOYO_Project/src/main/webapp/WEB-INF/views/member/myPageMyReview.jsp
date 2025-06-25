<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        color: #333;
    }

    .container {
        width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    #myTitle {
        width: 100%;
        height: 120px;
        font-size: 40px;
        text-align: center;
        line-height: 120px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-radius: 15px;
        margin-bottom: 30px;
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
    }

    #content {
        width: 100%;
        min-height: 800px;
        display: flex;
        gap: 30px;
    }

    #left-Menu {
        width: 200px;
        flex-shrink: 0;
    }

    #myContent {
        flex: 1;
        background: white;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .content-header {
        background: linear-gradient(135deg, #fce3ec 0%, #fccde2 100%);
        color: #df7b99;
        padding: 25px 30px;
        font-size: 28px;
        font-weight: 600;
        text-align: center;
    }

    #order-List {
        padding: 30px;
    }

    #order-List > ul {
        list-style: none;
    }

    #order-List > ul > li {
        background: white;
        border: 2px solid #e9ecef;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 20px;
        transition: all 0.3s ease;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    }

    #order-List > ul > li:hover {
        border-color: #667eea;
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.15);
        transform: translateY(-2px);
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        padding-bottom: 15px;
        border-bottom: 2px solid #f8f9fa;
    }

    .product-name {
        font-size: 20px;
        font-weight: 600;
        color: #495057;
    }

    .review-date {
        color: #6c757d;
        font-size: 14px;
    }

    .review-content-wrapper {
        display: flex;
        gap: 20px;
        align-items: flex-start;
    }

    .product-img {
        flex-shrink: 0;
    }

    .product-img img {
        width: 120px;
        height: 120px;
        border-radius: 10px;
        object-fit: cover;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .review-details {
        flex: 1;
    }

    .review-title {
        font-size: 18px;
        font-weight: 600;
        color: #495057;
        margin-bottom: 10px;
    }

    .ratingbar {
        color: #ffd700;
        font-size: 18px;
        margin-bottom: 10px;
    }

    .review-text {
        color: #6c757d;
        line-height: 1.6;
        margin-bottom: 15px;
    }

    .review-actions {
        display: flex;
        gap: 10px;
    }

    .btn-edit, .btn-delete {
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
        text-align: center;
    }

    .btn-edit {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
    }

    .btn-edit:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    }

    .btn-delete {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        color: white;
    }

    .btn-delete:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(240, 147, 251, 0.4);
    }

    #page {
        text-align: center;
        margin-top: 30px;
        padding: 20px;
    }

    #page > button {
        padding: 10px 15px;
        margin: 0 5px;
        border: 2px solid #e9ecef;
        background: white;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-weight: 600;
    }

    #page > button:hover {
        border-color: #667eea;
        background: #667eea;
        color: white;
    }

    /* 리뷰 수정 모달창 스타일 */
    .review-modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 10000;
        backdrop-filter: blur(5px);
    }

    .review-modal-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        width: 500px;
        max-width: 90vw;
        border-radius: 16px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        overflow: hidden;
        animation: modalSlideIn 0.3s ease-out;
    }

    @keyframes modalSlideIn {
        from {
            opacity: 0;
            transform: translate(-50%, -60%);
        }
        to {
            opacity: 1;
            transform: translate(-50%, -50%);
        }
    }

    .review-modal-header {
        background: linear-gradient(135deg, #7a8fd8 0%, #8a6bb3 100%);
        color: white;
        padding: 24px 32px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .review-modal-header h2 {
        margin: 0;
        font-size: 20px;
        font-weight: 500;
    }

    .review-close-btn {
        background: none;
        border: none;
        color: white;
        font-size: 35px;
        cursor: pointer;
        padding: 0;
        width: 35px;
        height: 32px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        transition: background-color 0.2s;
        margin-left: 5px;
    }

    .review-close-btn:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }

    .review-modal-body {
        padding: 32px;
    }

    .form-group {
        margin-bottom: 24px;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #333;
        font-size: 17px;
        text-align: center;
    }

    .form-group input[type="text"],
    .form-group textarea {
        width: 100%;
        padding: 12px 16px;
        border: 2px solid #e1e5e9;
        border-radius: 8px;
        font-size: 16px;
        transition: all 0.3s ease;
        box-sizing: border-box;
        font-family: inherit;
    }

    .form-group input[type="text"]::placeholder,
    .form-group textarea::placeholder {
        font-size: 16px;
    }

    .form-group input[type="text"]:focus,
    .form-group textarea:focus {
        outline: none;
        border-color: #7a8fd8;
        box-shadow: 0 0 0 3px rgba(122, 143, 216, 0.1);
    }

    .form-group textarea {
        resize: vertical;
        min-height: 100px;
    }

    /* 별점 스타일 */
    .star-rating {
        display: flex;
        flex-direction: row-reverse;
        gap: 4px;
        justify-content: center;
    }

    .star-rating input[type="radio"] {
        display: none;
    }

    .star-rating .star {
        font-size: 32px;
        color: #ddd;
        cursor: pointer;
        transition: color 0.2s ease;
        user-select: none;
    }

    .star-rating .star:hover,
    .star-rating .star:hover ~ .star,
    .star-rating input[type="radio"]:checked ~ .star {
        color: #ffd700;
    }

    .review-modal-footer {
        display: flex;
        gap: 12px;
        justify-content: flex-end;
        margin-top: 32px;
    }

    .btn-cancel,
    .btn-submit {
        padding: 12px 24px;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        min-width: 100px;
    }

    .btn-cancel {
        background-color: #f8f9fa;
        color: #6c757d;
        border: 2px solid #e9ecef;
    }

    .btn-cancel:hover {
        background-color: #e9ecef;
        border-color: #dee2e6;
    }

    .btn-submit {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
    }

    .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    }

    .btn-submit:active {
        transform: translateY(0);
    }

    /* 빈 리뷰 상태 */
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        color: #6c757d;
    }

    .empty-state i {
        font-size: 48px;
        margin-bottom: 20px;
        color: #dee2e6;
    }

    .empty-state h3 {
        margin-bottom: 10px;
        color: #495057;
    }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br><br><br>

<!-- 리뷰 수정 모달창 -->
<div id="reviewModal" class="review-modal">
    <div class="review-modal-content">
        <div class="review-modal-header">
            <h2>리뷰 수정</h2>
            <button class="review-close-btn" onclick="closeReviewModal()">&times;</button>
        </div>
        <div class="review-modal-body">
            <form id="reviewForm">
                <input type="hidden" id="reviewNo" name="reviewNo">
                <div class="form-group">
                    <label for="reviewTitle">리뷰 제목</label>
                    <input type="text" id="reviewTitle" name="reviewTitle" placeholder="리뷰 제목을 입력해주세요" required>
                </div>
                
                <div class="form-group">
                    <label for="reviewContent">리뷰 내용</label>
                    <textarea id="reviewContent" name="reviewContent" placeholder="상품에 대한 솔직한 리뷰를 작성해주세요" rows="5" required></textarea>
                </div>
                
                <div class="form-group">
                    <label>별점</label>
                    <div class="star-rating">
                        <input type="radio" id="star5" name="rating" value="5">
                        <label for="star5" class="star">★</label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4" class="star">★</label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3" class="star">★</label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2" class="star">★</label>
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1" class="star">★</label>
                    </div>
                </div>
                
                <div class="review-modal-footer">
                    <button type="button" class="btn-cancel" onclick="closeReviewModal()">취소</button>
                    <button type="submit" class="btn-submit">리뷰 수정</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="container">
    <div id="content">
        <div id="left-Menu">
            <jsp:include page="leftMenu.jsp" />
        </div>
        <div id="myContent">
            <div class="content-header">
                내 리뷰 (디자인 수정 중)
            </div>
            <div id="order-List">
                <c:choose>
                    <c:when test="${empty myreview}">
                        <div class="empty-state">
                            <i>📝</i>
                            <h3>아직 작성한 리뷰가 없습니다</h3>
                            <p>상품을 구매하고 리뷰를 작성해보세요!</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul>
                            <c:forEach var="r" items="${myreview}">
                                <li>
                                    <div class="review-header">
                                        <div class="product-name">${r.productName}</div>
                                        <div class="review-date">${r.reviewDate}</div>
                                    </div>
                                    <div class="review-content-wrapper">
                                        <div class="product-img">
                                            <img src="${r.reviewThumbnailChange}" alt="${r.productName}">
                                        </div>
                                        <div class="review-details">
                                            <div class="ratingbar">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <c:choose>
                                                        <c:when test="${i <= r.rating}">★</c:when>
                                                        <c:otherwise>☆</c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <div class="review-title">${r.reviewTitle}</div>
                                            <div class="review-text">${r.reviewContent}</div>
                                            <div class="review-actions">
                                                <button class="btn-edit" onclick="openReviewModal(${r.reviewNo})">리뷰 수정</button>
                                                <button class="btn-delete" onclick="deleteReview(${r.reviewNo})">리뷰 삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <c:if test="${not empty myreview}">
                <div id="page">
                    <c:if test="${pi.currentPage > 1}">
                        <button onclick="location.href='?page=${pi.currentPage - 1}'">&lt;</button>
                    </c:if>
                    
                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                        <button onclick="location.href='?page=${p}'" 
                                style="${p == pi.currentPage ? 'background: #667eea; color: white; border-color: #667eea;' : ''}">
                            ${p}
                        </button>
                    </c:forEach>
                    
                    <c:if test="${pi.currentPage < pi.maxPage}">
                        <button onclick="location.href='?page=${pi.currentPage + 1}'">&gt;</button>
                    </c:if>
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

<script>
    // 리뷰 수정 모달창 관련 함수들
    function openReviewModal(reviewNo) {
        // 리뷰 상세 정보 가져오기
        $.ajax({
            url: '${pageContext.request.contextPath}/review/detail',
            type: 'GET',
            data: { reviewNo: reviewNo },
            success: function(response) {
                if (response.success) {
                    const review = response.review;
                    
                    // 폼에 기존 데이터 채우기
                    $('#reviewNo').val(review.reviewNo);
                    $('#reviewTitle').val(review.reviewTitle);
                    $('#reviewContent').val(review.reviewContent);
                    
                    // 별점 설정
                    $('input[name="rating"]').prop('checked', false);
                    $(`input[name="rating"][value="${review.rating}"]`).prop('checked', true);
                    
                    // 모달창 제목에 상품명 표시
                    $('.review-modal-header h2').text('리뷰 수정 - ' + review.productName);
                    
                    // 모달창 열기
                    $('#reviewModal').show();
                } else {
                    alert('리뷰 정보를 불러오는데 실패했습니다: ' + response.message);
                }
            },
            error: function(xhr) {
                console.error('서버 오류:', xhr.responseText);
                alert('서버 오류가 발생했습니다.');
            }
        });
    }

    function closeReviewModal() {
        $('#reviewModal').hide();
        $('#reviewForm')[0].reset();
    }

    // 리뷰 수정 폼 제출
    $('#reviewForm').on('submit', function(e) {
        e.preventDefault();

        const title = $('#reviewTitle').val().trim();
        const content = $('#reviewContent').val().trim();
        const rating = $('input[name="rating"]:checked').val();
        const reviewNo = $('#reviewNo').val();

        if (!title) {
            alert('리뷰 제목을 입력해주세요.');
            return;
        }

        if (!content) {
            alert('리뷰 내용을 입력해주세요.');
            return;
        }

        if (!rating) {
            alert('별점을 선택해주세요.');
            return;
        }

        const reviewData = {
            reviewNo: parseInt(reviewNo),
            reviewTitle: title,
            reviewContent: content,
            rating: parseInt(rating)
        };

        $.ajax({
            url: '${pageContext.request.contextPath}/review/update',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(reviewData),
            success: function(response) {
                if (response.success) {
                    alert('리뷰가 수정되었습니다!');
                    closeReviewModal();
                    location.reload();
                } else {
                    alert('리뷰 수정 실패: ' + response.message);
                }
            },
            error: function(xhr) {
                console.error('서버 오류:', xhr.responseText);
                alert('서버 오류가 발생했습니다.');
            }
        });
    });

    // 리뷰 삭제 함수
    function deleteReview(reviewNo) {
        if (confirm('정말로 이 리뷰를 삭제하시겠습니까?')) {
            const reviewData = {
                reviewNo: reviewNo
            };

            $.ajax({
                url: '${pageContext.request.contextPath}/review/delete',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(reviewData),
                success: function(response) {
                    if (response.success) {
                        alert('리뷰가 삭제되었습니다!');
                        location.reload();
                    } else {
                        alert('리뷰 삭제 실패: ' + response.message);
                    }
                },
                error: function(xhr) {
                    console.error('서버 오류:', xhr.responseText);
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    }

    // 모달창 외부 클릭 시 닫기
    $(window).click(function(e) {
        if (e.target == document.getElementById('reviewModal')) {
            closeReviewModal();
        }
    });
</script>

</body>
</html>