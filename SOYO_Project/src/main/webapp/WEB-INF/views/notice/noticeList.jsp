<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
	</head>

	<body>
		<jsp:include page="../common/header.jsp" />
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
								<c:forEach var="i" items="${list}">
									<tr>
										<td>${i.noticeNo}</td>
										<td>${i.noticeTitle}</td>
										<td>${i.noticeDate}</td>
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
				$(".list_area>tbody>tr").click(function() {
					let nno = $(this).children().eq(0).text();
					
					location.href="/soyo/notice/noticeDetail/"+nno;
				});
			});
		</script>
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>