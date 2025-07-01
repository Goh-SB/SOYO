<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 배송지 관리</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

    body{
        background-color: #f8f9fa;
    }

    .container {
        width: 1200px;
        margin: auto;
    }

    #content::after {
        content: "";
        display: block;
        clear: both;
    }

    #title{
        text-align: center;
        height: 60px;
        font-size: 20px;
        background-color: rgb(248, 226, 254);
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        color: #7e4f8b85;
        font-weight: bold;
    }

    .fontspan{
        display: inline-block;
        padding-top: 10px;
        margin: auto;
        font-size: 25px;
    }

    #myContent{
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin: 50px;
        border-radius: 15px;
        background-color: white;
        width: 970px;
    }

    #content {
        width: 1500px;
    }

    #content > div {
        float: left;
        display: block;
    }

    .myWishList {
        width: 700px;
        min-height: 500px;
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        padding-top: 15px;
    }

    .productImg {
        width: 75px;
        height: 75px;
    }

    .wishTable {
        width: 800px;
        margin: 50px;
        margin-top: 80px;
    }

    .pageBtn {
        width: 30px;
        height: 30px;
        text-decoration: none;
        border: 1px solid black;
        border-radius: 9px;
        color: cadetblue;
        background-color: lightgrey;
        display: inline-block;
        text-align: center;
        line-height: 30px;
    }

    .pagination {
        justify-content: center;
        width: 100%;
        height: 50px;
        text-align: center;
    }

    .addressForm{
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        border: 2px solid lightgrey;
        border-radius: 15px;
        width: 900px;
        padding: 8px;
        margin: auto;
        margin-bottom: 20px;
        transition: transform 0.4s ease;
        margin-left: 40px;
    }

    .addressForm:hover {
        border: 2px solid rgb(105, 105, 255);
        transform: translateY(-2px);
    }

    .addBtn{
        height: 30px;
        display: block;
        margin-left: 40px;
        margin-bottom: 15px;
        border-radius: 9px;
        width: 200px;
        border: none;
        cursor: pointer;
        background-color: white;
        border: 1px solid rgb(247, 213, 255);
        color: #7e4f8b85;
    }

    .addBtn:hover{
        box-shadow: 0 2px 10px rgba(251, 230, 255, 0.817);
        background-color: rgb(247, 213, 255);
        color: #7e4f8b85;
    }

    .addrSpan{
        margin: 8px;
        margin-left: 15px;
    }

    .btnset{
        margin-left: 680px;
        margin-bottom: 10px;
    }

    .btnsetButton{
        margin-left: 10px;
        width: 70px;
        height: 30px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 9px;
        cursor: pointer;
    }

    .btnsetButton:hover{
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .addrtitle{
        font-weight: bold;
        font-size: 17px;
        color: #442a4be2;
    }

    .addrDetail{
        border: 2px solid rgba(211, 211, 211, 0.362);
        border-radius: 5px;
        margin-bottom: 15px;
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        padding: 10px;
        padding-bottom: 15px;
    }


        /* 모달창 디자인 */
    
    #editModal {
        width: 400px;
        height: 730px;
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        border: 1px solid #ccc;
        z-index: 9999;
        box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        border-radius: 15px;
    }

    .modalLabel{
        box-sizing: border-box;
        font-size: 16px;
        text-align: left;
        color: #442a4be2;
    }

    .modalInput{
        box-sizing: inherit;
        width: 300px;
        height: 40px;
        padding: 5px;
        border-radius: 9px;
        border: none;
        box-shadow: 0 2px 7px rgba(0,0,0,0.1);
        margin-top: 2px !important;
        margin-bottom: 30px !important;
    }

    #aa {
        padding-bottom: 30px;
        padding-top: 12px;
    }

    .modalbtn{
        width: 90px;
        height: 30px;
        background-color: aliceblue;
        border: none;
        border-radius: 9px;
    }

    .btnSubmit{
        width: 300px;
        height: 30px;
        border-radius: 5px;
        border: none;
        background-color: aliceblue;
        margin-bottom: 30px !important;
    }

    .modalTitle{
        background-color: rgb(252, 232, 255);
        border-top-right-radius: 15px;
        border-top-left-radius: 15px;
        height: 60px;
        padding-top: 16px;
        font-size: 23px;
        color: #442a4be2;
    }

    .titleSpan{
        margin-top: 20px;
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br><br><br>

<div class="container">

        <div id="content">
            <div id="left-Menu">
                <jsp:include page="../member/leftMenu.jsp" />
            </div>
                
            <div id="myContent">
                <div id="title"><span class="fontspan">Delivery Address</span></div>
                    <div id="aa">
                        <div class="myWishList">
                            <button class="addBtn" type="button" onclick="addDelivery()">배송지 등록</button>
                            <c:choose>
                                <c:when test="${not empty myDelivery}">
                                    
                                    <c:forEach var="a" items="${myDefaultDelivery}">
                                        <div class="addressForm">
                                            <input type="radio" class="addRadio" name="isDefault" value="${a.addressNo}" 
                                                onclick="setDefaultAddress(${a.addressNo})"
                                                <c:if test="${a.isDefault eq 'Y'}">checked</c:if>>
                                            <span class="addrtitle">${a.addressName} &nbsp; </span><span style="color: gray;">(기본 배송지)</span><br>
                                            <div class="addrDetail">                                                <span class="addrSpan">${a.addressOther}</span>
                                                <br>
                                                <br>
                                                <span class="addrSpan">${a.receiverName}</span><br>
                                                <span class="addrSpan">${a.receiverPhone}</span><br>
                                            </div>
                                            <div style="display: flex;" class="btnset">
                                                <!-- 수정 버튼 -->
                                                <button type="button" class="btnsetButton" onclick="openEditModal('${a.addressNo}', '${a.addressName}' ,'${a.receiverName}', '${a.addressOther}', '${a.receiverPhone}')">
                                                    수정하기
                                                </button>
                                                <form method="post" action="../deliveryAddress/delete">
                                                    <input type="hidden"  name="addressNo" value="${a.addressNo}">
                                                    <button type="submit" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);" class="btnsetButton">삭제하기</button>
                                                </form>
                                            </div>
                                            <!-- 삭제 버튼-->
                                            
                                        </div>
                                    </c:forEach>
                                    <c:forEach var="w" items="${notDefaultDelivery}">
                                        <div class="addressForm">
                                            <input type="radio" class="addRadio" name="isDefault" value="${w.addressNo}" 
                                                onclick="setDefaultAddress(${w.addressNo})"
                                                <c:if test="${w.isDefault eq 'Y'}">checked</c:if>>
                                            <span class="addrtitle">${w.addressName}</span><br>
                                            <div class="addrDetail">
                                                <span class="addrSpan">${w.addressOther}</span>
                                                <br>
                                                <br>
                                                <span class="addrSpan">${w.receiverName}</span><br>
                                                <span class="addrSpan">${w.receiverPhone}</span><br>
                                            </div>
                                            <div style="display: flex;" class="btnset">
                                                <!-- 수정 버튼 -->
                                                <button type="button" class="btnsetButton" onclick="openEditModal('${w.addressNo}', '${w.addressName}' ,'${w.receiverName}', '${w.addressOther}', '${w.receiverPhone}')">
                                                    수정하기
                                                </button>
                                                <form method="post" action="../deliveryAddress/delete">
                                                    <input type="hidden"  name="addressNo" value="${a.addressNo}">
                                                    <button type="submit" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);" class="btnsetButton">삭제하기</button>
                                                </form>
                                            </div>
                                            <!-- 삭제 버튼-->
                                            
                                        </div>
                                    </c:forEach>
                                        
                                </c:when>
                                    <c:otherwise>
                                        <div style="height: 500px; text-align: center;" >
                                            <span style="margin-left: 250px; color: gray; font-size: 20px;">
                                                등록된 배송지가 없습니다.
                                            </span>
                                            <br>
                                        </div>
                                    </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                
                <!-- 페이지네이션은 필요 시 주석 해제 -->
                <%-- 
                <div class="pagination">
                    <c:choose>
                        <c:when test="${pi.currentPage > 1}">
                            <a href="?page=${pi.currentPage - 1}" class="pageBtn">&lt;</a>
                        </c:when>
                        <c:otherwise>
                            <span class="pageBtn">&lt;</span>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="i">
                        <c:choose>
                            <c:when test="${i == pi.currentPage}">
                                <span class="pageBtn" style="background-color: azure;">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="?page=${i}" class="pageBtn">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pi.currentPage < pi.maxPage}">
                            <a href="?page=${pi.currentPage + 1}" class="pageBtn">&gt;</a>
                        </c:when>
                        <c:otherwise>
                            <span class="pageBtn">&gt;</span>
                        </c:otherwise>
                    </c:choose>
                </div>
                --%>
            </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />

