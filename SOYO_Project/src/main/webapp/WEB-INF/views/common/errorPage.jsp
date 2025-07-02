<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	@font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<body>

	<jsp:include page="menubar.jsp" />
	<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 60vh;">
		<br><br><br><br><br>
		<img src="${pageContext.request.contextPath}/resources/images/error.jpg" alt="에러 이미지" style="max-width: 850px; width: 100%; height: auto; display: block; margin: 0 auto 30px auto; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.3);">
		<h1 style="color: #e57373; text-align: center; margin-top: 10px; margin-bottom: 30px; font-weight: 600; font-size: 1.7rem; font-family: 'InfinitySans-RegularA1';">
			${ requestScope.errorMsg }
		</h1>
	</div>
	<br>
	<jsp:include page="footer.jsp" />

</body>
</html>