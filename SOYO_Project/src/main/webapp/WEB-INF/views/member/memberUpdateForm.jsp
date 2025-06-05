<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 변경</title>
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
            height: 800px; /* 여기 조절하기 */
        }

        #content>div{
            float: left;
            display: block;
        }

        #left-Menu{
            width: 180px;
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
            width: 166px;
            
        }

        #left-MenuList a{
            text-decoration: none;
            color: gray;
            display: block;
            width: 170px;
            /* border: 1px solid lightgray; */
            
        }

        #myContent{
            width: 900px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
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
        
        #buttondiv button{
        	width: 100px;
        	height: 30px;
        	margin-top: 30px;
        	margin-bottom: 30px;
            
        }

        table{
            text-align: left;
            margin: auto;
        }

        td>input {
            width: 300px;
            height: 40px;
            margin-top: 15px;
            font-size: 15px;
            padding: 5px;
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
                    <li><a href="../member/myOrderPage">주문/배송조회</a></li>
                    <li><a href="">찜한 상품</a></li>
                    <li><a href="">내 리뷰</a></li>
                    <li><a href="">배송지 관리</a></li>
                    <li><a href="../member/myInformation">내 정보</a></li>
                    <li><a href="">최근 본 상품</a></li>
                </ul>
            </div>
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; text-align: center;
                padding: 15px;">내 정보 변경</div>
                <form id="myupdate-form" action="../member/update" method="post" align="center">
                    <table>
                        
                        <tr>
                        	<td colspan="2"><input type="hidden" name="memberId" value="${ sessionScope.loginUser.memberId }" ></td>
                        </tr>
                        <tr>
                            <th width="200px">이름</th>
                            <td width="400px"><input name="memberName" type="text" value="${ sessionScope.loginUser.memberName }" ></td>
                        </tr>
                        <tr>
                        	<th>성별</th>
                        	<td style="padding: 10px; font-size: 17px;">
                        		<input name="gender" type="radio" style="width: 20px; height: 20px;" value="M">&nbsp;남
                                <input name="gender" type="radio" style="width: 20px; height: 20px; margin-left: 50px;" value="F">&nbsp;여
                        	</td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input name="birthDate" type="date" value="${ sessionScope.loginUser.birthDate }" ></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input name="email" type="email" value="${ sessionScope.loginUser.email }" ></td>
                        </tr>
                        <tr>
                            <th>휴대전화번호</th>
                            <td><input name="phone" type="text" value="${ sessionScope.loginUser.phone }" ></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input name="address" type="text" value="${ sessionScope.loginUser.address }" ></td>
                        </tr>
                    
                    </table>

                    <div id="buttondiv">
                        <button type="submit">수정완료</button>
                    </div>
                    
                </form>
                    
                
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</body>
</html>