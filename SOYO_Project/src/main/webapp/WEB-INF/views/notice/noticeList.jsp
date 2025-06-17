<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>

		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=image" />
	</head>

	<style>
		body {
			width: 1920px;
			min-height: 100vh;			/* 최소 세로 크기 : 100% */
		}

		div {
			box-sizing: border-box;		/* 테두리와 안쪽 여백의 크기도 요소의 크기로 고려 */
		}

		.list_form {
			width : 1400px;
			margin : auto;
			margin-top : 50px;
		}

		.paging-area {
			text-align: center;
		}

		.pagination {
			margin: 0px;
		}

		
		.page-link {
			color: black;
			font-weight: 700;
		}
	</style>

	<body>
		<!-- jquery 연동 구문 -->
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

		<!-- Bootstrap 연동 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

		<!-- Bootstrap에서 필요로 하는 기타 js 파일들 -->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

		<jsp:include page="../common/menubar.jsp" /><br>
		<br class="list_wrap">
			<div class="list_form">
				<h2 align="center"></h2>
				<table class="list_area table table-hover" align="center">
					<thead align="center">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:choose>
							<c:when test="${ empty requestScope.list }">
								<tr>
									<td colspan="6">
										조회된 공지사항이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${ requestScope.list }">
									<tr>
										<!-- 번호/제목/날짜 -->
										<td>${ i.noticeNo }</td>

										<c:choose>
											<c:when test="${ empty i.noticeImage }">
												<td>${ i.noticeType } ${ i.noticeTitle }</td>
											</c:when>

											<c:otherwise>
												<td>
													&#91;${ i.noticeType }&#93; ${ i.noticeTitle }
													<span class="material-symbols-outlined">image</span>
												</td>
											</c:otherwise>
										</c:choose>

										<td>${ i.noticeDate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="paging-area">
				<ul class="pagination justify-content-center">
					<!-- currentPage가 1번 페이지일 경우 Previous 비활성화 -->
					<c:choose>
						<c:when test="${ requestScope.pi.currentPage eq 1 }">
							<li class="page-item disabled">
								<a class="page-link">
									&lt;
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" 
								href="/soyo/notice/noticeList?nPage=${ requestScope.pi.currentPage - 1 }">
									&lt;
								</a>
							</li>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="p" begin="${ requestScope.pi.startPage }"
									end="${ requestScope.pi.endPage }"
									step="1">
					
						<!-- 현재 내가 보고 있는 페이지 버튼은 비활성화 -->
						<c:choose>
							<c:when test="${ requestScope.pi.currentPage eq p }">
								<li class="page-item active">
									<a class="page-link">
										${ p }
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="/soyo/notice/noticeList?nPage=${ p }">
										${ p }
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- currentPage가 maxPage일 경우 Next 비활성화 -->
					<c:choose>
						<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
							<li class="page-item disabled">
								<a class="page-link">
									&gt;
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" 
								href="/soyo/notice/noticeList?nPage=${ requestScope.pi.currentPage + 1 }">
									&gt;
								</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div><br/>
		</div>
		<script>
			$(function() {
				// 게시글 하나를 나타내는 tr 요소에 클릭 이벤트 걸기
				$(".list_area>tbody>tr").click(function() {
					// 클릭된 공지사항의 글 번호(primary key) 추출 
					let nno = $(this).children().eq(0).text();

					// 공지사항 상세 조회 요청 시 아래 주소로 요청
					location.href="/soyo/notice/noticeDetail/" + nno;
				});
			});
		</script>
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>