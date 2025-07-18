<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품</title>
<style>

    body{
        background-color: #f8f9fa;
    }

    @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
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

    #myTitle {
        width: 1000px;
        height: 120px;
        font-size: 40px;
        text-align: center;
        vertical-align: middle;
        line-height: 120px;
    }

    #content {
        width: 1000px;
        margin-top: 20px;
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
        width: 91px;
        height: 91px;
        border-radius: 15px;
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

    .recentContent{
        width: 970px;
        margin: 50px;
        background-color: white;
        border-radius: 15px;
        margin-left: 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .recentTitle{
        height: 50px;
        background: linear-gradient(135deg, #f3e8f9 0%, #e7dcf4 100%);
        border-top-right-radius: 15px;
        border-top-left-radius: 15px;
        height: 63px;
        padding-top: 10px;
        font-size: 25px;
        color: #7e4f8b85;
    }

    .wishTable{
        padding: 10px;
        border-radius: 15px;
        box-shadow: 0 2px 7px rgba(0,0,0,0.1);
        margin: 20px;
        margin-left: 40px;
        margin-right: 40px;
        transition: transform 0.4s ease;
        border: 2px solid lightgrey;
    }

    .wishTable:hover{
        border: 2px solid rgb(105, 105, 255);
        transform: translateY(2px);
    }

    .resultText{
        width: 250px;
    }

    .resultImg{
        width: 200px;
    }

    .fontsize{
        font-size: 20px;
    }

    .border1px{
        border: 2px solid lightgrey;
        background-color: #f8f9fa;
        font-size: 20px;
        width: 130px;
        height: 100px;
        padding-top: 30px;
        border-radius: 15px;
    }

    #left-Menu{
        margin-top: 50px;
        margin-left: 20px;
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br>

<div class="container">
    <div id="content">
        <div id="left-Menu">
            <jsp:include page="../member/leftMenu.jsp" />
        </div>

        <div id="myContent">

            <div class="myWishList">
            	<c:choose>
            		<c:when test="${not empty myRecent}">
                        <div class="recentContent" align="center">
                            <div class="recentTitle" align="center"><label for="" style="font-family: 'LINESeedKR-Bd';">Recent</label></div>
                            <form action="../member/wishGo" method="post" style="padding-bottom: 20px;">
                                <c:forEach var="r" items="${myRecent}" varStatus="status">
                                    <a href="../product/productDetail?no=${r.productNo}" style="text-decoration: none; color: inherit;">
                                        <div class="wishTable" style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                                            
                                            <div class="resultImg">
                                                <img class="productImg" src="http://192.168.40.32:8100/soyo/resources/product_upfile/${r.productChange}" alt="">
                                            </div>
                                            <div class="resultText">
                                                <span class="fontsize">${r.productName}</span>
                                            </div>
                                            
                                            <div class="resultText">
                                                <span class="fontsize">
												  <fmt:formatNumber value="${r.productPrice}" type="number" groupingUsed="true" /> 원
												</span>
                                            </div>
                                            <div class="border1px">
                                                <span>${r.viewDate}</span>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </form>
                        </div>
	                </c:when>
	                <c:otherwise>
	                	<div style="height: 500px; text-align: center;" >
		                	<span>
		                		최근 본 상품이 없습니다.
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
</body>
</html>