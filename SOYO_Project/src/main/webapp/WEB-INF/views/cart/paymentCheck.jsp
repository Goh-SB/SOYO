<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제정보</title>
<style>
    	.container{
            width: 1200px;
            margin: auto;
        }

        #myTitle{
            width: 1200px;
            height: 120px;
            font-size: 40px;
            text-align: center;
            vertical-align: middle;
        }

        #content{
            width: 1200px;
            height: 800px; /* 여기 조절하기 */
        }

        #content>div{
            float: left;
            display: block;
        }

        #left-Menu{
            width: 180px;
        }

        #left-MenuList{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            font-size: 23px;
            height: 50px;
        }

        #left-MenuList li{
            margin-top: 5px;
            padding-left: 7px;
            
        }

        #left-MenuList li:hover{
            background-color: rgba(252, 206, 255, 0.821);
            border-top-right-radius: 25px;
            border-bottom-right-radius: 25px;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;
            width: 166px;
            
        }

        #left-MenuList a{
            text-decoration: none;
            color: gray;
            display: block;
            width: 170px;
            /* border: 1px solid lightgray; */
            
        }

        #myContent{
            width: 800px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            background-color: rgba(255, 242, 253, 0.663);
        }


        #order-List>ul{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
        }

        #order-List>ul>li{
            border: 2px solid rgb(225, 168, 255);
            padding: 10px;
            border-radius: 5px;
            margin: 20px;
        }

        table{
            text-align: left;
            margin: auto;
        }


        .fontsize20{
            font-size: 20px;
            color: rgb(43, 62, 115);
        }

        .updateInput{
            width: 400px;
            height: 50px;
            padding: 5px;
            margin-top: 10px;
            border-radius: 8px;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btnSubmit {
            width: 100px;
            height: 40px;
            padding: 5px;
            margin: 30px;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: aliceblue;
            border-radius: 8px;
        }
        #paymentInfo{
        	width : 200px;
        	height : 300px;
        	margin-left : 20px;
        	padding : 5px;
        	border: none;
        	border-radius: 8px;
        	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        	background-color: rgba(255, 242, 253, 0.663);
        }

        #infodiv {
            background-color: rgba(241, 241, 221, 0.651);
            margin-left: 50px;
            margin-right: 50px;
            padding: 20px;
            border-radius: 15px;
            width: 606px;
            margin: auto;
            text-align: center;
        }

        #buttondiv {
            display: flex;
            justify-content: center;    /* 가로 중앙 정렬 */
        }
</style>
</head>
<body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <jsp:include page="../common/menubar.jsp" />
	 
	
		<div class="container">
        <div class="" id="myTitle">
            마이페이지
        </div>
        <div class="" id="content">
            <div class="" id="left-Menu">

                <ul id="left-MenuList">
   
                </ul>
            </div>
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; text-align: center;
                padding: 15px;">배송 정보</div>
                    <table>
                        
                        <tr>
                        	<td colspan="3"><input type="hidden" class="fontsize20 updateInput" name="memberId" value="${ sessionScope.loginUser.memberId }" ></td>
                        </tr>
                        
                        <tr>
                            <th width="200px"><span class="fontsize20">수령인</span></th>
                            <td width="400px"><input name="memberName" class="fontsize20 updateInput" type="text" value="${ sessionScope.loginUser.memberName }" ></td>
                        </tr>
                       
                        <tr>
                            <th><span class="fontsize20">휴대전화번호</span></th>
                            <td><input name="phone" type="text" class="fontsize20 updateInput" value="${ sessionScope.loginUser.phone }" ></td>
                        </tr>
                        
                        <tr>
						  <th><span class="fontsize20">주소선택</span></th>
						  <td>
						    <input type="radio" name="addressType" value="기본배송지"> 기본배송지
						    <input type="radio" name="addressType" value="직접입력"> 직접입력
						    <input type="button" value="배송지 선택">
						  </td>
						</tr>
                        <tr>
                            <th><span class="fontsize20">주소</span></th>
                            <td><input type="text" id="address" class="updateInput"  name="address" maxlength="66" value="${ baseAddress }" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="button" style="margin: 5px;" class="btnSubmit" onClick="execDaumPostcode()" value="주소검색"></td>
                        </tr>
                        
                        <tr>
                            <th><span>상세주소</span></th>
                            <td><input type="text" class="updateInput" id="addrDetail" name="addrDetail" maxlength="66" value="${ detailAddress }" required></td>                
                        </tr>
                        
                        <tr>
						  <th><span>배송지 이름</span></th>
						  <td><input type="text" class="updateInput" name="addressName" placeholder="예: 집, 회사, 친구집"></td>
						</tr>
						                        
                        <tr>
                        	<th><span>요청사항</span></th>
                        	<td><input type="text" class="updateInput" id="requestMsg" name="requestMsg" maxlength="66" placeholder="부재 시 경비실에 맡겨주세요"></td>
                        </tr>
                        
                        <input type="hidden" name="totalPrice" value="${totalPrice}">
                        
                        <tr>
                    
                    </table>
                    <br>

                    <div id="infodiv">
                        <h3>총 결제 금액: <span id="total-price" style="color: darkgreen;">${totalPrice}</span>원</h3>
                    </div>

                    <div id="buttondiv">
                        <button onclick="requestPay()" class="btnSubmit">결제</button>
                        <button type="button" class="btnSubmit" onclick="history.back();">취소</button>
                    </div>
          
		            </div>
		     	    </div>
		     	   
		     	   <!-- 체크된 상품번호 가져오기
		     	    <c:forEach var="productNo" items="${paramValues.productNoList}">
					    <input type="hidden" name="productNoList" value="${productNo}" />
					</c:forEach>
					
					<c:forEach var="productCount" items="${paramValues.productCountList}">
					    <input type="hidden" name="productCountList" value="${productCount}" />
					</c:forEach>
					
					
					<c:forEach var="productSize" items="${paramValues.productSize}">
					    <input type="hidden" name="productSize" value="${productSize}" />
					</c:forEach>
					 -->
					 <c:forEach var="i" begin="0" end="${fn:length(paramValues.productNoList) - 1}">
						  <input type="hidden" name="productNoList" value="${paramValues.productNoList[i]}" />
						  <input type="hidden" name="productCountList" value="${paramValues.productCountList[i]}" />
						  <input type="hidden" name="productSize" value="${paramValues.productSize[i]}" />
						</c:forEach>
					 
          
    			</div>

                    <script>
                        const span = document.getElementById('total-price');

                        // 숫자로 변환
                        const number = parseInt(span.textContent, 10);

                        // 콤마 추가
                        span.textContent = number.toLocaleString('ko-KR');
                    </script>
		        </div>
		     	   
                <!-- 체크된 상품번호 가져오기 
                <c:forEach var="productNo" items="${paramValues.productNoList}">
					<input type="hidden" name="productNoList" value="${productNo}" />
				</c:forEach>
					
				<c:forEach var="productCount" items="${paramValues.productCountList}">
					<input type="hidden" name="productCountList" value="${productCount}" />
				</c:forEach>
                -->
    		</div>
    <jsp:include page="../common/footer.jsp" />
