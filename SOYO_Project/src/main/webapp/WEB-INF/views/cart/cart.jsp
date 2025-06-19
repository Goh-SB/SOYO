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
    </head>

    <style>
        /* 좌우 여백 */
        #container {
            padding-left: 140px;
            padding-right: 140px;
        }
        
        /* 최상단 문구 관련 스타일 */
        #default_title {
            text-align: center;
            font-size: 40px;
        }

        /* th 부분 관련 스타일 */
        table.xans-order thead tr th {
            border-bottom: 3px inset lightgray;

        }

        table.xans-order th {
            padding: 30px 0 15px;
            font-size: 16px;
            color: #555;
        }

        /* th 부분 중 '전체선택' 부분 관련 스타일 */
        table.xans-order th:nth-child(1) {
            text-align: left;
            padding: 15px 0 30px;
        }

        table.xans-order th:nth-child(1) input {
            margin-right: 10px;
        }

        /* th 부분 중 '상품명' 관련 스타일 */
        table.xans-order th:nth-child(2) {
            text-align: left;
            padding-left: 65px;
        }

        /* td 부분 관련 스타일 */
        table.xans-order td {
            vertical-align: middle;
            text-align: center;
            padding: 20px 0;
        }

        /* td 부분 중 '상품 이미지' 관련 스타일 */
        table.xans-order th:nth-child(2) {
            text-align: left;
            padding-left: 65px;
        }

        /* td 부분 중 '상품명' 관련 스타일 */
        table.xans-order td:nth-child(3) {
            text-align: left;
            padding-left: 35px;
        }

        table.xans-order td .ec-product-name {
            font-size: 18px;
            line-height: 26px;
            color: #000000;
            margin-bottom: 10px;
        }

        /* td 부분 중 '수량' 관련 스타일 */
        table.xans-order td .ec-base-qty {
            position: relative;
            border: 1px solid #ddd;
            overflow: hidden;
            width: 120px;
            display: flex;
            align-items: center;
            box-sizing: border-box;
        }

        table.xans-order td .ec-base-qty>button {
            border: 0;
            background: #fff;
            color: #000;
            width: 30px;
            height: 30px;
            font-size: 12px;
        }

        table.xans-order td>div>input {
            border: 1px solid #ddd;
            border-width: 0 1px !important;
            height: 30px !important;
            margin: 0 !important;
            display: block;
            width: 100%;
            padding: 0;
            flex-grow: 1;
            flex-basis: 0;
            text-align: center;
        }

        /* td 부분 중 '상품 금액' 관련 스타일 */
        table.xans-order td:last-child strong {
            font-size: 20px;
            font-weight: 400;
        }

        /* 체크박스 크기 조절 */
        table.xans-order input[type="checkbox"] {
            width: 18px;
            height: 18px;   
        }

        /* 선택상품 삭제 버튼 관련 스타일 */
        .xans-order-selectorder li {
            list-style: none;
        }

        .xans-order-selectorder a {
            padding: 5px 10px;
            border: 1px solid lightgray;
            color: black;

        }

        /* 결제예정 건수 관련 스타일 */
        .xans-order-totalsummary table {
            width: 90%;
            border-top: 1px solid #000;
        }

        .xans-order-totalsummary table th {
            padding: 15px 20px;
            text-align: left;
            font-size: 16px;
            color: #000;
            border-bottom: 1px solid #ddd;
        }

        .xans-order-totalsummary table th span {
            font-weight: 700;
            color: #00CCCB;
        }

        /* 결제예정금액 관련 스타일 */
        .xans-order-totalsummary table td:nth-child(1) {
            width: 160px;
            padding-left: 250px;
        }

        .xans-order-totalsummary table td:nth-child(2) {
            width: 130px;
        }

        .xans-order-totalsummary table td:last-child {
            width: 50%;
            text-align: right;
            padding-right: 280px;
        }

        .xans-order-totalsummary table td p {
            font-size: 14px;
            line-height: 20px;
            color: #555555;
            margin-bottom: 10px;
        }

        .xans-order-totalsummary table td strong .sp--font {
            font-weight: 400;
            font-size: 22px;
            line-height: 32px;
        }

        .xans-order-totalsummary table td #total_order_price_front {
            font-weight: 700;
            font-size: 26px;
            line-height: 38px;
            color: #e2a6f8;
        }

        /* 주문 버튼 관련 스타일 */
        .xans-order-totalorder ul {
            position: relative;
            padding-top: 30px;
        }

        .xans-order-totalorder .order-btn {
            display: flex;
            justify-content: center;
            width: 100%;
            column-gap: 10px;
        }

        .xans-order-totalorder .order-btn a {
            width: 240px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            line-height: 26px;
            font-weight: 700;
        }

        .xans-order-totalorder .order-btn a:nth-child(1) {
            background-color: #F3D1F4;
            color: #fff;
        }

        .xans-order-totalorder .order-btn a:nth-child(2) {
            border: 1px solid  #e2a6f8;
            color:  #e2a6f8;
        }

        /* 버튼 기본 스타일 제거 */
        div>div>ul>li>a {
            text-decoration : none;
        }
    </style>

    <body>
    	<script>
    		
    	</script>
        
        <jsp:include page="../common/menubar.jsp" />
        
        <br><br><br><br>
        
        <div id="container">
            <div id="default_title">
                <strong>장바구니</strong>
            </div>

            <!-- 여백 -->
            <p space="3xl"></p>

            <div id="orderListArea">

                <table class="xans-element- xans-order xans-order-normnormal xans-record-">
                    <colgroup>
                        <col style="width:80px">
                        <col style="width:120px">
                        <col style="width:640px">
                        <col style="width:120px">
                        <col style="width:120px">
                        <col style="width:160px">
                    </colgroup>

                    <thead>
                        <tr>
                            <th scope="col" colspan="2">
                            <input type="checkbox" name='animal' onclick="selectAll(this)">전체선택
                            <th scope="col" direction="left">상품명</th>
                            <th scope="col">수량</th>
                            <th scope="col">상품가격</th>
                            <th scope="col">총 가격</th>
                        </tr>
                    </thead>
                    
                       <tbody>
                            <c:forEach var="cart" items="${cartList}">
                                <tr class="cart-item">
                                
                                <!-- 체크박스 -->
                                <td><input type="checkbox" name="productId" value="${cart.productNo}" /></td>
								<td>${cart.productChange}</td>
                                <!-- 상품명 -->
                                <td>${cart.productName}</td>

                                <!-- 수량 -->
                               <td>
                                	<div class="ec-base-qty">
	                                    <button type="button" onclick="count('minus', this)">－</button>
	                                 	   <input type="number" name="pop_out" class="pop_out" value="1"/>
	                                    <button type="button" onclick="count('plus', this)">＋</button>
	                                </div>
	                            </td>

                                <!-- 옵션 -->
                                <td>${cart.productPrice }원</td>

                                <!-- 상품금액 = 수량 * 단가 -->
                                
                                <td>
						            <strong class="item-total-price">0원</strong>
						        </td>
														
                                </tr>
                            </c:forEach>
                         </tbody>
                      </table>
                     
    
                <div class="xans-element- xans-order xans-order-selectorder">
                    <ul>
                        <li flex="0">
					      <a href="#none" onclick="deleteSelected()">
							    <span>선택상품 삭제</span>
							</a>
                        </li>
                    </ul>
                </div>
                <br>                    
                <!-- 결제 예정 금액 표시 -->
                <div class="xans-element- xans-order xans-order-totalsummary">
                    <table class="sp--table">
                        <thead>                       
                            <tr>
                                <th scope="col" colspan="4" class="xans-element- xans-order xans-order-normtitle">
                                    결제예정 총 <span>${fn:length(cartList)}</span>건
                                </th>
                            </tr>                        
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="box shipping txt16">
                                        <strong>
                                            <span id="total_delv_price_front" class="sp--font" scale="3xl">
                                                <span class="total_delv_price_front"></span> </span>
                                        </strong>
                                    </div>
                                </td>
                                <td>
                                    <div class="sp--font">
                                        <p>
                                            결제예정금액
                                        </p>
                                        <strong>
                                            <span id="total_order_price_front" class="sp--font" scale="3xl">
                                             원
                                            </span>
                                        </strong>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 결제 예정 금액 표시 -->
                <div class="xans-element- xans-order xans-order-totalorder">
                    <ul>
                        <li class="order-btn">
                            <a href="#none" onclick="" link-order="" link-login="/member/login" class="">
                                전체상품 주문
                            </a>

                            <a href="#none" onclick="" link-order="" link-login="/member/login" class="">
                                선택상품 주문
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
         <br><br><br>
         <jsp:include page="../common/footer.jsp" />
    </body>

    <script>
        /* 상품 수량 증감용 함수 */
		function count(type, ths) {
	    const $input = $(ths).closest("td").find(".pop_out");
	    let currentCount = $input.val();

	    // 수량 증감
	    if (type === 'plus') {
	        currentCount++;
	        updateSelectedTotal();
	    } else {
	        if (currentCount > 1) currentCount--;
	        updateSelectedTotal();
	    }
	
	    $input.val(currentCount); // input에 새 값 반영
	
	    const $row = $(ths).closest("tr");
	    const productNo = parseInt($row.find("input[name='productId']").val());
	
	    
	    // AJAX로 수량만 업데이트 (가격은 반영 안 함)
	    $.ajax({
	        type: "POST",
	        url: "/soyo/cart/update",
	        data: {
	            productNo: productNo,
	            productCount: currentCount
	        },

	        success: function (result) {
	        	
	        	updateSelectedTotal();

	        },
	        error: function () {
	            console.log("ajax통신실패");
	        }
	    });
	
	    // 선택된 상품 총합 갱신
	    updateSelectedTotal();
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
        });
        
        function updateSelectedTotal() {
            let total = 0;
            let details = "";
			
		
            $('input[name="productId"]:checked').each(function () {
                const $row = $(this).closest("tr");
                const priceText = $row.find("td").eq(4).text();
                //console.log(priceText);
                const cartCount = parseInt($row.find("td>div input").val());
                const numericPrice = parseInt(priceText.replace(/[^0-9]/g, ""));
                //console.log(numericPrice);
                
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
        

    </script>
</html>














