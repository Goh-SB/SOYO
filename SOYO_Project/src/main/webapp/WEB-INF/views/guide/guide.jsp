<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소요 - 쇼핑 가이드</title>
</head>

<style>
	@font-face {
		font-family: 'YUniverse-B';
		src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_yuniverse@1.0/YUniverse-B.woff2') format('woff2');
		font-weight: normal;
		font-style: normal;
	}

	#title {
		text-align: center;
		color: gray;
		font-family: 'YUniverse-B';
		font-size: 35px;
	}
	
	#image {
		text-align: center;
	}
	
</style>

<body>

	<jsp:include page="../common/menubar.jsp" />

	<br><br><br><br>
	
	<h1 id="title">SHOPPING GUIDE</h1>
	
	<br>
	
	<div id="image">
		<img src="${pageContext.request.contextPath}/resources/images/size_guide.jpg" alt="셀러브리티 이미지" class="celeb-image">
	</div>
	
	<br><br><br>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>