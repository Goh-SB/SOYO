<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<style>
    .container {
        width: 1200px;
        margin: auto;
    }

    @font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }

    @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
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
        width: 1000px;
        min-height: 500px;
        border: none;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        text-align: center;
        margin-bottom: 50px;
        padding-bottom: 30px;
        margin-left: 40px;
    }

    .productImg {
        width: 100px;
        height: 100px;
        border-radius: 10px;
        border: 3px solid lightgrey;
    }

    .wishTable {
        width: 100%;
        margin: 0px;
        padding: 0px;
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

    .title{
        background-color: rgb(252, 232, 255);
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        font-size: 25px;
        height: 60px;
        padding-top: 12px;
        font-weight: bold;
        color: #7e4f8b85;
        font-family: 'LINESeedKR-Bd';
    }

    .wishtitle{
        display: flex; 
        font-weight: bold;
        padding: 20px;
        padding-bottom: 40px;
        background-color: rgb(246, 215, 251);
        height: 50px;
    }

    .wishItem{
        width: 900px;
        margin: auto;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        height: 130px;
        border: 2px solid lightgrey;
        margin-top: 30px;
        padding-bottom: 30px;
        cursor: pointer;
        transition: transform 0.4s ease;
    }

    .wishItem:hover{
        border: 2px solid rgb(105, 105, 255);
        transform: translateY(2px);
    }

    .fontsize{
        font-size: 21px;
        color: rgb(43, 62, 115);
        font-family: 'GowunDodum-Regular';
    }

    .goBtn{
        width: 300px;
        height: 40px;
        margin-top: 50px;
        padding: 3px;
        padding-bottom: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        background-color: aliceblue;
        color: rgb(43, 62, 115);
        font-size: 20px;
        cursor: pointer;
    }

    .goBtn2{
        width: 130px;
        height: 35px;
        border-radius: 10px;
        margin-bottom: 5px;
        background-color: aliceblue;
        color: rgb(43, 62, 115);
        font-size: 15px;
        border: none;
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .tagA{
        border: 2px solid lightgray;
        border-radius: 10px;
        text-decoration: none;
        padding: 10px;
        background-color: aliceblue;
        font-size: 15px;
        font-family: 'GowunDodum-Regular';
    }


</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br><br><br>

<div class="container">
<br><br><br>
    <div id="content">
        <div id="left-Menu">
            <jsp:include page="../member/leftMenu.jsp" />
        </div>

        <div id="myContent">
            
            <div class="myWishList">
                <div class="title">내 찜 목록</div>
                <c:choose>
            		<c:when test="${not empty myWish}">
                        <form action="../member/wishGo" method="post">
                            <div class="wishtitle" style="display: flex; padding: 10px 0;">
                                <div style="width: 18%;"><input type="checkbox" id="checkAll" style="transform: scale(1.4);" />&nbsp; 전체선택</div>
                                <div style="width: 7%;">&nbsp;상품사진</div>
                                <div style="width: 35%;">상품명</div>
                                <div style="width: 15%;">가격</div>
                                <div style="width: 25%;"><button class="goBtn2" type="submit">장바구니 담기</button></div>
                            </div>

                            <c:forEach var="w" items="${myWish}" varStatus="status">
                                <div class="wishItem" style="display: flex; align-items: center; padding: 10px 0;">
                                <div style="width: 10%;">
                                    <input type="checkbox" name="selected" class="itemCheckbox" value="${status.index}" style="transform: scale(1.7);" />
                                    <input type="hidden" name="productNo${status.index}" value="${w.productNo}" />
                                    <input type="hidden" name="productSize${status.index}" value="${w.productSize}" />
                                </div>
                                <div style="width: 15%;">
                                    <img class="productImg" src="http://192.168.40.32:8100/soyo/resources/product_upfile/${w.productChange}" alt=""/>
                                </div>
                                <div class="fontsize" style="width: 35%;">
                                    ${w.productName}
                                </div>
                                <div class="fontsize" style="width: 20%;">
                                    <fmt:formatNumber value="${w.productPrice}" type="number" groupingUsed="true" /> 원
                                </div>
                                <div class="fontsize tagADiv" style="width: 20%;">
                                    <a class="tagA" href="../product/productDetail?no=${w.productNo}">상세보기</a>
                                </div>
                                </div>
                            </c:forEach>

                            <div style="margin-top: 15px;">
                                <button class="goBtn" type="submit">장바구니 담기</button>
                            </div>
                            </form>
                    </c:when>
                        <c:otherwise>
                            <div style="height: 500px; text-align: center; margin-top: 50px;" >
                                <span class="fontsize">
                                    찜한 상품이 없습니다.
                                </span>
                            </div>
                        </c:otherwise>
                </c:choose>
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

                <c:forE ach begin="${pi.startPage}" end="${pi.endPage}" var="i">
                    <c:choose>
                        <c:when test="${i == pi.currentPage}">
                            <span class="pageBtn" style="background-color: azure;">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${i}" class="pageBtn">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forE>

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


  document.addEventListener("DOMContentLoaded", function () {
    const items = document.querySelectorAll(".wishItem");

    items.forEach(function (item) {
      item.addEventListener("click", function (e) {
        // 체크박스를 찾기
        const checkbox = item.querySelector('input[type="checkbox"]');

        // input 클릭 시 클릭 이벤트 막기
        if (e.target.tagName !== 'INPUT') {
          checkbox.checked = !checkbox.checked;
        }
      });
    });
  });

</script>
</body>
</html>