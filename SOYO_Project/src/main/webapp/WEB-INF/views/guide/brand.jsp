<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소요 | 현대적 감각의 개량한복</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2C3E50;
            --secondary-color: #E8E8E8;
            --accent-color: #B8860B;
            --text-color: #333333;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: #fff;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .hero {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url('${pageContext.request.contextPath}/resources/images/brand-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            overflow-x: hidden;
        }

        .hero-content {
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 1s ease forwards;
            text-align: left;
            position: relative;
            left: 46%;
            top: 150px;
            transform: translateX(-50%);
            width: 50%;
            max-width: 600px;
        }

        .hero h1 {
            font-family: 'Noto Serif KR', serif;
            font-size: 3rem;
            margin-bottom: 1rem;
            font-weight: 300;
            margin-right: 5rem;
        }

        .hero p {
            font-size: 1.6rem;
            margin-bottom: 25rem;
            margin-right: 5rem;
        }

        .section {
            padding: 100px 0;
            opacity: 0;
            transform: translateY(20px);
        }

        .section.visible {
            animation: fadeInUp 1s ease forwards;
        }

        .section-title {
            font-family: 'Noto Serif KR', serif;
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            color: var(--primary-color);
        }

        .section-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            margin-top: 50px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card h3 {
            font-family: 'Noto Serif KR', serif;
            color: var(--accent-color);
            margin-bottom: 1rem;
            font-size: 1.7rem;
        }

        .card p {
            font-size: 1.1rem;
            line-height: 1.8;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .cta-button {
            display: inline-block;
            padding: 15px 40px;
            background-color: var(--accent-color);
            color: white;
            text-decoration: none;
            border-radius: 30px;
            transition: background-color 0.3s ease;
        }

        .cta-button:hover {
            background-color: #9B6B0B;
        }

        .back-button {
            position: fixed;
            top: 30px;
            left: 30px;
            z-index: 1000;
            background-color: rgba(39, 39, 39, 0.664);
            border: 2px solid rgba(255, 255, 255, 0.4);
            color: white;
            padding: 10px 20px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 1rem;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            opacity: 1;
            visibility: visible;
        }

        .back-button.hidden {
            opacity: 0;
            visibility: hidden;
        }

        .back-button:hover {
            background-color: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

    <a href="javascript:history.back()" class="back-button">← 뒤로가기</a>

    <section class="hero">
        <div class="hero-content">
            <h1>소요 SOYO</h1>
            <p>고요한 아름다움.<br>일상 속 전통의 여백<br>전통의 결, 현대의 숨
            
        </div>
    </section>

    <section class="section" id="philosophy">
        <div class="container">
            <h2 class="section-title">브랜드 철학</h2>
            <div class="section-content">
                <div class="card">
                    <h3>전통과 현대의 공존</h3>
                    <p>소요는 전통 한복의 우아함을 현대적인 실루엣으로 재해석합니다.<br>
                    과거와 현재를 잇는 다리 역할을 하며, 일상 속에서도 자연스럽게<br>
                    전통의 아름다움을 경험할 수 있도록 합니다.</p>
                </div>
                <div class="card">
                    <h3>일상 속 아름다움</h3>
                    <p>특별한 날이 아닌, 일상 속에서도 한복의 아름다움을 
                    느낄 수 있도록<br>현대인의 라이프스타일에 맞춘 
                    실용적이면서도<br>아름답고 세련된 디자인을 추구합니다.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="section" id="sensibility">
        <div class="container">
            <h2 class="section-title">소요만의 감성</h2>
            <div class="section-content">
                <div class="card">
                    <h3>차분한 미니멀리즘</h3>
                    <p>불필요한 장식을 제거하고 본질적인 아름다움에 집중합니다.<br>
                    절제된 디자인으로 더욱 깊이 있는 미감을 전달합니다.</p>
                </div>
                <div class="card">
                    <h3>고급스러운 색감</h3>
                    <p>전통적인 색채를 현대적으로 재해석하여<br>차분하면서도 
                    고급스럽고, 미려한 컬러 팔레트를 구사합니다.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="section" id="message">
        <div class="container">
            <h2 class="section-title">우리의 메시지</h2>
            <div class="section-content">
                <div class="card">
                    <h3>자유로운 표현</h3>
                    <p><b>소요(逍遙)</b>라는 이름처럼, 전통의 틀에 구애받지 않고<br>
                    자유로운 형식으로 디자인 철학을 표현하고자 합니다.<br>현대적 감각으로 재해석된 
                    한복을 통해 새로운 문화를 만들어갑니다.</p>
                </div>
                <div class="card">
                    <h3>지속가능한 가치</h3>
                    <p>단순한 트렌드가 아닌, 지속가능한 가치를 추구합니다.<br>
                    전통의 가치를 지키면서도 현대적 감각을 더해서<br> 
                    가치있는 우리만의 새로운 문화유산을 만들어갑니다.</p>
                </div>
            </div>
        </div>
        
        <br><br><br>
        
    </section>

    <script>
        // 스크롤 애니메이션
        const sections = document.querySelectorAll('.section');
        const backButton = document.querySelector('.back-button');
        let lastScrollTop = 0;
        
        const observerOptions = {
            threshold: 0.1
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, observerOptions);

        sections.forEach(section => {
            observer.observe(section);
        });

        // 스크롤 이벤트 처리
        window.addEventListener('scroll', () => {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            // 스크롤이 100px 이상 내려갔을 때 버튼 숨기기
            if (scrollTop > 100) {
                backButton.classList.add('hidden');
            } else {
                backButton.classList.remove('hidden');
            }
            
            // 스크롤 방향에 따른 처리
            if (scrollTop < lastScrollTop) {
                // 위로 스크롤할 때
                backButton.classList.remove('hidden');
            }
            
            lastScrollTop = scrollTop;
        });
    </script>
</body>
</html>