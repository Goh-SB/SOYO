<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>

    body {
        padding-top: 70px;
        background-image: url('/soyo/resources/images/findId.png');
    }

    input{
        width: 400px;
        height: 50px;
        padding: 10px;
        margin-top: 20px;
        border-radius: 8px;
        font-size: 19px;
    }

    button{
        width: 170px;
        height: 50px;
        margin-top: 100px;
        border-radius: 8px;
    }

    span{
        font-size: 25px;
    }

    a{
        font-size: 25px;
        text-decoration: none;
        color: inherit; 
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
        background-color: lightgray;
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
        width: 50%;
        border-top-left-radius: 8px;
        border: 3px solid lightgray;
        background-color: lightgrey;
        height: 70px;
        padding-top: 10px;
    }

    .findPwd{
        width: 50%;
        border-top-right-radius: 8px;
        border: 3px solid lightgray;
        height: 70px;
        padding-top: 10px;
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<br><br>
<div class="container">
	<div id="findIdContent">
        
        <div id="findIdform">
            <div class="findId"><span>ID 찾기</span></div>
            <div class="findPwd"><a href="../member/newMemberPwd">비밀번호 찾기</a></div>
            <div class="enrollform">
                <form action="../member/findId" method="post">
                    <table class="formTable">
                        <tr>
                            <td style="font-size: 25px;">ID 찾기</td>
                        </tr>
                        <tr>
                            <td><input name="memberName" type="text" placeholder="이름" required></td>
                            
                        </tr>
                        <tr>
                            <td><input id="birth" name="birthDate" type="date" placeholder="생년월일" required></td>
                        </tr>
                        <tr>
                            <td><input name="email" type="email" placeholder="이메일" required></td>
                        </tr>
                        <tr>
                            <td><input name="phone" type="text" placeholder="- 없는 전화번호" required></td>
                            
                        </tr>
                        <tr>
                            <td><button type="submit">찾기</button></td>
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