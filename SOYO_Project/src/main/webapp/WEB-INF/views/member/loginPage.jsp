<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background-image: url('<c:url value="/resources/images/login-bg.jpg" />');
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            background-size: cover;

        }

        
        @font-face {
            font-family: 'ONE-Mobile-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-Regular.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
		
        .login-section {
            flex: 1;
            display: flex;
            min-height: 675px;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(3px);
            padding: 2.5rem;
            border-radius: 12px;    
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
            font-family: 'ONE-Mobile-Regular';
            width: 100%;
            max-width: 450px;
            margin-top: 60px;
            margin-bottom: 60px;
        }

        .login-title {
            text-align: center;
            color: #333;
            margin-bottom: 1rem;
            font-size: 1.8rem;
            font-weight: 500;
        }

        #login-title-p {
            font-size: 1.2rem;
            color: #666;
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #E3E4FA;
            outline: none;
            box-shadow: 0 0 0 2px rgba(227, 228, 250, 0.3);
        }

        .form-label {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: white;
            padding: 0 4px;
            color: #666;
            transition: all 0.3s ease;
            pointer-events: none;
        }

        .form-control:focus + .form-label,
        .form-control:not(:placeholder-shown) + .form-label {
            top: 0;
            font-size: 0.8rem;
            color: #9798a8;
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .remember-me input[type="checkbox"] {
            margin-right: 8px;
            accent-color: #E3E4FA;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #E3E4FA;
            border: none;
            border-radius: 6px;
            color: #333;
            font-size: 1.1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: #d1d2f9;
        }

        .additional-links {
            display: flex;
            justify-content: space-between;
            margin-top: 1.5rem;
        }

        .additional-links a {
            color: #666;
            text-decoration: none;
            font-size: 1.05rem;
            transition: color 0.3s ease;
        }

        .additional-links a:hover {
            color: #E3E4FA;
        }

    </style>
</head>
<body>
<div class="wrapper">

    <!-- 항상 모든 페이지 상단에는 메뉴바가 보여지게끔 include -->
    <jsp:include page="../common/menubar.jsp" />
    
    <br><br><br>

    <div class="login-section">
        <div class="login-container">
        
            <h1 class="login-title">환영합니다</h1>
            <p id="login-title-p">소요 계정에 로그인하세요</p>
            
            <!-- 로그인 전에 보여지는 로그인 폼 -->
            <form action="${pageContext.request.contextPath}/member/login" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" id="memberId" name="memberId" placeholder=" " required
                    value="${ cookie.saveId.value }">
                    <label class="form-label" for="memberId">아이디</label>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder=" " required>
                    <label class="form-label" for="memberPwd">비밀번호</label>
                </div>
                
                <!-- 아이디 저장 체크박스 구성 -->
                <div class="remember-me">
                    <input type="checkbox" id="saveId"
                    	   name="saveId" value="y"
                    	   <c:if test="${not empty cookie.saveId.value}">checked</c:if>>
                    <label for="saveId">아이디 저장</label>
                </div>
                
                <button type="submit" class="login-button">로그인</button>
                <div class="additional-links">
                    <a href="<c:url value='/member/memberEnrollForm' />">회원가입</a>
                    <a href="<c:url value='/member/findMemberId' />">아이디/비밀번호 찾기</a>
                </div>
            </form>
        </div>
    </div>
    
    <br>

    <!-- 항상 모든 페이지 하단에는 푸터가 보여지게끔 include -->
    <jsp:include page="../common/footer.jsp" />

</div>

</body>
</html>