<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=image" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
	</head>

	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body {
			width: 100%;
			min-height: 100vh;
			background-color: #f8f9fa;
			font-family: 'Noto Sans KR', sans-serif;
		}

		@font-face {
			font-family: 'SBAggroB';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}

		#top-title {
			text-align: right;
			width: 88%;
			font-size: 30px;
			font-family: 'SBAggroB', Arial, sans-serif;
			color: #666;
		}

		.list_form {
			width: 1500px;
			margin: 20px auto;
			background: white;
			border-radius: 12px;
			box-shadow: 0 2px 8px rgba(0,0,0,0.05);
			padding: 60px 30px 35px 30px;
			position: relative;
		}

		.filter-btn-group {
			display: flex;
			gap: 12px;
			position: absolute;
			top: 20px;
			left: 30px;
		}

		.filter-btn {
			background: #f5f5f5a6;
			color: #495057;
			border: none;
			border-radius: 24px;
			border: 1px groove #acacac33;
			padding: 8px 28px;
			font-size: 15px;
			font-weight: 500;
			box-shadow: 0 2px 6px rgba(0,0,0,0.07);
			cursor: pointer;
			transition: background 0.2s, color 0.2s, box-shadow 0.2s;
			outline: none;
		}
		.filter-btn:hover, .filter-btn.active {
			background: #a4c0d4;
			color: #fff;
			box-shadow: 0 4px 12px rgba(25,118,210,0.12);
		}

		.search-bar-area {
			margin: 40px auto 0 auto;
			display: flex;
			justify-content: center;
			align-items: center;
			gap: 0;
			width: 100%;
			max-width: 600px;
		}
		.search-select {
			padding: 10px 16px;
			border: none;
			border-radius: 10px 0 0 10px;
			background: #b9bace;
			font-size: 16px;
			color: #fff;
			outline: none;
			box-shadow: 0 2px 6px rgba(0,0,0,0.07);
		}
		.search-input {
			padding: 10px 16px;
			border: none;
			background: #ffffff;
			font-size: 16px;
			color: #495057;
			outline: none;
			width: 260px;
			box-shadow: 0 2px 6px rgba(0,0,0,0.07);
		}
		.search-btn {
			padding: 10px 28px;
			border: none;
			border-radius: 0 10px 10px 0;
			background: #b9bace;
			color: #fff;
			font-size: 16px;
			font-weight: 500;
			cursor: pointer;
			transition: background 0.2s, box-shadow 0.2s;
			box-shadow: 0 2px 6px rgba(25,118,210,0.12);
		}
		.search-btn:hover {
			background: #9b84c0b6;
		}

		.list_area {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
		}

		.list_area th {
			background-color: #f8f9fa;
			padding: 15px;
			font-weight: 500;
			color: #495057;
			border-bottom: 2px solid #e9ecef;
		}

		.list_area td {
			padding: 15px;
			border-bottom: 1px solid #e9ecef;
			color: #495057;
		}

		.list_area tr:hover {
			background-color: #f8f9fa;
			cursor: pointer;
			transition: background-color 0.2s ease;
		}

		.material-symbols-outlined {
			font-size: 16px;
			vertical-align: middle;
			color: #6c757d;
		}

		.paging-area {
			margin-top: 30px;
			text-align: center;
		}

		.pagination {
			display: inline-flex;
			list-style: none;
			gap: 5px;
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

		.list_area th.title-col, .list_area td.title-col {
			text-align: left !important;
			padding-left: 50px;
		}
	</style>

	<body>
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
		<jsp:include page="../common/menubar.jsp" />

		<br><br><br><br>

		<p id="top-title">.Notice / Event</p>

		<div class="list_wrap">
			<div class="list_form">
				<div class="filter-btn-group">
					<button class="filter-btn active">ALL</button>
					<button class="filter-btn">공지사항</button>
					<button class="filter-btn">이벤트</button>
				</div>
				<h2 align="center"></h2>
				<table class="list_area">
					<thead align="center">
						<tr>
							<th>번호</th>
							<th class="title-col">제목</th>
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
												<td class="title-col">${ i.noticeType } ${ i.noticeTitle }</td>
											</c:when>

											<c:otherwise>
												<td class="title-col">
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
			<div class="search-bar-area">
				<select class="search-select">
					<option>제목</option>
					<option>내용</option>
				</select>
				<input class="search-input" type="text" placeholder="검색어를 입력하세요" />
				<button class="search-btn">검색</button>
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