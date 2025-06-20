<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소요 - 공지사항 상세</title>
		<style>
			body {
				width: 100%;
				min-height: 100vh;
				margin: 0;
				padding: 0;
				font-family: 'Noto Sans KR', sans-serif;
				background-color: #f8f9fa;
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

			.notice-container {
				max-width: 1540px;
				margin: 0 auto;
				padding: 20px;
			}

			.notice-header {
				text-align: center;
				margin-bottom: 40px;
			}

			.notice-header h2 {
				color: #333;
				font-size: 32px;
				margin-bottom: 20px;
			}

			.notice-content {
				background: white;
				border-radius: 12px;
				box-shadow: 0 2px 10px rgba(0,0,0,0.1);
				padding: 30px;
				margin-bottom: 30px;
			}

			.notice-title {
				border-bottom: 2px solid #eee;
				padding-bottom: 20px;
				margin-bottom: 30px;

			}

			.notice-title h3 {
				font-size: 24px;
				color: #333;
				margin: 0 0 10px 0;
			}

			.notice-date {
				color: #666;
				font-size: 15px;
			}

			.notice-body {
				line-height: 1.8;
				color: #444;
				text-align: center;
				display: flex;
				flex-direction: column;
				align-items: center;
			}

			.notice-body img {
				max-width: 100%;
				height: auto;
				margin: 20px 0;
				border-radius: 8px;
			}

			.notice-body p {
				width: 100%;
				max-width: 1000px;
				margin: 0 auto;
				text-align: center;
			}

			.notice-footer {
				text-align: center;
				margin-top: 40px;
			}

			.back-button {
				background-color: #a4c0d4;
				color: white;
				border: none;
				padding: 12px 30px;
				border-radius: 6px;
				font-size: 18px;
				cursor: pointer;
				transition: background-color 0.3s;
			}

			.back-button:hover {
				background-color: #3579bd9f;
			}
		</style>
	</head>

	<body>
		<jsp:include page="../common/menubar.jsp" />
		
		<br><br><br><br>

		<p id="top-title">.Notice / Event</p>

		<div class="notice-container">

			<div class="notice-content">
				<div class="notice-title">
					<h3>[${requestScope.n.noticeType}] ${requestScope.n.noticeTitle}</h3>
					<div class="notice-date">${requestScope.n.noticeDate}</div>
					<br>
				</div>

				<div class="notice-body">
					<img id="fileImg" src="http://192.168.40.17:8100/soyo/resources/notice_upfile/${requestScope.n.noticeImage}"/>
					<p>${requestScope.n.noticeContent}</p>
				</div>
			</div>

			<div class="notice-footer">
				<button type="button" class="back-button" onclick="list();">목록으로 돌아가기</button>
			</div>
		</div>

		<script>
			function list() {
				location.href="/soyo/notice/noticeList"
			}
		</script>
		
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>