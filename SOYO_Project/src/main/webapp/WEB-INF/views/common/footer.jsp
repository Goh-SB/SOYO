<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #F9F3FF;
            --color1: #BFD7E4;
            --color2: #F4A6A6;
            --color3: #F6E5AC;
            --color4: #F8F8F8;
            --color5: #A8A8A8;
        }

        @font-face {
            font-family: 'SUITE-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        footer {
            background-color: var(--color4);
            padding: 4rem 10% 2rem;
            color: var(--color5);
            font-family: 'SUITE-Regular', sans-serif;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
            font-size: 1.2rem;
        }

        .footer-section h3 {
            color: darkcyan;
            margin-bottom: 1rem;
            font-size: 1.4rem;
        }

        .social-links {
            display: flex;
            gap: 1rem;
        }

        .social-links a {
            color: var(--color5);
            font-size: 2.5rem;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: var(--color1);
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid var(--color5);
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <footer>
    <div class="footer-content">
        <div class="footer-section">
            <h3>소요</h3>
            <p>한복의 새로운 스타일을 제안하는 브랜드</p>
        </div>
        <div class="footer-section">
            <h3>고객센터</h3>
            <p><b>1544-9970</b></p>
            <p>평일 10:00 - 18:00</p>
        </div>
        <div class="footer-section">
            <h3>SNS</h3>
            <div class="social-links">
                <a href="https://www.instagram.com/happly_hanbokbeagle/" target="blank"><i class="fab fa-instagram"></i></a>
                <a href="https://www.facebook.com/leeslecom/?locale=ko_KR" target="blank"><i class="fab fa-facebook"></i></a>
                <a href="https://kh-academy.co.kr/upload/teacher/ghkim1121_teacher_photo.png" target="blank"><i class="fab fa-twitter"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 소요. All rights reserved.</p>
    </div>
</footer>
