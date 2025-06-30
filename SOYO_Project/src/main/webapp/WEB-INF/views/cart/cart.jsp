<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>소요 - 장바구니</title>

        <!-- 온라인 방식으로 jQuery 연동 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
        
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: linear-gradient(135deg, #f7f8fa 0%, #e9eaf3 100%);
            min-height: 100vh;
            color: #444;
        }

        @font-face {
            font-family: 'NanumSquareRound';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        /* 컨테이너 스타일 */
        #container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 32px 18px 32px 18px;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 4px 24px rgba(180,180,200,0.08);
            margin-top: 28px;
            margin-bottom: 28px;
        }

        /* 페이지 제목 */
        #default_title {
            text-align: center;
            margin-bottom: 36px;
            position: relative;
        }

        #default_title strong {
            font-size: 2.2rem;
            font-weight: 700;
            background: linear-gradient(90deg, #9e9edc 0%, #f4a9d7 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        #default_title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 48px;
            height: 2.5px;
            background: linear-gradient(90deg, #e3e3f7 0%, #f7c6e6 100%);
            border-radius: 2px;
        }

        /* 테이블 스타일 */
        .xans-order {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: #fafaff;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(200,200,220,0.07);
            margin-bottom: 24px;
        }

        /* 테이블 헤더 */
        .xans-order thead {
            background: linear-gradient(90deg, #e3e3f7 0%, #f7c6e6 100%);
            color: #666666d7;
        }

        .xans-order th {
            padding: 16px 10px;
            font-size: 18.5px;
            font-weight: 600;
            text-align: center;
            border: none;
            letter-spacing: 0.5px;
            font-family: 'NanumSquareRound';
        }

        .xans-order th:first-child {
            text-align: left;
            padding-left: 20px;
        }

        .xans-order th:nth-child(2),
        .xans-order td:nth-child(2) {
            text-align: left;
            padding-left: 12px;
        }

        /* 테이블 바디 */
        .xans-order td {
            padding: 18px 10px;
            text-align: center;
            border-bottom: 1px solid #f0f1f7;
            vertical-align: middle;
            background: #fff;
        }

        .xans-order td:first-child {
            text-align: left;
            padding-left: 18px;
        }

        .xans-order td:nth-child(3) {
            text-align: left;
            padding-left: 12px;
        }

        /* 상품명 스타일 */
        .ec-product-name {
            font-size: 20px;
            font-weight: 400;
            color: #555;
            margin-bottom: 6px;
            line-height: 1.4;
            padding-left : 30px;
        }

        /* 수량 조절 버튼 */
        .ec-base-qty {
            display: flex;
            align-items: center;
            border: 1.5px solid #e3e3f7;
            border-radius: 20px;
            overflow: hidden;
            width: 100px;
            margin: 0 auto;
            background: #f7f8fa;
            transition: border 0.2s;
        }

        .ec-base-qty button {
            border: none;
            background: #f7f8fa;
            color: #b6b6e5;
            width: 28px;
            height: 28px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s, color 0.2s;
        }

        .ec-base-qty button:hover {
            background: #e3e3f7;
            color: #a48fd1;
        }

        .ec-base-qty input {
            border: none;
            height: 28px;
            width: 38px;
            text-align: center;
            font-size: 14px;
            font-weight: 500;
            background: #f7f8fa;
            outline: none;
        }

        /* 가격 스타일 */
        .xans-order td strong {
            font-size: 16px;
            font-weight: 600;
            color: #a48fd1;
        }

        /* 체크박스 스타일 */
        .xans-order input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #b6b6e5;
            cursor: pointer;
        }

        /* 선택상품 삭제 버튼 */
        .xans-order-selectorder {
            margin-bottom: 18px;
        }

        .xans-order-selectorder ul {
            display: flex;
            justify-content: flex-end;
            list-style: none;
        }

        .xans-order-selectorder a {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 10px 20px;
            background: #ffe3e3;
            color: #d16d6d;
            text-decoration: none;
            border-radius: 20px;
            font-weight: 500;
            font-size: 15px;
            transition: background 0.2s, color 0.2s;
            box-shadow: 0 2px 8px rgba(255, 200, 200, 0.08);
        }

        .xans-order-selectorder a:hover {
            background: #ffd6d6;
            color: #b94a4a;
        }

        /* 결제 예정 금액 섹션 */
        .xans-order-totalsummary {
            background: #f7f8fa;
            border-radius: 16px;
            padding: 24px 18px;
            margin-bottom: 22px;
            box-shadow: 0 2px 10px rgba(200,200,220,0.06);
        }

        .xans-order-totalsummary table {
            width: 100%;
            border-collapse: collapse;
        }

        .xans-order-totalsummary th {
            padding: 12px 0;
            text-align: left;
            font-size: 17px;
            font-weight: 600;
            color: #444;
            border-bottom: 1px solid #ececf3;
        }

        .xans-order-totalsummary th span {
            color: #a48fd1;
            font-weight: 700;
        }

        .xans-order-totalsummary td {
            padding: 14px 0;
            text-align: right;
            border-bottom: 1px solid #ececf3;
            font-size: 15px;
        }

        .xans-order-totalsummary td:first-child {
            text-align: left;
        }

        .xans-order-totalsummary p {
            font-size: 15px;
            color: #888;
            margin-bottom: 6px;
        }

        .xans-order-totalsummary strong {
            font-size: 18px;
            font-weight: 700;
            color: #a48fd1;
        }

        /* 주문 버튼 섹션 */
        .xans-order-totalorder {
            margin-top: 40px;
        }

        .xans-order-totalorder ul {
            list-style: none;
        }

        .order-btn {
            display: flex;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        .order-btn a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            width: 220px;
            height: 48px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            border-radius: 24px;
            transition: background 0.2s, color 0.2s, box-shadow 0.2s;
            box-shadow: 0 2px 8px rgba(180,180,200,0.08);
        }

        .order-btn a:first-child {
            background: linear-gradient(90deg, #e3e3f7 0%, #f7c6e6 100%);
            color: #666;
            border: none;
        }

        .order-btn a:first-child:hover {
            background: #f7c6e6;
            color: #a48fd1;
        }

        .order-btn a:last-child {
            background: #fff;
            color: #a48fd1;
            border: 1.5px solid #e3e3f7;
        }

        .order-btn a:last-child:hover {
            background: #f7f8fa;
            color: #a48fd1;
        }

        /* 상품 이미지 스타일 */
        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(200,200,220,0.08);
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            #container {
                margin: 8px;
                padding: 10px;
            }

            #default_title strong {
                font-size: 1.3rem;
            }

            .xans-order {
                font-size: 13px;
            }

            .xans-order th,
            .xans-order td {
                padding: 10px 4px;
            }

            .order-btn {
                flex-direction: column;
                align-items: center;
            }

            .order-btn a {
                width: 100%;
                max-width: 220px;
            }
        }

        /* 애니메이션 효과 */
        .cart-item {
            transition: background 0.2s;
        }

        .cart-item:hover {
            background: #f7f8fa;
        }

        /* 로딩 상태 */
        .loading {
            opacity: 0.6;
            pointer-events: none;
        }

        /* 빈 장바구니 상태 */
        .empty-cart {
            text-align: center;
            padding: 40px 10px;
            color: #aaa;
        }

        .empty-cart i {
            font-size: 3rem;
            color: #e3e3f7;
            margin-bottom: 14px;
        }

        .empty-cart h3 {
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: #888;
        }
        #stock {
        	font-size : 13px;
        	color : gray;
        }
    </style>

    <body>
        <jsp:include page="../common/menubar.jsp" />
        
        <br><br><br>

        <div id="container">
            <div id="default_title">
                <strong><i class="fas fa-shopping-cart"></i> 장바구니</strong>
            </div>

            <div id="orderListArea">
                <form action="/soyo/cart/paymentCheck" method="get" id="paymentCheck">
                    <table class="xans-order">
                        <colgroup>
                            <col style="width:80px">
                            <col style="width:120px">
                            <col style="width:auto">
                            <col style="width:120px">
                            <col style="width:120px">
                            <col style="width:160px">
                        </colgroup>

                        <thead>
                            <tr>
                                <th scope="col" style="width: 80px; text-align: left;">
                                    <div style="display: flex; justify-content: left; align-items: center; gap: 6px;">
                                        <input type="checkbox" name="animal" onclick="selectAll(this)">
                                    </div>
                                </th>
                                <th scope="col">상품이미지</th>
                                <th scope="col">상품명</th>
                                <th scope="col">사이즈</th>
                                <th scope="col">수량</th>
                                <th scope="col">상품가격</th>
                                <th scope="col">총 가격</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <c:forEach var="cart" items="${cartList}">
                                <tr class="cart-item">
                                    <!-- 체크박스 -->
                                    <td>
                                    	<input type="hidden" name="memberId" value="${ sessionScope.loginUser.memberId }"/>
                                        <input type="checkbox" name="productId" value="${cart.productNo}" />
                                        <input type="hidden" name="productSize" id="productSize" value="${cart.productSize}" />
                                    </td>
                                    
                                    <!-- 상품 이미지 -->
                                    <td>
                                        <img src="http://localhost:8100/soyo/resources/product_upfile/${cart.productChange}" alt="상품이미지" 
                                        class="product-image" onerror="this.src='https://via.placeholder.com/80x80?text=이미지없음'"
                                        >
                                    </td>
                                    
                                    <!-- 상품명 -->
                                    <td>
                                        <div class="ec-product-name">${cart.productName}</div>
                                    </td>
                                    
                                    <td>
										<select id="productSize" name="productSize" onchange="changeStock(this)" >
										    <option value="L" ${cart.productSize == 'L' ? 'selected' : ''}>L</option>
										    <option value="M" ${cart.productSize == 'M' ? 'selected' : ''}>M</option>
										    <option value="S" ${cart.productSize == 'S' ? 'selected' : ''}>S</option>
										</select>
									</td>
                                    <!-- 수량 -->
                                    <td>
                                        <div class="ec-base-qty">
                                            <button type="button" onclick="count('minus', this)">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <input type="number" name="pop_out" class="pop_out" value="${cart.productCount}" min="1"/>
                                            <button type="button" onclick="count('plus', this)">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                            <br>
                                        </div>
                                            상품재고 : <span id="stock">${cart.stockCount }</span>
                                    </td>


                                    <!-- 상품가격 -->
                                    <td>
                                        <strong>${cart.productPrice}원</strong>
                                    </td>

                                    <!-- 총 가격 -->
                                    <td>
                                        <strong class="item-total-price">0원</strong>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>

                <!-- 선택상품 삭제 버튼 -->
                <div class="xans-order-selectorder">
                    <ul>
                        <li>
                            <a href="#none" onclick="deleteSelected()">
                                <i class="fas fa-trash-alt"></i>
                                <span>선택상품 삭제</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- 결제 예정 금액 표시 -->
                <div class="xans-order-totalsummary">
                    <table>
                        <thead>                       
                            <tr>
                                <th scope="col" colspan="2">
                                    <i class="fas fa-receipt"></i> 결제예정 총 <span>${fn:length(cartList)}</span>건
                                </th>
                            </tr>                        
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="box shipping txt16">
                                        <p>배송비</p>
                                        <strong>
                                            <span id="total_delv_price_front">
                                                <span class="total_delv_price_front">무료</span>
                                            </span>
                                        </strong>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <p>결제예정금액</p>
                                        <strong>
                                            <span id="total_order_price_front">0원</span>
                                        </strong>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 주문 버튼 -->
                <div class="xans-order-totalorder">
                    <ul>
                        <li class="order-btn">
                            <a href="#none" onclick="submitAll()">
                                <i class="fas fa-shopping-bag"></i>
                                전체상품 주문
                            </a>
                            <a href="#none" onclick="submitSelect(event)">
                                <i class="fas fa-check-circle"></i>
                                선택상품 주문
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <br>

        <jsp:include page="../common/footer.jsp" />

        <script>
            // 기존 JavaScript 코드는 그대로 유지
            /* 상품 수량 증감용 함수 */
            function count(type, ths) {
                const $input = $(ths).closest("td").find(".pop_out");
                let currentCount = parseInt($input.val());
                const $stock =  $(ths).closest("td").find("#stock").text();
               
                
                //console.log($stock);

                // 수량 증감
                if (type === 'plus'&& (currentCount<$stock)) {
                    ++currentCount    	
                }
                else if(type === 'minus'){
                    if (currentCount > 1) 
                    	currentCount--;
                } 
            
                //console.log(currentCount);
                $input.val(currentCount); // input에 새 값 반영
            
                const $row = $(ths).closest("tr");
                const productNo = parseInt($row.find("input[name='productId']").val());
                const productSize = $row.find("input[name='productSize']").val();
                const memberId = $row.find("input[name='memberId']").val();
            
                
                // AJAX로 수량만 업데이트 (가격은 반영 안 함)
                $.ajax({
                    type: "POST",
                    url: "/soyo/cart/update",
                    data: {
                        productNo: productNo,
                        productCount: currentCount,
                        productSize: productSize,
                        memberId:memberId
                    },

                    success: function (result) {
                        updateSelectedTotal();
                    },
                    error: function () {
                        console.log("ajax통신실패");
                    }
                });
            
                // 선택된 상품 총합 갱신
             
            }
			
            //사이즈 변경시 재고 수량 변경함수
            function changeStock(selectElement){
            	
            	const $select = $(selectElement); // DOM 객체 보존
                const $row = $select.closest("tr");
                const productSize = $select.val();
                
                const stock = $row.find("#stock");
                const $count = $row.find(".pop_out");

                const productNo = parseInt($row.find("input[name='productId']").val());
 
                 $.ajax({
                     type: "POST",
                     url: "/soyo/cart/changeStock",
                     data: { 
                         productNo : productNo,
                         productSize : productSize
                     },
                     success: function(result) {
                        stock.text(result);
                        console.log(result);
                        if(result==0){
                        	$count.val(0)
                        }
                     },
                     error: function () {
                         console.log("ajax통신실패");
                     }
                 });
            }
            /* 전체 체크용 함수 */
            function selectAll(selectAll)  {
                 const checkboxes = document.querySelectorAll('input[name="productId"]');
                    
                checkboxes.forEach((checkbox) => {
                    checkbox.checked = selectAll.checked;
                })
                
                updateSelectedTotal();
            }
            
            $(document).ready(function () {
                $('input[name="productId"]').on('change', function () {
                    updateSelectedTotal();
                });
                
                // 페이지 로드 시 초기 계산
                updateSelectedTotal();
            });
            
            function updateSelectedTotal() {
                let total = 0;
                let details = "";
                
                $('input[name="productId"]:checked').each(function () {
                    const $row = $(this).closest("tr");
                    const priceText = $row.find("td").eq(5).text();
                    const cartCount = parseInt($row.find("td>div input").val());
                    const numericPrice = parseInt(priceText.replace(/[^0-9]/g, ""));
                    
                    let itemTotal = numericPrice * cartCount;
                    total += itemTotal;
                    
                    $row.find(".item-total-price").text(itemTotal.toLocaleString('ko-KR') + "원");
                    
                    // 가격 상세 항목
                    details += "<p>"+ itemTotal.toLocaleString('ko-KR') + "원" + "</p>"
                    $(".totalPrice").html(details);
                });

                $('#total_order_price_front').text(total.toLocaleString('ko-KR') + ' 원');                    
            }
            
            function deleteSelected() {
                let productNoList = [];

                $('input[name="productId"]:checked').each(function () {
                    productNoList.push($(this).val());
                });

                if (productNoList.length === 0) {
                    alert("삭제할 상품을 선택하세요");
                    return;
                }

                if (!confirm("선택한 상품을 삭제하시겠습니까?")) return;

                $.ajax({
                    type: "POST",
                    url: "/soyo/cart/delete",
                    traditional: true,
                    data: { 
                        productNoList: productNoList 
                    },
                    success: function(result) {
                        if (result === "성공") {
                            $('input[name="productId"]:checked').each(function () {
                                $(this).closest("tr").remove();
                            });
                            updateSelectedTotal();
                            alert("선택된 상품이 삭제되었습니다");
                        } else {
                            alert("서버에서 삭제에 실패했습니다.");
                        }
                    },
                    error: function () {
                        console.log("ajax통신실패");
                    }
                });
            }
            
            function submitSelect(event){     	
                event.preventDefault();

                let productNoList = [];
                let productCountList = [];
                let productSizeList = [];

                $('input[name="productId"]:checked').each(function () {
                    const $row = $(this).closest("tr");
                    const count = parseInt($row.find(".pop_out").val());
                    const productSize = $row.find("#productSize").val();

                    productNoList.push($(this).val());
                    productCountList.push(count);
                    productSizeList.push(productSize);
                });

                if (productNoList.length === 0) {
                    alert("구매할 상품을 선택하세요");
                    return;
                }
				
                $('#paymentCheck input[name="productNoList"]').remove();
                $('#paymentCheck input[name="productCountList"]').remove();
                $('#paymentCheck input[name="productSizeList"]').remove();

                // 상품 번호 input 추가
                productNoList.forEach(function(productNo) {
                    $('<input>').attr({
                        type: 'hidden',
                        name: 'productNoList',
                        value: productNo
                    }).appendTo('#paymentCheck');
                });

                // 상품 수량 input 추가
                productCountList.forEach(function(count) {
                    $('<input>').attr({
                        type: 'hidden',
                        name: 'productCountList',
                        value: count
                    }).appendTo('#paymentCheck');
                });
                
                // 상품 사이즈 input 추가
                productSizeList.forEach(function(productSize) {
                    $('<input>').attr({
                        type: 'hidden',
                        name: 'productSizeList',
                        value: productSize
                    }).appendTo('#paymentCheck');
                });

                $('#paymentCheck').submit(); 
            }

            // 전체상품 주문 함수 (기존 기능 유지)
            function submitAll() {
			    // 모든 체크박스를 체크
			    $('input[name="productId"]').prop('checked', true);
			
			    // 수량/상품번호 수집
			    let productNoList = [];
			    let productCountList = [];
			    let productSizeList = [];
			
			    $('input[name="productId"]').each(function () {
                    const $row = $(this).closest("tr");
                    const count = parseInt($row.find(".pop_out").val());
                    const productSize = $row.find("#productSize").val();

                    productNoList.push($(this).val());
                    productCountList.push(count);
                    productSizeList.push(productSize);
			    });
			
			    // 기존 hidden input 제거
			    $('#paymentCheck input[name="productNoList"]').remove();
			    $('#paymentCheck input[name="productCountList"]').remove();
			    $('#paymentCheck input[name="productSizeList"]').remove();
			    
			    // 새 hidden input 추가
			    productNoList.forEach(function(productNo) {
			        $('<input>').attr({
			            type: 'hidden',
			            name: 'productNoList',
			            value: productNo
			        }).appendTo('#paymentCheck');
			    });
			
			    productCountList.forEach(function(count) {
			        $('<input>').attr({
			            type: 'hidden',
			            name: 'productCountList',
			            value: count
			        }).appendTo('#paymentCheck');
			    });
			    
			 // 상품 사이즈 input 추가
                productSizeList.forEach(function(productSize) {
                    $('<input>').attr({
                        type: 'hidden',
                        name: 'productSizeList',
                        value: productSize
                    }).appendTo('#paymentCheck');
                });
			
			    // 폼 제출
			    $('#paymentCheck').submit();
			}

        </script>
    </body>
</html>