</body>
		<script>
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            document.getElementById("address").value = data.roadAddress;
		        }
		    }).open();
		}
		</script>
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		  var IMP = window.IMP;
		  IMP.init("imp28344582");  // 네 포트원 userCode
		
		  function requestPay() {
			  	
			  const memberName = document.querySelector("input[name='memberName']").value;
			  const phone = document.querySelector("input[name='phone']").value;
			  const address = document.querySelector("input[name='address']").value;
			  const addrDetail = document.querySelector("input[name='addrDetail']").value;
			  const requestMsg = document.querySelector("input[name='requestMsg']").value;
			  const totalPrice = document.querySelector("input[name='totalPrice']").value;
			  const addressAlias = document.querySelector("input[name='addressName']").value;
			  const addressName = document.querySelector("input[name='addressName']").value;
			  const fullAddress = address + " " + addrDetail;
			  		  
			  const selectedProductList = [];
			  const selectedProductCountList = []; 
			  const selectedProductSizeList = [];
			  
			  const countInputs = document.querySelectorAll("input[name='productCountList']");
			  countInputs.forEach(function(input){
			    selectedProductCountList.push(parseInt(input.value));
			  });

			  const selectedProducts = document.querySelectorAll("input[name='productNoList']");
			  selectedProducts.forEach(function(input){
			    selectedProductList.push(parseInt(input.value));
			  });
			  
			  const selectedProductSize = document.querySelectorAll("input[name='productSize']");
			  selectedProductSize.forEach(function(input){
			    selectedProductSizeList.push(input.value);  
			  });

			  // console.log(selectedProductSizeList);
			  

			  
		    IMP.request_pay({
		      pg: "html5_inicis", // 또는 "html5_inicis", "danal" 등 테스트 가능한 pg
		      pay_method: "card",
		      merchant_uid: "order_" + new Date().getTime(),
		      name: "SOYO",
		      amount: totalPrice,
		      buyer_email: "test@portone.io",
		      buyer_name: memberName,
		      buyer_tel: phone,
		      buyer_addr: fullAddress,
		      buyer_postcode: "123-456"
		      // 모바일 테스트 중이면 아래도 추가
		      
		    }, function (rsp) {
		      if (rsp.success) {
		    	 console.log(rsp);
		    	 
		    	 const orderInfo = {
		    			    memberId: document.querySelector("input[name='memberId']").value,    	
		    			    orderImpNo : rsp.imp_uid,  
		    			    receiverName: memberName,
		    			    receiverPhone: phone,
		    			    addressOther: fullAddress,
		    			    addressAlias: addressAlias,
		    			    requestMsg: requestMsg,
		    			    totalPrice: parseInt(totalPrice), // 
		    			    selectedProductList: selectedProductList,
		    			    selectedProductCountList: selectedProductCountList,
		    			    selectedProductSizeList : selectedProductSizeList
		    			    
		    			};
		    	 $.ajax({
		    		    type: "POST",
		    		    url: "/soyo/cart/insertOrder", // 컨트롤러에 맞게 URL 조정
		    		    contentType: "application/json; charset=utf-8",
		    		    data: JSON.stringify(orderInfo),
		    		    success: function(result) {
							if(result>0){
								alert("주문완료!");
								location.href = "/soyo";
							}else{
								alert("주문실패!");
							}
		    		    },
		    		    error: function(xhr, status, error) {
		    		      console.error("에러 발생:", error);
		    		      alert("주문 정보 전송 중 오류 발생");
		    		    }
		    		  });
		    	 
		    	 
		    
		        alert("결제 성공! imp_uid: " + rsp.imp_uid);
		        sessionStorage.setItem("last_imp_uid", rsp.imp_uid);
		      } else {
		        alert("결제 실패: " + rsp.error_msg);
		      }
		    });
		  }
		  
		  document.querySelectorAll("input[name='addressType']").forEach(function(radio) {
			  radio.addEventListener("change", function() {
			    if (this.value === "기본배송지") {
			      //console.log("기본배송지 선택");
			      
			    } else if (this.value === "직접입력") {
			      //console.log("직접입력 선택");
			     
			    }
			  });
			});

		</script>
</html>