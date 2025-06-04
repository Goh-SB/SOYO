<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="menubar.jsp" />
	
	<br><br><br><br>
	<br><br><br><br>
	
	<h1 align="center" style="color : red;">
		${ requestScope.errorMsg }
	</h1>
	
	<br><br><br><br>
	
	<jsp:include page="footer.jsp" />

</body>
</html>