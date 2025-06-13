<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지 상세보기</title>
	</head>

	<body>
		<jsp:include page="../common/menubar.jsp" />
		<div class="list_view">
			<table class="table" align="center">
				<tr>
					<th width="70">제목</th>
					<td>${requestScope.n.noticeTitle}</td>

					<th width="80">작성일</th>
					<td width="140">${requestScope.n.noticeDate}</td>
				</tr>
				<tr>
					<th width="70">내용</th>
					<td height="500" colspan="7">${requestScope.n.noticeContent}</td>
				</tr>
				<tr>
					<td colspan="8" align="center">
						<button type="button" class="btn btn-secondary" onclick="list();">목록가기</button>
					</td>
				</tr>
			</table>
		</div>
		<script>
			function list() {
				location.href="/soyo/notice/noticeList"
			}
		</script>
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>