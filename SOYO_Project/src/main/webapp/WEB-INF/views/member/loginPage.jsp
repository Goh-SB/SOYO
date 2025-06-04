<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            background-color: #E3E4FA;
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
		
        .login-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: white;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 480px;
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
            font-size: 1rem;
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
            color: #E3E4FA;
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
            font-size: 1rem;
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
            font-size: 0.9rem;
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

    <div class="login-section">
        <div class="login-container">
            <h1 class="login-title">환영합니다</h1>
            <p id="login-title-p">소요 계정에 로그인하세요</p>
            
            <!-- 로그인 전에 보여지는 로그인 폼 -->
            <form action="${pageContext.request.contextPath}/member/login" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" id="memberId" name="memberId" placeholder=" ">
                    <label class="form-label" for="memberId">아이디</label>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder=" ">
                    <label class="form-label" for="memberPwd">비밀번호</label>
                </div>
                <div class="remember-me">
                    <input type="checkbox" id="remember">
                    <label for="remember">아이디 저장</label>
                </div>
                <button type="submit" class="login-button">로그인</button>
                <div class="additional-links">
                    <a href="#">회원가입</a>
                    <a href="#">아이디/비밀번호 찾기</a>
                </div>
            </form>
        </div>
    </div>

    <!-- 항상 모든 페이지 하단에는 푸터가 보여지게끔 include -->
    <jsp:include page="../common/footer.jsp" />

</div>
</body>
</html>