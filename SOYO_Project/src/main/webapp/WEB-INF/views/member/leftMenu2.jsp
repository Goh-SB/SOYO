<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        @font-face {
            font-family: 'NanumSquareRound';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        #left-Menu{
            width: 160px;
            font-family: 'NanumSquareRound';
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
            margin-top: 8px;
            /* border: 1px solid lightgray; */
            
        }

        .soyo-logo-wrapper {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f5f6fa 60%, #e3e6ec 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 18px 0 #c7b6e6a0, 0 0 0 0 #fff0;
            animation: floatSoyo 4s ease-in-out infinite;
            margin: 18px auto 18px auto;
            position: relative;
            border: 1.5px solid #e0e0e0;
        }
        .soyo-logo-wrapper img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #fff;
            border: 1px solid #e0e0e0;
            box-shadow: 0 0 8px 0 #e0d6f880;
            object-fit: cover;
        }
        @keyframes floatSoyo {
            0%   { transform: translateY(0px) scale(1);}
            50%  { transform: translateY(-8px) scale(1.02);}
            100% { transform: translateY(0px) scale(1);}
        }
</style>
</head>
<body>
    <div class="soyo-logo-wrapper">
        <img src="/soyo/resources/images/real-soyo-logo.png" alt="">
    </div>
     <ul id="left-MenuList">
         <li><a href="../myOrderPage">주문/배송조회</a></li>
         <li><a href="../../deliveryAddress/myDeliveryList">배송지 관리</a></li>
         <li><a href="../myInformation">내 정보</a></li>
         <li><a href="../myPageMyReview">내 리뷰</a></li>
         <li><a href="../../recent/myRecent">최근 본 상품</a></li>
     </ul>
</body>
</html>