<div id="editModal">
    <div class="modalTitle" align="center">배송지 수정</div>
    <form id="editForm" style="margin-top: 30px;" align="center" method="post" action="../deliveryAddress/update">
        <input type="hidden" class="modalInput" name="addressNo" id="modalAddressNo">

        <label class="modalLabel">배달지명</label><br>
        <input style="margin-bottom: 20px;" type="text" class="modalInput" name="addressName" maxlength="10" id="modalAddressName" required><br>

        <label class="modalLabel">수령인</label><br>
        <input style="margin-bottom: 20px;" type="text" class="modalInput" name="receiverName" maxlength="4" id="modalReceiverName" required><br>

        <label class="modalLabel" >주소</label><br>
        <input style="margin-bottom: 6px !important; " type="text" class="modalInput"  name="addressOther" maxlength="66" id="modalAddressOther"><br>
        <input type="button" class="btnSubmit" onClick="execDaumPostcode()" value="주소검색"><br>

        <label class="modalLabel">상세주소</label><br>
        <input style="margin-bottom: 20px;" type="text" class="modalInput" name="addressDetail" maxlength="66" id="modalAddressDetail"><br>

        <label class="modalLabel">연락처</label><br>
        <input style="margin-bottom: 20px;" type="text" class="modalInput" name="receiverPhone" maxlength="11" id="modalReceiverPhone" required><br><br>

        <button class="modalbtn" type="submit">수정하기</button>

        <button class="modalbtn" type="button" onclick="closeEditModal()">취소</button>
    </form>
