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
            --pastel-purple: #F8F2FF;
            --pastel-mint: #F2F8FF;
            --dark-purple: #9370DB;
            --dark-mint: #3EB489;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, var(--pastel-purple) 0%, var(--pastel-mint) 100%);
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .location-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            margin: 2rem 0;
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.6s ease forwards;
        }
        
        .header {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .header h1 {
            color: #333;
            font-size: 2.5rem;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
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
            right: 17%;
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
            right: 20px;
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
                    <span class="material-icons">location_on</span>
                    <div class="info-content">
                        <h3>주소</h3>
                        <p>서울특별시 영등포구 당산동<br>소요빌딩</p>
                    </div>
                </div>
                
                <div class="info-item">
                    <span class="material-icons">phone</span>
                    <div class="info-content">
                        <h3>연락처</h3>
                        <p>02-1234-5678</p>
                    </div>
                </div>
                
                <div class="info-item">
                    <span class="material-icons">access_time</span>
                    <div class="info-content">
                        <h3>영업시간</h3>
                        <p>평일 09:00 - 18:00<br>주말 및 공휴일 휴무</p>
                    </div>
                </div>
            </div>
            
            <div class="map-container">
                <div class="virtual-map">
                    <div class="road horizontal"></div>
                    <div class="road vertical"></div>
                    <div class="road diagonal-1"></div>
                    <div class="road diagonal-2"></div>
                    <div class="building surrounding surrounding-1"></div>
                    <div class="building surrounding surrounding-2"></div>
                    <div class="building surrounding surrounding-3"></div>
                    <div class="building surrounding surrounding-4"></div>
                    <div class="building surrounding surrounding-5"></div>
                    <div class="building surrounding surrounding-6"></div>
                    <div class="building surrounding surrounding-7"></div>
                    <div class="building surrounding surrounding-8"></div>
                    <div class="building soyo"></div>
                    <div class="building station"></div>
                    <div class="building-label soyo">소요빌딩</div>
                    <div class="building-label station">당산역</div>
                    <div class="location-marker"></div>
                    <div class="map-info">
                        <h4>소요</h4>
                        <p>서울특별시 영등포구 당산동<br>소요빌딩</p>
                    </div>
                </div>
            </div>
            
            <div class="transportation">
                <h3>교통편</h3>
                <ul>
                    <li><strong>지하철</strong>: 2호선, 9호선 당산역 13번 출구에서 도보 5분</li>
                    <li><strong>버스</strong>: 
                        <br>- 간선버스: 602, 760, N62
                        <br>- 지선버스: 5620, 5714, 6514, 6623, 6631
                        <br>- 광역버스: 108
                    </li>
                    <li><strong>주차</strong>: 건물 내 지하주차장 이용 가능</li>
                </ul>
            </div>
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