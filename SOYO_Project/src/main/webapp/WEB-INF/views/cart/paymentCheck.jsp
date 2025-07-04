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
            background-color: #dfe6fc6c;
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
            border: 2px solid rgba(255, 242, 253, 0.663);
            box-shadow: 3px 6px 8px rgba(0, 0, 0, 0.1);
        }

        .btnSubmit {
            width: 100px;
            height: 40px;
            padding: 5px;
            margin-top: 10px; 
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #ffeff5;
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
       .addressUl {
       	  background-color : #fff8f8;
		  list-style: none;
		  padding: 15px; /* 필요 시 추가 */
		  margin: 0;  /* 필요 시 추가 */
		}
		.btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.15);
        border-radius: 10px;
   		 }
   		 .radio-Btn{
   		 width : 20px;
   		 height : 20px;
   		 vertical-align : middle;
   		 }
   		 #modalHeader{
   	    text-align: center;
        height: 60px;
        font-size: 20px;
        background-color: rgb(248, 226, 254);
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        color: #7e4f8b85;
        font-weight: bold;
        padding : 12px;
   		 }
   		 .addressFont{
   		 font-weight: bold;
   		 }
   		 #all{
   		  background: linear-gradient(135deg, #f7f8fa 0%, #e9eaf3 100%);
   		 }
		         #default_title {
            text-align: center;
			margin-top: 10px;
            margin-bottom: 10px;
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
        .btnSubmit1{
        	width: 100px;
            height: 40px;
            padding: 5px;
            margin: 30px;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #dfe6fc6c;
            border-radius: 8px;
        }
        #address{
        	margin-bottom : 5px;
        }
        #payButton{
        	margin : 10px;
        }
