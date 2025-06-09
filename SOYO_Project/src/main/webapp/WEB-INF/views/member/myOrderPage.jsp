<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문 목록</title>
<style>

        
        /*
        div{
            border: 1px solid black;
            box-sizing: border-box;
        }
            */
        

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

        #left-Menu{
            width: 160px;
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
            width: 95%;
            
        }

        #left-MenuList a{
            text-decoration: none;
            color: gray;
            display: block;
            width: 95%;
            /* border: 1px solid lightgray; */
            
        }

        #myContent{
            width: 85%;
            height: 100%;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
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
        img{
            width: 140px;
            height: 140px;
            border-radius: 5px;
        }

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

        td > button{
            width: 150px;
            height: 40px;
            cursor: pointer;
        }

        td > button:hover{
            background-color: rgba(126, 93, 158, 0.518);
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
                <ul id="left-MenuList">
                    <li><a href="">주문/배송조회</a></li>
                    <li><a href="">찜한 상품</a></li>
                    <li><a href="myPage-myrivew.html">내 리뷰</a></li>
                    <li><a href="">배송지 관리</a></li>
                    <li><a href="../member/myInformation">내 정보</a></li>
                    <li><a href="">최근 본 상품</a></li>
                </ul>
            </div>
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px;
                padding: 15px;">내 주문 목록</div>
                    <div id="order-List">
                        <ul>
                            <li>
                                <table class="order-table">
                                    <tr>
                                        <th>25.06.25 주문</th>
                                        <td colspan="2">배송중</td>
                                    </tr>
                                    <tr>
                                        <td class="product-img"><img src="image/coffee.png" alt=""></td>
                                        <td class="product-name">상품이름</td>
                                        <td class="product-menu"><button>상세조회</button>
                                            <button>반품 신청</button>
                                            <button>리뷰 작성</button>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            <li>
                                <table class="order-table">
                                    <tr>
                                        <th>25.06.25 주문</th>
                                        <td colspan="2">배송중</td>
                                    </tr>
                                    <tr>
                                        <td class="product-img"><img src="image/coffee.png" alt=""></td>
                                        <td class="product-name">상품이름 + 상품옵션 + 수량</td>
                                        <td class="product-menu"><button>상세조회</button>
                                            <button>교환, 반품 신청</button>
                                            <button>리뷰 작성</button>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            <li>
                                <table class="order-table">
                                    <tr>
                                        <th>25.06.25 주문</th>
                                        <td colspan="2">배송중</td>
                                    </tr>
                                    <tr>
                                        <td class="product-img"><img src="image/coffee.png" alt=""></td>
                                        <td class="product-name">상품이름</td>
                                        <td class="product-menu"><button>상세조회</button>
                                            <button>교환, 반품 신청</button>
                                            <button>리뷰 작성</button>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            <li>
                                <table class="order-table">
                                    <tr>
                                        <th>25.06.25 주문</th>
                                        <td colspan="2">배송중</td>
                                    </tr>
                                    <tr>
                                        <td class="product-img"><img src="image/coffee.png" alt=""></td>
                                        <td class="product-name">상품이름</td>
                                        <td class="product-menu"><button>상세조회</button>
                                            <button>교환, 반품 신청</button>
                                            <button>리뷰 작성</button>
                                        </td>
                                    </tr>
                                </table>
                            </li>
                        </ul>
                        <div id="page">
		                    <button>&lt;</button>
		                    <button>1</button>
		                    <button>2</button>
		                    <button>&gt;</button>
		                </div>
                    </div> 
            </div>
        </div>
    </div>
    <br>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>