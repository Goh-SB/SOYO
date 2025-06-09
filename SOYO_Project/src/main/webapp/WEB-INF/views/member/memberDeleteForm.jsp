<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
        
        #goUpdate{
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
            cursor: default;
        }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="container">
        <div class="" id="myTitle">
            회원탈퇴
        </div>
        <div class="" id="content">
            <div class="" id="left-Menu">
                <ul id="left-MenuList">
                    <li><a href="../member/myOrderPage">주문/배송조회</a></li>
                    <li><a href="">찜한 상품</a></li>
                    <li><a href="">내 리뷰</a></li>
                    <li><a href="">배송지 관리</a></li>
                    <li><a href="">내 정보</a></li>
                    <li><a href="">최근 본 상품</a></li>
                </ul>
            </div>
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; text-align: center;
                padding: 15px;">회원탈퇴</div>
                <form id="mydeleteForm" action="../member/delete" align="center" method="post" onsubmit="return deleteUser()">
                    <table>
                        <tr>
                            <th width="200px">아이디</th>
                            <td width="400px">${ sessionScope.loginUser.memberId }</td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" name="userPwd"></td>
                        </tr>
                    </table>

                    <div>
                        <button type="submit">탈퇴하기</button>
                        <button type="button" onclick="history.back();">취소</button>
                    </div>
                    
                </form>
                    
                
            </div>
        </div>
    </div>
<jsp:include page="../common/footer.jsp" />
<script>
    function deleteUser(){
        return confirm("회원을 탈퇴하시겠습니까?");
    }
</script>
</body>
</html>