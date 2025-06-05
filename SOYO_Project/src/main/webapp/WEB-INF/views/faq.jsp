<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ - 자주 묻는 질문</title>
    <!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(135deg, #f5f6fd 0%, #f8f9ff 100%);
            color: #333;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        @font-face {
            font-family: 'NanumSquareRound';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        .faq-container {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(120, 130, 180, 0.18), 0 2px 8px 0 rgba(180, 180, 220, 0.10), 0 1.5px 8px 0 rgba(220, 210, 250, 0.10);
            max-width: 700px;
            margin: 4rem auto 2rem auto;
            padding: 2.8rem 2.5rem 2.2rem 2.5rem;
            position: relative;
            font-family: 'NanumSquareRound';
        }

        .faq-title {
            font-size: 2.3rem;
            font-weight: 700;
            color: #6d6f8c;
            margin-bottom: 0.8rem;
            text-align: center;
            letter-spacing: -1px;
        }

        .faq-desc {
            text-align: center;
            color: #9ca0c6;
            margin-bottom: 2.7rem;
            font-size: 1.2rem;
        }

        .collapsible {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .collapsible li {
            margin-bottom: 22px;
        }

        .collapsible-header {
            background: linear-gradient(90deg, #f5f6fd 60%, #f8f9ff 100%);
            color: #6d6f8c;
            font-weight: 500;
            font-size: 1.13rem;
            border-bottom: 1px solid #ececec;
            padding: 1.2rem 1.8rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            border-left: 4px solid #e0e2fa;
            border-radius: 16px 16px 0 0;
            position: relative;
        }

        .collapsible-header::after {
            content: "help_outline";
            font-family: "Material Icons";
            position: absolute;
            right: 1.8rem;
            font-size: 1.5rem;
            color: #a2a5c0;
            transition: transform 0.3s ease, content 0.3s;
        }

        .collapsible-header.active::after {
            content: "arrow_downward";
            font-family: "Material Icons";
            color: #8d90ae;
        }

        .collapsible-header:hover, .collapsible-header.active {
            background: #f0f1fc;
            color: #8d90ae;
            box-shadow: 0 2px 8px 0 rgba(191, 194, 230, 0.10);
        }

        .collapsible-body {
            background: #fff;
            color: #6d6f8c;
            font-size: 1.06rem;
            padding: 0;
            line-height: 1.85;
            border-left: 4px solid #e0e2fa;
            border-radius: 0 0 16px 16px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out, padding 0.3s ease;
        }

        .collapsible-body.active {
            padding: 1.4rem 2.2rem 1.4rem 2.9rem;
            max-height: 500px;
        }
    </style>
</head>
	
<body>

	<jsp:include page="common/menubar.jsp" />

	<br><br>

    <div class="faq-container">
        <div class="faq-title">자주 묻는 질문</div>
        <div class="faq-desc">소요 쇼핑몰을 이용하시면서 자주 궁금해하시는 내용을 모았습니다.</div>
        <ul class="collapsible popout">
            <li>
                <div class="collapsible-header">Q. 배송은 얼마나 걸리나요?</div>
                <div class="collapsible-body">A. 결제 완료 후 평균 2~3일 이내에 발송되며,<br>지역에 따라 1~2일 추가 소요될 수 있습니다. (주말/공휴일 제외)</div>
            </li>
            <li>
                <div class="collapsible-header">Q. 배송지 정보를 변경하고 싶어요.</div>
                <div class="collapsible-body">A. 발송 전이라면 마이페이지 또는 문의를 통해 배송지 변경이 가능합니다.<br>이미 발송된 경우에는 변경이 어려울 수 있습니다.</div>
            </li>
            <li>
                <div class="collapsible-header">Q. 교환/반품은 어떻게 하나요?</div>
                <div class="collapsible-body">A. 상품 수령 후 7일 이내에 고객센터 또는 1:1 문의를 통해 신청해주시면<br>안내해드립니다. 단, 착용 흔적이 있거나 택 제거 시 교환/반품이 불가합니다.</div>
            </li>
            <li>
                <div class="collapsible-header">Q. 세탁은 어떻게 해야 하나요?</div>
                <div class="collapsible-body">A. 한복 재질 특성상 드라이클리닝을 권장합니다.<br>가정에서 세탁 시 찬물에 중성세제로 단독 손세탁해 주세요.</div>
            </li>
            <li>
                <div class="collapsible-header">Q. 품절 상품은 재입고 되나요?</div>
                <div class="collapsible-body">A. 품절된 상품은 재입고 알림 신청이 가능합니다.<br>상품 상세 페이지에서 <b>'재입고 알림'</b> 버튼을 이용해 주세요.</div>
            </li>
            <li>
                <div class="collapsible-header">Q. 결제 수단에는 어떤 것이 있나요?</div>
                <div class="collapsible-body">A. 신용카드, 체크카드, 실시간 계좌이체, 무통장입금,<br>간편결제(카카오페이, 네이버페이 등) 등 다양한 결제 수단을 지원합니다.</div>
            </li>
            <li>
                <div class="collapsible-header">Q. 사이즈가 맞지 않으면 어떻게 하나요?</div>
                <div class="collapsible-body">A. 사이즈가 맞지 않을 경우, 동일 상품 내에서 1회 무료 교환이 가능합니다.<br>교환 신청은 상품 수령 후 7일 이내에 해주세요.</div>
            </li>
            <li>
                <div class="collapsible-header">Q. 주문 내역은 어디서 확인할 수 있나요?</div>
                <div class="collapsible-body">A. 마이페이지의 <b>'주문내역'</b> 메뉴에서 모든 주문 내역을 확인하실 수 있습니다.</div>
            </li>
        </ul>
    </div>
    
    <jsp:include page="common/footer.jsp" />
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const headers = document.querySelectorAll('.collapsible-header');
            
            headers.forEach(header => {
                header.addEventListener('click', function() {
                    const body = this.nextElementSibling;
                    const isActive = this.classList.contains('active');
                    
                    headers.forEach(h => h.classList.remove('active'));
                    document.querySelectorAll('.collapsible-body').forEach(b => {
                        b.classList.remove('active');
                        b.style.maxHeight = null;
                    });
                    
                    if (!isActive) {
                        this.classList.add('active');
                        body.classList.add('active');
                    }
                });
            });
        });
    </script>
</body>
</html> 