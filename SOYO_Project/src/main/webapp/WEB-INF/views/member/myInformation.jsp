<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<style>
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

        #myTitle{
            width: 1200px;
            height: 120px;
            font-size: 40px;
            text-align: center;
            vertical-align: middle;
            line-height: 120px;
        }

        #content{
            width: 1200px;
             /* 여기 조절하기 */
        }

        #content>div{
            float: left;
            display: block;
        }

        #myContent{
            width: 800px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            background-color: rgba(235, 214, 255, 0.349);
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
        	width: 150px;
        	height: 40px;
        	margin-top: 30px;
        	margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            cursor: pointer;
            background-color: aliceblue;
            border-radius: 10px;
            margin-left: 10px;
        }

        .fontsize20{
            font-size: 20px;
            color: rgb(43, 62, 115);
            font-family: 'MaruBuriSemiBold';
        }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

<br><br><br>
<div class="container">
        <div class="" id="content">
            <div class="" id="left-Menu">
                <jsp:include page="leftMenu.jsp" />
            </div>
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; text-align: center;
                padding: 15px;">내 정보</div>
                <form action="" align="center">
                    <table>
                        <tr height="40px">
                            <th width="200px">아이디</th>
                            <td width="400px"><span class="fontsize20">${ sessionScope.loginUser.memberId }</span> </td>
                        </tr>
                        <tr height="40px">
                            <th>이름</th>
                            <td><span class="fontsize20">${ sessionScope.loginUser.memberName }</span> </td>
                        </tr>
                        <tr height="40px">
                        	<th>성별</th>
                        	<td style="padding: 10px; font-size: 17px; font: bold;"><span class="fontsize20">
                        		<c:choose>
                        			<c:when test="${ sessionScope.loginUser.gender =='M'}">남</c:when>
                        			<c:when test="${ sessionScope.loginUser.gender =='F'}">여</c:when>
                        			<c:otherwise>선택안함</c:otherwise>
                        		</c:choose></span>
                        	</td>
                        </tr>
                        <tr height="40px">
                            <th>생년월일</th>
                            <td><span class="fontsize20">${ sessionScope.loginUser.birthDate }</span></td>
                        </tr>
                        <tr height="40px">
                            <th>이메일</th>
                            <td><span class="fontsize20">${ sessionScope.loginUser.email }</span> </td>
                        </tr>
                        <tr height="40px">
                            <th>휴대전화번호</th>
                            <td><span class="fontsize20">${ sessionScope.loginUser.phone }</span> </td>
                        </tr>
                        <tr height="40px">
                            <th>주소</th>
                            <td><span class="fontsize20">${ sessionScope.loginUser.address }</span> </td>
                        </tr>
                        <tr height="40px">
                        	<th>가입일</th>
                        	<td><span class="fontsize20">${ sessionScope.loginUser.enrollDate }</span> </td>
                        </tr>
                    
                    </table>

                    <div>
                        <button type="button" class="goUpdate fontsize20" onclick="updatePage();">수정하기</button>
                        <button type="button" class="goUpdate fontsize20" onclick="updatePwd();">비밀번호 변경</button>
                        <button type="button" class="goUpdate fontsize20" onclick="deletePage();">회원탈퇴</button>
                    </div>
                    
                </form>
                    
                
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