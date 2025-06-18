<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지 상세보기</title>
	</head>

	<style>
		body {
			width: 1920px;
			min-height: 100vh;			/* 최소 세로 크기 : 100% */
		}

		div {
			box-sizing: border-box;		/* 테두리와 안쪽 여백의 크기도 요소의 크기로 고려 */
		}

		#notice-Detail-Table {
			width : 80%;
			margin : auto;
			margin-top : 80px;
		}
	</style>

	<!-- Bootstrap 연동 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

	<body>
		<jsp:include page="../common/menubar.jsp" />
		<div class="list_view">
			<br>
			<h2>공지사항 상세보기</h2>
        	<br>

			<button type="button" class="btn btn-secondary" onclick="list();" style="margin-left : 1600px;">목록가기</button>
  
            <table id="notice-Detail-Table">
                <thead>
                    <tr>
                        <td>
                            <div>
                                <span id="noticeTitle" style="font-size : 26px;">
									&#91;${ requestScope.n.noticeType }&#93;&nbsp;${requestScope.n.noticeTitle}
								</span>
                                <br>
                                <span id="noticeDate" style="color : grey;">
									${requestScope.n.noticeDate}
								</span>
                                <hr/>
                            </div>
                        </td>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>
                            <img id="fileImg" src="http://localhost:8100/soyo/resources/notice_upfile/${requestScope.n.noticeImage}"/>
                            <br><br>
                            <p id="noticeContent" style="font-size : 20px;">${requestScope.n.noticeContent}</p>
                        </td>
                    </tr>
                </tbody>
            </table>
           	<br>
        </div>

		<script>
			function list() {
				location.href="/soyo/notice/noticeList"
			}
		</script>
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>