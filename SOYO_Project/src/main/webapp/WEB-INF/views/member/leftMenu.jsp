<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
     <img width="150px" src="/soyo/resources/images/real-soyo-logo.png" alt="">
     <ul id="left-MenuList">
         <li><a href="../member/myOrderPage">주문/배송조회</a></li>
         <li><a href="../member/myPageMyReview">내 리뷰</a></li>
         <li><a href="">배송지 관리</a></li>
         <li><a href="../member/myInformation">내 정보</a></li>
         <li><a href="">최근 본 상품</a></li>
     </ul>
</body>
</html>