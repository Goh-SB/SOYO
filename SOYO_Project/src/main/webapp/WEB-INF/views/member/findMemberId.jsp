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
    }

    .container{
        width: 1200px;
        margin: auto;
        height: 800px;
    }

    #findIdContent {
        width: 800px;
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
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="container">
	<div id="findIdContent">
        아이디 찾기
        <div id="findIdform">
            <div><span>이동하세용</span></div>
            <div><a href="../member/newMemberPwd">이동을해요</a></div>
            <div class="enrollform">
                <form action="../member/findId" method="post">
                    <table>
                        <tr>
                            <th>이름</th>
                            <td><input name="memberName" type="text"></td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input id="birth" name="birthDate" type="date"></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input name="email" type="text"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input name="phone" type="text"></td>
                            
                        </tr>
                        <tr>
                            <th></th>
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