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
                <div>
                    내 배송지
                    <div class="myWishList">
                        <c:choose>
                            <c:when test="${not empty myDelivery}">
                                <form action="../deliveryAddres/" method="post">
                                    <table>
                                        <tr>
                                            <th>이름</th>
                                            <th>주소</th>
                                            <th>수령인</th>
                                        </tr>
                                        <c:forEach var="d" items="${myDelivery}" varStatus="status">

                                            <tr>
                                                <td>${d.addressName}</td>
                                                <td>${d.addressOther}</td>
                                                <td>${d.receiverName}</td>
                                            </tr>
        
                                        </c:forEach>
                                    </table>
                                </form>
                                
                                    
                                
                                
                            </c:when>
                                <c:otherwise>
                                    <div style="height: 500px; text-align: center;" >
                                        <span>
                                            등록된 배송지가 없습니다.
                                        </span>
                                        <br>
                                        <button type="button">배송지 등록</button>
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
<script>
    // 체크박스 전체선택
    document.getElementById("checkAll").addEventListener("change", function () {

    const onCheckBox = document.querySelectorAll(".itemCheckbox");

    onCheckBox.forEach(cb => cb.checked = this.checked);

  });

  // 체크박스 전체 해제
    const offCheckBox = document.querySelectorAll(".itemCheckbox");

    offCheckBox.forEach(cb => {

        cb.addEventListener("change", function () {

        const allChecked = [...offCheckBox].every(cb => cb.checked);

        document.getElementById("checkAll").checked = allChecked;

    });
  });
</script>
</body>
</html>