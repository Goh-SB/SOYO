<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 배송지 관리</title>
<style>
    .container {
        width: 1200px;
        margin: auto;
    }

    #content::after {
        content: "";
        display: block;
        clear: both;
    }

    #myTitle {
        width: 1200px;
        height: 120px;
        font-size: 40px;
        text-align: center;
        vertical-align: middle;
        line-height: 120px;
    }

    #content {
        width: 1200px;
    }

    #content > div {
        float: left;
        display: block;
    }

    .myWishList {
        width: 800px;
        min-height: 500px;
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

    #editModal {
        width: 400px;
        height: 500px;
        display: none;
        position: fixed;
        top: 30%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: white;
        border: 1px solid #ccc;
        padding: 20px;
        z-index: 9999;
        box-shadow: 0 2px 10px rgba(0,0,0,0.3);
    }

    #editModal > *{
        text-align: center;
    }

    .addressForm{
        border: 1px solid rebeccapurple;
        width: 600px;
        margin-left: 130px;
        padding: 8px;
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br><br><br>

<div class="container">
    <div id="myTitle">내 배송지</div>

        <div id="content">
            <div id="left-Menu">
                <jsp:include page="../member/leftMenu.jsp" />
            </div>
                
            <div id="myContent">
                <button style="margin-left: 130px;" type="button" onclick="addDelivery()">배송지 등록</button>
                <div>
                    
                    <div class="myWishList">
                        <c:choose>
                            <c:when test="${not empty myDelivery}">
                                
                                <c:forEach var="a" items="${myDefaultDelivery}">
                                    <div class="addressForm">
                                        <input type="radio" name="isDefault" value="${a.addressNo}" 
                                            onclick="setDefaultAddress(${a.addressNo})"
                                            <c:if test="${a.isDefault eq 'Y'}">checked</c:if>>
                                        ${a.addressName}
                                        <div>
                                            <span>${a.addressOther}</span>
                                            <br>
                                            
                                            <span>${a.receiverName}</span><br>
                                            <span>${a.receiverPhone}</span>
                                        </div>
                                        <div style="display: flex;">
                                            <!-- 수정 버튼 -->
                                            <button type="button" onclick="openEditModal('${a.addressNo}', '${a.addressName}' ,'${a.receiverName}', '${a.addressOther}', '${a.receiverPhone}')">
                                                수정하기
                                            </button>
                                            <form method="post" action="../deliveryAddress/delete">
                                                <input type="hidden" name="addressNo" value="${a.addressNo}">
                                                <button type="submit">삭제하기</button>
                                            </form>
                                        </div>
                                        <!-- 삭제 버튼-->
                                        
                                    </div>
                                </c:forEach>
                                <c:forEach var="w" items="${notDefaultDelivery}">
                                    <div class="addressForm">
                                        <input type="radio" name="isDefault" value="${w.addressNo}" 
                                            onclick="setDefaultAddress(${w.addressNo})"
                                            <c:if test="${w.isDefault eq 'Y'}">checked</c:if>>
                                        ${w.addressName}
                                        <div>
                                            <span>${w.addressOther}</span>
                                            <br>
                                            
                                            <span>${w.receiverName}</span><br>
                                            <span>${w.receiverPhone}</span>
                                        </div>
                                        <div style="display: flex;">
                                            <!-- 수정 버튼 -->
                                            <button type="button" onclick="openEditModal('${w.addressNo}', '${w.addressName}' ,'${w.receiverName}', '${w.addressOther}', '${w.receiverPhone}')">
                                                수정하기
                                            </button>
                                            <form method="post" action="../deliveryAddress/delete">
                                                <input type="hidden" name="addressNo" value="${w.addressNo}">
                                                <button type="submit">삭제하기</button>
                                            </form>
                                        </div>
                                        <!-- 삭제 버튼-->
                                        
                                    </div>
                                </c:forEach>
                                    
                            </c:when>
                                <c:otherwise>
                                    <div style="height: 500px; text-align: center;" >
                                        <span>
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
    <form id="editForm" method="post" action="../deliveryAddress/update">
        <input type="hidden" name="addressNo" id="modalAddressNo">

        <label>주소 이름 :</label><br>
        <input type="text" name="addressName" maxlength="10" id="modalAddressName" required><br>

        <label>수령인 이름:</label><br>
        <input type="text" name="receiverName" maxlength="4" id="modalReceiverName" required><br>

        <label>주소:</label><br>
        <input type="text" name="addressOther" maxlength="66" id="modalAddressOther"><br>

        <label>상세주소</label>
        <input type="text" name="addressDetail" maxlength="66" id="modalAddressDetail"><br>

        <label>연락처:</label><br>
        <input type="text" name="receiverPhone" maxlength="11" id="modalReceiverPhone" required><br><br>

        <button type="submit">수정하기</button>

        <button type="button" onclick="closeEditModal()">취소</button>
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