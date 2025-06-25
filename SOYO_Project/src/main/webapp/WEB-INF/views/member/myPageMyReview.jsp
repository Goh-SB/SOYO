<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰</title>
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

            #order-List{
            height: 95%;
            
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

        /* 주문목록 */

        .product-name{
            width: 60%;
        }

        .product-menu{
            width: 15%;
        }

        .product-img{
            width: 25%;
            padding-top: 10px;
        }

        #page{

            text-align: center;
            margin-top: 20px;
        }


        /*주문목록*/
        .ordercontent{
            width: 100%;
            float: left;
        }

        .order-wrap{
            width: 100%;
            height: 100%;
        }

        .product-menu > button{
            width: 100%;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            background-color: rgba(175, 128, 219, 0.518);
        }

        .ratingbar{
            color: gold;
        }

        #page > button{
            width: 30px;
            height: 35px;
        }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<div class="container">
        <div class="" id="myTitle">
            마이페이지
        </div>
        <div class="" id="content">
            <div class="" id="left-Menu">
            <jsp:include page="leftMenu.jsp" />
            </div>
        <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px;
                padding: 15px;">내 리뷰</div>
                    <div id="order-List">
                    	<c:forEach var="r" items="${myreview}">
                        <ul>
                            <li>
                                <table class="order-table">
                                    <tr>
                                        <th>${r.productName}</th>
                                        <td>
                                        	<span class="ratingbar">
				                               <c:forEach begin="1" end="5" var="i">
				                                   <c:choose>
				                                       <c:when test="${i <= r.rating}">★</c:when>
				                                       <c:otherwise>☆</c:otherwise>
				                                   </c:choose>
				                               </c:forEach>
				                           </span>
				                           &nbsp;&nbsp;&nbsp;
				                           ${r.reviewTitle}
                                        </td>
                                        <td>
                                        	${r.reviewDate}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="product-img"><img src="${r.reviewThumbnailChange}" alt=""></td>
                                        <td class="product-name"><span>${r.reviewContent}</span></td>
                                        <td class="product-menu">
                                            <button>리뷰상세 보기</button>
                                            <button>리뷰 삭제</button>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                        </c:forEach>
                    </div>
                <div id="page">
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