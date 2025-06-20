<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
        .container{
            width: 1200px;
            margin: auto;
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
            width: 800px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            background-color: aliceblue;
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

        .inputStyle{
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            border: none;
            width: 250px;
            height: 30px;
            margin: 5px;
            font-family: 'MaruBuriSemiBold';
        }

        .btnStyle{
            width: 200px;
            height: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            margin: 10px;
            cursor: pointer;
            border-radius: 8px;
            font-family: 'MaruBuriSemiBold';
        }
        
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
    <div class="container">
            <div class="" id="myTitle">
                비밀번호 변경
            </div>
            <div class="" id="content">
                <div class="" id="left-Menu">
                    <img width="150px" src="/soyo/resources/images/real-soyo-logo.png" alt="">
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
                    padding: 15px; font-family: 'MaruBuriSemiBold';">비밀번호 변경</div>
                    <form action="../member/updatePwd" align="center" method="post" onsubmit="return checkUpdatePwd()">
                        <table>
                            <tr style="display: none;">
                                <th width="200px">아이디</th>
                                <td width="400px">${ sessionScope.loginUser.memberId }</td>
                            </tr>
                            <tr>
                                <th width="200px">현재 비밀번호</th>
                                <td width="400px"><input class="inputStyle" type="password" name="originPwd"></td>
                            </tr>
                            <tr>
                                <th>변경할 비밀번호</th>
                                <td><input type="password" class="inputStyle" name="updatePwd"></td>
                            </tr>
                            <tr>
                                <th>비밀번호 확인</th>
                                <td><input type="password" class="inputStyle" name="checkPwd"></td>
                            </tr>
                            <tr height="40px">
                                <th></th>
                                <td><span style="color: red;" id="informationMsg"></span></td>
                            </tr>
                        </table>

                        <div>
                            <button type="submit" class="btnStyle">변경하기</button>
                            <button type="button" class="btnStyle" onclick="history.back();">취소</button>
                        </div>
                        
                    </form>
                        
                    
                </div>
            </div>
        </div>
    
    <jsp:include page="../common/footer.jsp" />
<script>



    function checkUpdatePwd(){

        // 입력값 담기
        let updatePwd = document.querySelector("input[name='updatePwd']").value;
        let checkPwd = document.querySelector("input[name='checkPwd']").value;

        // 안내문구를 띄우기 위한 함수 준비 및 초기화
        const informationMsg = document.getElementById("informationMsg");
        informationMsg.textContent = "";

        // 정규 표현식 영문,숫자,특수기호를 포함한 8글자 이상
        const pwdCondition = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/;

        // 새 비밀번호와 비밀번호 확인창이 비어있을경우
        if(!updatePwd || !checkPwd){
            // document.getElementById("informationMsg").value("비밀번호를 모두 입력해주세요.")
            informationMsg.textContent = "변경할 비밀번호와 비밀번호 확인 모두 입력해주세요."
            return false;
        }

        // 새 비밀번호가 정규표현식에 맞게 작성되었는지 확인하는 구문
        if(!pwdCondition.test(updatePwd)){
            informationMsg.textContent = "영문, 숫자, 특수문자를 포함한 8글자 이상이어야 합니다."
            return false;

        }

        // 새 비밀번호와 비밀번호확인의 값이 같은지 비교 후 결과보내기
        if(updatePwd != checkPwd) {
            
            //alert("비밀번호가 일치하지 않습니다.");
            informationMsg.textContent = "새 비밀번호와 비밀번호 확인이 일치하지 않습니다"

            return false;
        } else {
            return confirm("비밀번호를 변경하시겠습니까?");
        }  
        
    }
</script>
</body>
</html>