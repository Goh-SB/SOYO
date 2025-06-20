<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제정보</title>
</head>
<body>
	 <jsp:include page="../common/menubar.jsp" />
	 	<br><br><br>
		<h2>결제 정보</h2>
		<p>총 결제 금액: <strong>${totalPrice}</strong>원</p>
		 <br><br><br>
	  <jsp:include page="../common/footer.jsp" />
</body>
</html>