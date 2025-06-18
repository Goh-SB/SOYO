<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>소요 - 오시는 길</title>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --background-color: #f5f6fa;
            --card-background: #ffffff;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }

        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background-color: var(--background-color);
            min-height: 100vh;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        
        .location-card {
            background: var(--card-background);
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 8px 32px var(--shadow-color);
            animation: fadeIn 0.6s ease forwards;
        }
        
        .header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .header h1 {
            color: #5a5a5a;
            font-size: 2.5rem;
            position: relative;
            display: inline-block;
            font-family: 'GmarketSansMedium', sans-serif;
        }
        
        .header h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(to right, var(--dark-purple), var(--dark-mint));
            transform: scaleX(0);
            animation: underline 0.8s ease forwards 0.5s;
        }
        
        .info-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }
        
        .info-item {
            display: flex;
            align-items: flex-start;
            padding: 1rem;
            transition: transform 0.3s ease;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .info-item:hover {
            transform: translateY(-5px);
        }
        
        .info-item .material-icons {
            color: var(--dark-purple);
            font-size: 2rem;
            margin-right: 1rem;
            transition: transform 0.3s ease;
        }

        .info-item:hover .material-icons {
            transform: scale(1.1);
        }
        
        .info-content h3 {
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .info-content p {
            color: #666;
            line-height: 1.6;
        }
        
        .map-container {
            width: 100%;
            height: 400px;
            border-radius: 15px;
            overflow: hidden;
            margin-top: 2rem;
            position: relative;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            background: #f8f9fa;
        }

        .virtual-map {
            width: 100%;
            height: 100%;
            position: relative;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            overflow: hidden;
            cursor: grab;
        }

        .virtual-map::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                linear-gradient(90deg, #e0e0e0 1px, transparent 1px),
                linear-gradient(0deg, #e0e0e0 1px, transparent 1px);
            background-size: 50px 50px;
            opacity: 0.2;
            animation: gridMove 20s linear infinite;
        }

        /* 도로 스타일 */
        .road {
            position: absolute;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .road.horizontal {
            height: 30px;
            left: 0;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            background: linear-gradient(to bottom, 
                rgba(255,255,255,0) 0%,
                rgba(255,255,255,0.9) 20%,
                rgba(255,255,255,0.9) 80%,
                rgba(255,255,255,0) 100%
            );
            z-index: 1;
        }

        .road.vertical {
            width: 30px;
            top: 0;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(to right, 
                rgba(255,255,255,0) 0%,
                rgba(255,255,255,0.9) 20%,
                rgba(255,255,255,0.9) 80%,
                rgba(255,255,255,0) 100%
            );
            z-index: 1;
        }

        /* 건물 스타일 */
        .building {
            position: absolute;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transform-origin: center bottom;
            animation: buildingAppear 1s ease-out forwards;
        }

        .building.soyo {
            width: 60px;
            height: 80px;
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #B19CD9;
            z-index: 2;
        }

        .building.station {
            width: 100px;
            height: 50px;
            bottom: 15%;
            left: 50%;
            transform: translateX(-50%);
            background: #4a90e2;
            z-index: 1;
        }

        /* 주변 건물들 */
        .building.surrounding {
            background: #f0f0f0;
            z-index: 1;
        }

        /* 왼쪽 상단 구역 */
        .building.surrounding-1 {
            width: 45px;
            height: 65px;
            top: 15%;
            left: 15%;
            transform: rotate(-5deg);
        }

        .building.surrounding-2 {
            width: 35px;
            height: 50px;
            top: 25%;
            left: 30%;
            transform: rotate(3deg);
        }

        /* 오른쪽 상단 구역 */
        .building.surrounding-3 {
            width: 40px;
            height: 70px;
            top: 18%;
            right: 15%;
            transform: rotate(5deg);
        }

        .building.surrounding-4 {
            width: 50px;
            height: 60px;
            top: 22%;
            right: 30%;
            transform: rotate(-3deg);
        }

        /* 왼쪽 하단 구역 */
        .building.surrounding-5 {
            width: 42px;
            height: 55px;
            bottom: 25%;
            left: 18%;
            transform: rotate(2deg);
        }

        .building.surrounding-6 {
            width: 38px;
            height: 45px;
            bottom: 30%;
            left: 32%;
            transform: rotate(-4deg);
        }

        /* 오른쪽 하단 구역 */
        .building.surrounding-7 {
            width: 44px;
            height: 58px;
            bottom: 28%;
            right: 24%;
            transform: rotate(3deg);
        }

        .building.surrounding-8 {
            width: 36px;
            height: 52px;
            bottom: 32%;
            right: 33%;
            transform: rotate(-2deg);
        }

        .building-label {
            position: absolute;
            white-space: nowrap;
            padding: 4px 8px;
            border-radius: 4px;
            background: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            font-size: 0.8rem;
            z-index: 3;
        }

        .building-label.soyo {
            top: 35%;
            left: 52%;
            color: var(--dark-purple);
            font-weight: bold;
        }

        .building-label.station {
            bottom: 12%;
            left: 50%;
            transform: translateX(-50%);
            color: #4a90e2;
            font-weight: bold;
        }

        /* 마커 스타일 */
        .location-marker {
            position: absolute;
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 30px;
            height: 30px;
            animation: bounce 1.5s ease-in-out infinite;
            z-index: 4;
        }

        .location-marker::before {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            background: #FF6B6B;
            border-radius: 50%;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .location-marker::after {
            content: '';
            position: absolute;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-top: 15px solid #FF6B6B;  /* 마커 색상 변경 */
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            filter: drop-shadow(0 2px 2px rgba(0,0,0,0.2));
        }

        .map-info {
            position: absolute;
            bottom: 20px;
            left: 20px;
            background: white;
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            max-width: 300px;
            transform: translateY(0);
            transition: transform 0.3s ease;
            z-index: 5;
        }

        .map-info:hover {
            transform: translateY(-5px);
        }

        .map-info h4 {
            color: var(--dark-purple);
            margin-bottom: 5px;
            font-size: 1.1rem;
        }

        .map-info p {
            color: #666;
            font-size: 0.9rem;
            line-height: 1.4;
        }

        .map-controls {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .map-control-button {
            width: 40px;
            height: 40px;
            border: none;
            border-radius: 8px;
            background: white;
            color: var(--dark-purple);
            font-size: 20px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .map-control-button:hover {
            background: var(--dark-purple);
            color: white;
            transform: scale(1.1);
        }

        .transportation {
            margin-top: 2rem;
            padding: 1.5rem;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        
        .transportation h3 {
            color: var(--dark-purple);
            margin-bottom: 1rem;
            font-size: 1.3rem;
        }
        
        .transportation ul {
            list-style: none;
        }
        
        .transportation li {
            margin-bottom: 1rem;
            padding-left: 1.8rem;
            position: relative;
            font-size: 1.1rem;
            line-height: 1.6;
        }
        
        .transportation li::before {
            content: '•';
            color: var(--dark-mint);
            position: absolute;
            left: 0.5rem;
            font-size: 1.2rem;
        }

        @keyframes gridMove {
            0% {
                transform: translate(0, 0);
            }
            100% {
                transform: translate(-50px, -50px);
            }
        }
        
        @keyframes bounce {
            0%, 100% {
                transform: translate(-50%, -50%);
            }
            50% {
                transform: translate(-50%, -60%);
            }
        }
        
        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        @keyframes underline {
            to {
                transform: scaleX(1);
            }
        }

        @keyframes buildingAppear {
            from {
                transform: scaleY(0);
                opacity: 0;
            }
            to {
                transform: scaleY(1);
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .info-section {
                grid-template-columns: 1fr;
            }
            
            .map-container {
                height: 300px;
            }
            
            .header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

    <br><br><br>

    <jsp:include page="../common/menubar.jsp" />

    <div class="container">
        <div class="header">
            <h1>오시는 길</h1>
        </div>

        <div class="location-card">
            <div class="info-section">
                <div class="info-item">
                    <i class="fas fa-map-marker-alt icon"></i>
                    <div class="info-content">
                        <h3>&nbsp;주소</h3>
                        <p>서울특별시 강남구 테헤란로 123 소요빌딩</p>
                        <p>(우) 06123</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-phone icon"></i>
                    <div class="info-content">
                        <h3>&nbsp;문의처</h3>
                        <p>총무팀: 02-123-4567</p>
                        <p>예약팀: 02-123-4568</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-clock icon"></i>
                    <div class="info-content">
                        <h3>&nbsp;운영시간</h3>
                        <p>평일: 09:00 - 18:00</p>
                        <p>주말 및 공휴일: 휴무</p>
                    </div>
                </div>
            </div>

            <div class="map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.354287357832!2d127.02426521532505!3d37.51030417976912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca438b2086409%3A0x7f432f3f9f2f3f2f!2z7ISc7Jq47Yq56rWt7J20!5e0!3m2!1sko!2skr!4v1687087384297!5m2!1sko!2skr" 
                        width="1072" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    <div class="building-label soyo">소요빌딩</div>
                    <div class="location-marker"></div>
                </div>
            </div>
            
            <div class="transportation">
                <h3>교통편</h3>
                <ul>
                    <li><strong>지하철</strong>: 2호선, 9호선 강남역 11번 출구에서 도보 5분</li>
                    <li><strong>버스</strong>: 
                        <br>- 간선버스: 440, 441, 442, 443, 444, 445, 446, 447, 448, 449
                        <br>- 지선버스: 107, 108, 109, 110, 111, 112, 113, 114, 115, 116
                        <br>- 광역버스: 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009
                    </li>
                    <li><strong>주차</strong>: 건물 내 지하주차장 이용 가능</li>
                </ul>
            </div>

            <br>

        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

    <script>
        const virtualMap = document.querySelector('.virtual-map');
        let isDragging = false;
        let startX, startY, scrollLeft, scrollTop;

        virtualMap.addEventListener('mousedown', (e) => {
            isDragging = true;
            virtualMap.style.cursor = 'grabbing';
            startX = e.pageX - virtualMap.offsetLeft;
            startY = e.pageY - virtualMap.offsetTop;
            scrollLeft = virtualMap.scrollLeft;
            scrollTop = virtualMap.scrollTop;
        });

        virtualMap.addEventListener('mouseleave', () => {
            isDragging = false;
            virtualMap.style.cursor = 'grab';
        });

        virtualMap.addEventListener('mouseup', () => {
            isDragging = false;
            virtualMap.style.cursor = 'grab';
        });

        virtualMap.addEventListener('mousemove', (e) => {
            if (!isDragging) return;
            e.preventDefault();
            const x = e.pageX - virtualMap.offsetLeft;
            const y = e.pageY - virtualMap.offsetTop;
            const walkX = (x - startX) * 2;
            const walkY = (y - startY) * 2;
            virtualMap.scrollLeft = scrollLeft - walkX;
            virtualMap.scrollTop = scrollTop - walkY;
        });

    </script>
</body>
</html>