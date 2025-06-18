<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>

    @font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }

    /* 고운 바탕 이동용버튼과 제목 */
    @font-face {
    font-family: 'GowunBatang-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }

    body {
        padding-top: 70px;
        background-image: url('/soyo/resources/images/findId.png');
    }

    .container{
        width: 1200px;
        margin: auto;
        height: 800px;
    }

    #findIdContent {
        width: 600px;
        margin: auto;
        text-align: center;
        margin-top: 80px;

    }

    #findIdform {
        margin: auto;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    #findIdform > *{
        text-align: center;
        vertical-align: middle;
        box-sizing: border-box;
        float: left;
        
    }

    .enrollform{
        clear: both;
        width: 100%;
        height: 600px;
        border: 3px solid lightgray;
        background-color: rgba(255, 255, 255, 0.851);
        border-bottom-left-radius: 8px;
        border-bottom-right-radius: 8px;
    }

    .formTable{
        width: 100%;
        font-size: 20px;
        padding: 10px;
        height: 500px;
        padding-top: 50px;
        
    }

    .findId{
        width: 70%;
        border-top-left-radius: 20px;
        border-top-right-radius: 8px;
        border: 3px solid lightgray;
        background-color: rgb(245, 255, 254);
        height: 70px;
        padding-top: 10px;
    }

    .findPwd{
        width: 30%;
        border-top-right-radius: 20px;
        border-top-left-radius: 8px;
        border: 3px solid lightgray;
        height: 70px;
        background-color: rgba(113, 141, 150, 0.377);
        color: lightcyan;
    }

    .findPwd a {
        display: block;
        width: 100%;
        height: 100%;
        padding-top: 10px;
    }

    .findPwd a:hover{
        background-color: gray;
        border-top-right-radius: 16px;
        border-top-left-radius: 7px;
    }

    #submitBtn{
        background-color: lightcyan;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        color: #546E7A;
        border: 3px;
        font-size: 20px;
        width: 400px;
        font-family: 'GowunDodum-Regular';
    }

    .fontGowunB{
        font-family: 'GowunDodum-Regular';
        width: 400px;
        height: 50px;
        padding: 10px;
        margin-top: 20px;
        border-radius: 8px;
        font-size: 19px;
        border: none;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    .fontGowunD{
        font-family: 'GowunBatang-Regular';
        font-size: 25px;
        color: #546E7A;
        text-decoration: none;
    }


</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<br><br>
<div class="container">
	<div id="findIdContent">
        
        <div id="findIdform">
            <div class="findId"><span class="fontGowunD">ID 찾기</span></div>
            <div class="findPwd"><a href="../member/newMemberPwd" class="fontGowunD" style="color: lightcyan;">비밀번호 찾기</a></div>
            <div class="enrollform">
                <form action="../member/findId" method="post">
                    <table class="formTable">
                        <tr>
                            <td style="font-size: 25px;"><span class="fontGowunD" style="font-size: 30px;">ID 찾기</span></td>
                        </tr>
                        <tr>
                            <td><input name="memberName" class="fontGowunB" type="text" placeholder="이름" required></td>
                            
                        </tr>
                        <tr>
                            <td><input id="birth" name="birthDate" class="fontGowunB" type="date" placeholder="생년월일" required ></td>
                        </tr>
                        <tr>
                            <td><input name="email" class="fontGowunB" type="email" placeholder="이메일" required></td>
                        </tr>
                        <tr>
                            <td><input name="phone" class="fontGowunB" type="text" placeholder="- 없는 전화번호" required></td>
                            
                        </tr>
                        <tr>
                            <td><button type="submit" style="cursor: pointer;" class="fontGowunB" id="submitBtn">찾기</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
<script>
    
</script>
</body>
</html>