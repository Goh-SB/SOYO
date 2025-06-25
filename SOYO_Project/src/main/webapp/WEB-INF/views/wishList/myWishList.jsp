<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
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
        height: 1200px; /* 여기 조절하기 */
    }

    #content>div{
        float: left;
        display: block;
    }

    .myWishList{
        width: 800px;
    }

    .productImg{
        width: 75px;
        height: 75px;
    }

    .wishTable{
        width: 700px;
    }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<div class="container">
        <div class="" id="myTitle">
            내 찜 목록
        </div>
        <div class="" id="content">
            <div class="" id="left-Menu">
            <jsp:include page="../member/leftMenu.jsp" />
            </div>
        <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; padding: 15px;">
                    내 찜
                </div>
                
                <div class="myWishList">
                    <table class="wishTable">
                        <tr>
                            <th>사진</th>
                            <th>이름</th>
                            <th>가격</th>
                            <th></th>
                        </tr>
                        <c:forEach var="w" items="${myWish}">
                            <tr>
                                <td><img class="productImg" src="http://192.168.40.32:8100/soyo/resources/product_upfile/${w.productChange}" alt=""></td>
                                <td><span>${w.productName}</span></td>
                                <td><span>${w.productPrice}</span></td>
                                <td><a href="../product/productDetail?no=${w.productNo}">상세보기</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <div id="page" align="center">
                    <button>&lt;</button>
                    <button>1</button>
                    <button>&gt;</button>
                </div>
                
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    </div>
    </div>
</body>
</html>