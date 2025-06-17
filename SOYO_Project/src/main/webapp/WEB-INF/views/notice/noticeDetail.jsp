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

		#notice-table{
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

            <button>
                목록가기
            </button>
  
            <table id="notice-Detail-Table">
                <thead>
                    <tr>
                        <td>
                            <div>
                                <span id="noticeTitle">&#91;${ requestScope.n.noticeType }&#93;&nbsp;${requestScope.n.noticeTitle}</span>
                                <br>
                                <span id="noticeDate">${requestScope.n.noticeDate}</span>
                                <hr/>
                            </div>
                        </td>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>
                            <img id="fileImg"/>
                            <br>
                            <p id="noticeContent">${requestScope.n.noticeContent}</p>
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