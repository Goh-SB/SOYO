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

        @font-face {
            font-family: 'NanumSquareRound';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
            font-weight: normal;
            font-style: normal;
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

        #myContent {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 500px;
            width: 750px;
            box-sizing: border-box;
            box-shadow: 0 8px 32px rgba(60, 80, 120, 0.13), 0 1.5px 4px rgba(0,0,0,0.08);
            border-radius: 18px;
            background: #fafdff;
            margin-left: 55px;
            padding: 28px 40px 60px 40px;
            border: 1.5px solid #e3e8f0;
            transition: box-shadow 0.2s, border 0.2s;
        }
        #myContent:hover {
            box-shadow: 0 12px 32px rgba(0,0,0,0.13), 0 2px 8px rgba(0,0,0,0.10);
        }
        #myContent form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
        #myContent table {
            width: 40%;
            border-collapse: separate;
            border-spacing: 0 28px;
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 4px 24px rgba(60, 80, 120, 0.10);
            border: 1.5px solid #e3e8f0;
            margin: 0 auto;
            padding: 24px 32px;
            align-self: center;
        }
        #myContent tr {
            display: block;
            width: 100%;
            margin-bottom: 32px;
        }
        #myContent tr:last-child {
            margin-bottom: 0;
        }
        #myContent th, #myContent td {
            display: block;
            width: 100%;
            text-align: left;
            padding: 0;
        }
        #myContent th {
            text-align: left !important;
            color: #222;
            font-family: 'NanumSquareRound';
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 11px;
            height: auto;
            line-height: 1.2;
        }
        #myContent td {
            margin-bottom: 0;
        }
        #myContent .inputStyle {
            width: 360px;
            height: 44px;
            border: 1.5px solid #e3e8f0;
            border-radius: 8px;
            background: #fff;
            font-size: 15px;
            padding: 0 14px;
            box-shadow: none;
            margin: 0;
            font-family: 'NanumSquareRound';
            transition: border 0.2s;
            display: block;
        }
        #myContent .inputStyle:focus {
            border: 1.5px solid #b993d6;
            outline: none;
            background: #faf7ff;
        }
        #myContent .inputStyle::placeholder {
            color: #b0b0b0;
            font-size: 14px;
            font-family: 'NanumSquareRound';
        }
        #myContent .btn-area {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 16px;
            width: 100%;
            margin-top: 18px;
            margin-bottom: 4px;
        }
        #myContent .btnStyle {
            width: 130px;
            height: 38px;
            font-size: 15px;
            padding: 8px 0;
            background: linear-gradient(90deg, #f6eaff 0%, #e3d6f7 100%);
            color: #7a5fa4;
            font-weight: bold;
            letter-spacing: 1px;
            border-radius: 8px;
            border: 1.5px solid #e3d6f7;
            box-shadow: 0 2px 8px rgba(185,147,214,0.08);
            transition: background 0.2s, box-shadow 0.2s, color 0.2s;
            font-family: 'NanumSquareRound';
            cursor: pointer;
        }
        #myContent .btnStyle:hover {
            background: linear-gradient(90deg, #e3d6f7 0%, #f6eaff 100%);
            box-shadow: 0 4px 16px rgba(185,147,214,0.16);
            color: #fff;
            border-color: #b993d6;
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
            font-family: 'NanumSquareRound';
        }

        .btnStyle{
            width: 200px;
            height: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            margin: 10px;
            cursor: pointer;
            border-radius: 8px;
            font-family: 'NanumSquareRound';
        }
        
        #myContent .table-center-wrap {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100%;
            width: 100%;
            min-height: 420px;
        }
        #myContent table {
            margin: 0 auto;
        }
        #myContent th, #myContent td {
            text-align: center;
        }
        #myContent .inputStyle {
            margin: 0 auto;
            display: block;
        }
        #myContent .btn-area {
            justify-content: center;
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
                    <jsp:include page="leftMenu.jsp" />
                </div>
                <div class="" id="myContent">
                    <div style="height: 5%; font-size: 30px; text-align: center;
                    padding: 15px; font-family: 'NanumSquareRound';">비밀번호 변경</div>
                    <form action="../member/updatePwd" method="post" onsubmit="return checkUpdatePwd()">
                        <div class="table-center-wrap">
                            <table>
                                <tr style="display: none;">
                                    <th width="200px">아이디</th>
                                    <td width="360px">${ sessionScope.loginUser.memberId }</td>
                                </tr>
                                <tr>
                                    <th width="200px">현재 비밀번호</th>
                                    <td width="360px"><input class="inputStyle" type="password" maxlength="20" name="originPwd" placeholder="현재 비밀번호"></td>
                                </tr>
                                <tr>
                                    <th>변경할 비밀번호</th>
                                    <td width="360px"><input type="password" maxlength="20" class="inputStyle" name="updatePwd" placeholder="영문, 숫자, 특수기호를 포함한 8 ~ 20글자"></td>
                                </tr>
                                <tr>
                                    <th>비밀번호 확인</th>
                                    <td width="360px"><input type="password" maxlength="20" class="inputStyle" name="checkPwd" placeholder="비밀번호 확인"></td>
                                </tr>
                                <tr height="20px">
                                    <th></th>
                                    <td><span style="font-size: 14px; color: red;" id="informationMsg"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center; vertical-align: middle;">
                                        <div class="btn-area">
                                            <button type="submit" class="btnStyle">변경하기</button>
                                            <button type="button" class="btnStyle" onclick="history.back();">취소</button>
                                        </div>
                                    </td>
                                </tr>
                            </table>
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