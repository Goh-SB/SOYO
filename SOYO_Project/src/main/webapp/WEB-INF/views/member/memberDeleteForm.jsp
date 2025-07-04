<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 배송지 관리</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>

    body{
        background-color: #f8f9fa;
    }

    @font-face {
        font-family: 'GowunDodum-Regular';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
        font-weight: normal;
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

    #title{
        text-align: center;
        height: 63px;
        font-size: 20px;
        background: linear-gradient(135deg, #f3e8f9 0%, #e7dcf4 100%);
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        color: #7e4f8b85;
        font-weight: bold;
    }

    .fontspan{
        display: inline-block;
        padding-top: 10px;
        margin: auto;
        font-size: 25px;
    }

    #myContent{
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin: 50px;
        border-radius: 15px;
        background-color: white;
        width: 770px;
        margin-left: 30px;
        margin-top: 40px;
    }

    #content {
        width: 1500px;
        margin-top: 30px;
    }

    #content > div {
        float: left;
        display: block;
    }

    .myWishList {
        width: 600px;
        min-height: 400px;
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        padding-top: 15px;
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

    .addressForm{
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        border: 2px solid lightgrey;
        border-radius: 15px;
        width: 900px;
        padding: 8px;
        margin: auto;
        margin-bottom: 20px;
        transition: transform 0.4s ease;
        margin-left: 40px;
    }

    .addressForm:hover {
        border: 2px solid rgb(105, 105, 255);
        transform: translateY(-2px);
    }

    .addBtn{
        height: 30px;
        display: block;
        margin-left: 40px;
        margin-bottom: 15px;
        border-radius: 9px;
        width: 200px;
        border: none;
        cursor: pointer;
        background: linear-gradient(135deg, #f2adfa 0%, #e2daff 100%);
        border: 1px solid rgb(247, 213, 255);
        color: white;
        font-size: 14px;
        font-weight: bold;
    }

    .addBtn:hover{
        box-shadow: 0 2px 10px rgba(251, 230, 255, 0.817);
        background-color: rgb(247, 213, 255);
        color: #7e4f8b85;
    }

    .addrSpan{
        margin: 8px;
        margin-left: 15px;
    }

    .btnset{
        margin-left: 680px;
        margin-bottom: 10px;
    }

    .btnsetButton{
        margin-left: 10px;
        width: 70px;
        height: 30px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 9px;
        cursor: pointer;
    }

    .btnsetButton:hover{
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .addrtitle{
        font-weight: bold;
        font-size: 17px;
        color: #442a4be2;
    }

    .addrDetail{
        border: 2px solid rgba(211, 211, 211, 0.362);
        border-radius: 5px;
        margin-bottom: 15px;
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        padding: 10px;
        padding-bottom: 15px;
    }


        /* 모달창 디자인 */


    #aa {
        padding-bottom: 30px;
        padding-top: 12px;
    }

    .titleSpan{
        margin-top: 20px;
    }

    #left-Menu{
        margin-top: 40px;
        margin-left: 20px;
    }

    .resultcontent{
        margin-bottom: 30px;
        margin-top: 30px;
        
    }

    .fontGR{
        font-family: 'GowunDodum-Regular';
    }

    .inputPwd{
        width: 330px;
        height: 40px;
        border-radius: 8px;
        box-shadow: 0 2px 7px rgba(0,0,0,0.1);
        border: 2px solid lightgrey;
        padding: 5px;
        font-size: 20px;
    }

    .btnSubmit{
        width: 140px;
        height: 30px;
        margin-left: 10px;
        margin-right: 10px;
        font-weight: bold;
        color: white;
        font-size: 15px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
    }

    .btnSubmit:hover{
        border: 3px solid white;
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
                <div id="title"><span class="fontspan">회원탈퇴</span></div>
                    <div id="aa" align="center">
                        <div class="myWishList">
                            <form id="mydeleteForm" action="../member/delete" align="center" method="post" onsubmit="return deleteUser()">
                                <div class="resultcontent">

                                    <span style="font-size: 25px;" class="fontGR">현재 접속중인 아이디 : ${ sessionScope.loginUser.memberId }</span><br>
                                </div>
                                <div class="resultcontent">
                                    <span style="font-size: 20px;" class="fontGR">비밀번호</span><br>
                                    <input class="inputPwd" type="password" name="userPwd" maxlength="20">
                                </div>                           
                                <div class="resultcontent">
                                    <button class="fontGR btnSubmit" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);" type="submit">탈퇴하기</button>
                                    <button class="fontGR btnSubmit" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);"" type="button" onclick="history.back();">취소</button>
                                </div>
                                
                            </form>
                        </div>
                    </div>
            </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />

</div>
<script>
function deleteUser(){
        return confirm("회원을 탈퇴하시겠습니까?");
    }
</script>

</body>
</html>