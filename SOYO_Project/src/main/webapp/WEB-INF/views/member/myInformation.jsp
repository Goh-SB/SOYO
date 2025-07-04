<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<style>
        body{
            background-color: #f8f9fa;
        }

	    .container{
            width: 1200px;
            margin: auto;
        }

        #content::after {
            content: "";
            display: block;
            clear: both;
        }

        @font-face {
            font-family: 'MaruBuriSemiBold';
            src: url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-SemiBold.eot);
            src: url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-SemiBold.eot?#iefix) format("embedded-opentype"), url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-SemiBold.woff2) format("woff2"), url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-SemiBold.woff) format("woff"), url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-SemiBold.ttf) format("truetype");
        }

        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        #myTitle{
            width: 1500px;
            height: 120px;
            font-size: 40px;
            text-align: center;
            vertical-align: middle;
            line-height: 120px;
        }

        #content{
            width: 1500px;
             /* 여기 조절하기 */
            margin-top: 30px;
        }

        #content>div{
            float: left;
            display: block;
        }

        #myContent{
            width: 770px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0 2px 9px rgba(0,0,0,0.1);
            border-radius: 15px;
            background-color: white;
            margin: 30px;
            margin-left: 30px;
            margin-top: 40px;
            padding-bottom: 13px;
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
        
        .goUpdate{
        	width: 100px;
        	height: 40px;
        	margin-top: 30px;
        	margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            cursor: pointer;
            background-color: aliceblue;
            border-radius: 10px;
            margin-left: 10px;
            padding-top: 3px;
        }

        .fontsize20{
            font-size: 15px;
            color: rgb(43, 62, 115);
            font-family: 'LINESeedKR-Bd';
        }

        .fontsize10{
            font-size: 21px;
            color: rgb(43, 62, 115);
            font-family: 'MaruBuriSemiBold';
        }

        .infomationTitle{
            background: linear-gradient(135deg, #f3e8f9 0%, #e7dcf4 100%);
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            font-size: 25px;
            height: 63px;
            padding-top: 12px;
            font-weight: bold;
            color: #7e4f8b85;
            font-family: 'LINESeedKR-Bd';
        }

        .fontbold{
            color: #7e4f8b85;
            font-weight: bold;
            font-size: 18px;
            display: block;
            margin-bottom: 15px !important;
        }

    #left-Menu{
        margin-top: 40px;
        margin-left: 20px;
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br>
<div class="container">
        <div class="" id="content">
            <div class="" id="left-Menu">
                <jsp:include page="leftMenu.jsp" />
            </div>
            <div class="" id="myContent" align="center">
                <div class="infomationTitle">My Information
                </div>
                <div style="width: 600px; text-align: left; padding: 5px; margin-top: 30px; word-wrap: break-word;" align="center" >
                    
                        <span>아이디 : </span>
                        <span class="fontsize10">${ sessionScope.loginUser.memberId }</span>
                        <br><br>
                        <hr>
                        <br>
                        <span class="fontbold">기본 정보</span>
                        <label for="">이름 : </label>
                        <span class="fontsize10">${ sessionScope.loginUser.memberName }</span><br>
                        <label for="">생년월일 : </label>
                        <span class="fontsize10">${ sessionScope.loginUser.birthDate }</span><br>
                        <label for="">성별 :</label> &nbsp;
                        <span class="fontsize10">
                            <c:choose>
                                <c:when test="${ sessionScope.loginUser.gender =='M'}">남</c:when>
                                <c:when test="${ sessionScope.loginUser.gender =='F'}">여</c:when>
                                <c:otherwise>선택안함</c:otherwise>
                            </c:choose>
                        </span>
                        <br><br>
                        <hr>
                        <br>
                        <span class="fontbold">연락처 정보</span>
                        <label for="">이메일 : </label>
                        <span class="fontsize10">${ sessionScope.loginUser.email }</span><br>
                        <label for="">전화번호 : </label>
                        <span class="fontsize10">
                            ${fn:substring(sessionScope.loginUser.phone, 0, 3)}&nbsp;-
                            ${fn:substring(sessionScope.loginUser.phone, 3, 7)}&nbsp;-
                            ${fn:substring(sessionScope.loginUser.phone, 7, 11)}
                        </span>
                        <br><br>
                        <hr>
                        <br>
                        <span class="fontbold">주소</span>
                        <span class="fontsize10">${ sessionScope.loginUser.address }</span>
                        <br>
                </div>
                <div>
                    <button type="button" class="goUpdate fontsize20" onclick="updatePage();">수정하기</button>
                    <button type="button" class="goUpdate fontsize20" onclick="updatePwd();">비밀번호 변경</button>
                    <button type="button" class="goUpdate fontsize20" onclick="deletePage();">회원탈퇴</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script>
        function updatePage() {
            location.href = "../member/memberUpdateForm";
        }

        function deletePage() {
            location.href = "../member/memberDeleteForm";
        }

        function updatePwd() {
            location.href = "../member/memberPwdUpdateForm";
        }
    </script>
</body>
</html>