</style>
</head>
<body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="all">
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
                <div id="default_title">
                <strong><i class="fas fa-shopping-cart"></i> 배송정보</strong>
            </div>
                    <table>
                        
                        <tr>
                        	<td colspan="3"><input type="hidden" class="fontsize20 updateInput" name="memberId" value="${ sessionScope.loginUser.memberId }" ></td>
                        </tr>
                        
                        <tr>
                            <th width="200px"><span class="fontsize20">수령인</span></th>
                            <td width="400px"><input name="memberName" class="fontsize20 updateInput" type="text" value="${ sessionScope.loginUser.memberName }" required maxlength="15"></td>
                        </tr>
                       
                        <tr>
                            <th><span class="fontsize20">휴대전화번호</span></th>
                            <td><input name="phone" type="text" class="fontsize20 updateInput" value="${ sessionScope.loginUser.phone }" required maxlength="12" oninput="this.value = this.value.replace(/[^0-9]/g, '')"></td>
                        </tr>
                        
                        <tr >
						  <th><span class="fontsize20">주소선택</span></th>
						  <td >
						    <input type="radio" name="addressType" value="기본배송지" class="radio-Btn"> 기본배송지
						    <input type="radio" name="addressType" value="직접입력" class="radio-Btn"> 직접입력	
						   	 <button type="button" id="selectAddress" class="btnSubmit">배송지 선택</button>
					  
						  </td>
						</tr>
                        <tr>
                            <th><span class="fontsize20">주소</span></th>
                            <td><input type="text" id="address" class="updateInput"  name="address" maxlength="66" value="${ baseAddress }" required readOnly></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="button" style="margin: 5px;" class="btnSubmit" onClick="execDaumPostcode()" value="주소검색"></td>
                        </tr>
                        
                        <tr>
                            <th><span class="fontsize20">상세주소</span></th>
                            <td><input type="text" class="updateInput" id="addrDetail" name="addrDetail" maxlength="66" value="${ detailAddress }" required></td>                
                        </tr>
                        
                        <tr>
						  <th><span class="fontsize20">배송지 이름</span></th>
						  <td><input type="text" class="updateInput" id="addressName" name="addressName" placeholder="예: 집, 회사, 친구집" maxlength="10"></td>
						</tr>
						                        
                        <tr>
                        	<th><span class="fontsize20">요청사항</span></th>
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
                        <button onclick="requestPay()" class="btnSubmit" id="payButton">결제</button>
                        <button type="button" class="btnSubmit" id="payButton" onclick="history.back();">취소</button>
                    </div>
          
		            </div>
		     	    </div>
		     	    
		     	    <!-- 모달창 -->
					<div id="addressModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.4); z-index:1000;">
				    <div style="background:#fff; width:500px; margin:100px auto;  border-radius:10px; position:relative; ">
				       <div id="modalHeader"><h3 style="text-align:center;" >배송지 선택</h3></div>
				        <div id="addressList" style="list-style:none; padding:0;">

					
				            <!-- 데이터베이스에서 불러온 주소들 출력 
				            <c:forEach var="address" items="${requestScope.address}">
				               
				            </c:forEach> -->
				        </div>
				        <button onclick="closeModal()" class="btnSubmit1" style="display:block; margin:10px auto;  padding : 10px; ">닫기</button>
				        <div style="height : 5px;"></div>
				        
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
			  	
			  const memberName = document.querySelector("input[name='memberName']").value.trim();
			  const phone = document.querySelector("input[name='phone']").value.trim();
			  const address = document.querySelector("input[name='address']").value.trim();
			  const addrDetail = document.querySelector("input[name='addrDetail']").value.trim();
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
			  
			 if (!memberName || !phone || !address || !addrDetail) {
			    alert("모든 필수 항목을 입력해주세요.");
			    return; // 결제 진행 중단
			  }
						  
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
		    	 
		    	 console.log(orderInfo);
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
			      console.log("기본배송지 선택");

			      $.ajax({
			        url: "/soyo/member/defaultAddress",
			        type: "GET",
			        success: function(data) {
			          console.log("기본배송지 응답:", data);

			          if (data.addressOther) {
			            const parts = data.addressOther.split("+");
			            const beforePlus = parts[0] || "";
			            const afterPlus = parts[1] || "";

			            document.getElementById("address").value = beforePlus.trim();
			            document.getElementById("addrDetail").value = afterPlus.trim();
			            
			            document.getElementById("address").readOnly = true;
			            document.getElementById("addrDetail").readOnly = true;
			          } 
			          
			          document.getElementById("addressName").value = data.addressName
			        },
			        error: function(xhr, status, error) {
			          console.error("기본배송지 불러오기 실패:", error);
			          alert("기본배송지 정보를 불러오는 데 실패했습니다.");
			        }
			      });

			    } else if (this.value === "직접입력") {
			      console.log("직접입력 선택");
			      document.getElementById("address").value = "";
			      document.getElementById("addrDetail").value = "";
			      document.getElementById("addressName").value = "";
			      
			      document.getElementById("address").readOnly = true;
		            document.getElementById("addrDetail").readOnly = false;
			    }
			  });
			});
		  
		  window.onload = function() {
			  let memberId = "${sessionScope.loginUser.memberId}".trim();
			  
			  $.ajax({
			    url: "/soyo/member/addressList",
			    type: "GET",
			    data: { memberId },
			    success: function(result) {
			      console.log("주소 개수:", result);
			      if (result == 1) {
			        $("#selectAddress").text("배송지 없음").prop("disabled", true);
			      }
			    },
			    error: function(xhr, status, error) {
			      console.error("주소 목록 가져오기 실패:", error);
			    }
			  });
			}

		  
		// 모달 열기
		  document.getElementById("selectAddress").addEventListener("click", function() {
		    document.getElementById("addressModal").style.display = "block";
		  
		    $.ajax({
		        url: "/soyo/member/selectAddress",
		        type: "GET",
		        success: function(data) {
		            console.log("기본배송지 응답:", data);
		            let resultStr = "";
		            for (let item of data) {
		                const parts = item.addressOther.split("+");
		                const beforePlus = parts[0] || "";
		                const afterPlus = parts[1] || "";

		                resultStr += 
		                "<ul class='addressUl'>" +
		                
		                "<li class='addressFont'>" +
		                "<label style='cursor:pointer;'>" + 
		                "<input id='chooseAddress" + item.addressNo + "' name='chooseAddress' type='checkbox' style='margin-right: 10px; cursor:pointer;' " +
		                "onclick=\"selectAddress('" + item.addressOther + "', '" + item.addressName + "')\">" +
		                item.addressName + 
		                "</label>" +
		                "</li>" +
		                "<li class='addressFont'>" + beforePlus + "</li>" +
		                "<li class='addressFont'>" + afterPlus + "</li>" +
		                "</ul><hr>";
		            }
		            document.getElementById("addressList").innerHTML = resultStr; 
		        },
		        error: function(xhr, status, error) {
		            console.error("기본배송지 불러오기 실패:", error);
		            alert("기본배송지 정보를 불러오는 데 실패했습니다.");
		        }
		    });
		 });

		  // 모달 닫기
		  function closeModal() {
		    document.getElementById("addressModal").style.display = "none";
		  }

		  // 주소 선택
		  function selectAddress(addressOther, addressName) {

			  let parts = addressOther.split("+");

			  const beforePlus = parts[0] || "";  // "서울 강남구 테헤란로 123"
			  const afterPlus = parts[1] || ""; 
		    document.getElementById("address").value = beforePlus;
		    document.getElementById("addrDetail").value = afterPlus.trim();
		    document.getElementById("addressName").value = addressName;

		    document.getElementById("address").readOnly = true;
		    document.getElementById("addrDetail").readOnly = true;

		    closeModal();
		  }



		</script>
</html>