</div>

<!-- 모달 배경 -->
<div id="modalBackdrop" style="display: none; position: fixed; top: 0; left: 0;
     width: 100%; height: 100%; background-color: rgba(0,0,0,0.3); z-index: 999;"
     onclick="closeEditModal()">
</div>
<script>
  function addDelivery(){
    location.href = "../deliveryAddress/newAddress";
  }

function submitForm(action) {
    const form = document.getElementById('deliveryForm');
    if (action == 'update') {

        form.action = '../deliveryAddress/update';

    } else if (action == 'delete') {

        form.action = '../deliveryAddress/delete';
    }
    form.submit();
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById("modalAddressOther").value = data.roadAddress;
        }
    }).open();
}

// 배송지 영역을 클릭하면 실행할 함수
document.querySelectorAll(".addressForm").forEach(form => {
    form.addEventListener("click", function (e) {
      // 수정/삭제 버튼 클릭은 제외
      if (e.target.tagName == "BUTTON" || e.target.closest("button")) return;

      // 라디오 버튼 찾아서 클릭
      const radio = form.querySelector(".addRadio");
      if (radio) {
        radio.checked = true;

    const addressNo = radio.value;
    setDefaultAddress(addressNo);
    }
});
});


// 라디오버튼이 클릭 될 때 마다 실행할 함수
function setDefaultAddress(addressNo) {

    const form = document.createElement('form');
    form.method = 'post';
    form.action = '../deliveryAddress/setDefault';

    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'addressNo';
    input.value = addressNo;
    form.appendChild(input);

    document.body.appendChild(form);

    form.submit();
  }

  // 모달창에 내용 띄우기
  function openEditModal(addressNo, addressName ,receiverName, addressOther, receiverPhone) {
    
    // 주소 나누기위한 선언
    const parts = addressOther.split('+');
    const address = parts[0] ? parts[0].trim() : '';
    const addressDetail = parts[1] ? parts[1].trim() : '';

    document.getElementById('modalAddressNo').value = addressNo;
    document.getElementById("modalAddressName").value = addressName;
    document.getElementById('modalReceiverName').value = receiverName;
    document.getElementById('modalAddressOther').value = address;
    document.getElementById('modalAddressDetail').value = addressDetail;
    document.getElementById('modalReceiverPhone').value = receiverPhone;

    document.getElementById('editModal').style.display = 'block';
    document.getElementById('modalBackdrop').style.display = 'block';
}

function closeEditModal() {
    document.getElementById('editModal').style.display = 'none';
    document.getElementById('modalBackdrop').style.display = 'none';
}

</script>

</body>
</html>