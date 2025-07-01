<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품</title>
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
    <div id="content">
        <div id="left-Menu">
            <jsp:include page="../member/leftMenu.jsp" />
        </div>

        <div id="myContent">

            <div class="myWishList">
            	<c:choose>
            		<c:when test="${not empty myRecent}">
		                <form action="../member/wishGo" method="post">
		                    <table class="wishTable">
		                        <tr>
		                            
		                            <th style="width: 85px;"></th>
		                            <th style="width: 520px;"></th>
		                            <th style="width: 80px;"></th>
		                            <th style="width: 70px;"></th>
		                        </tr>
		                        <c:forEach var="r" items="${myRecent}" varStatus="status">
		                            <tr>
		                                
		                                <td><img class="productImg" src="http://192.168.40.32:8100/soyo/resources/product_upfile/${r.productChange}" alt=""></td>
		                                <td><span>${r.productName}</span></td>
		                                <td><span>${r.productPrice} 원</span></td>
		                                <td>
		                                    <a href="../product/productDetail?no=${r.productNo}">상세보기</a>
		                                </td>
		                            </tr>
		                        </c:forEach>
		                    </table>
		                </form>
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