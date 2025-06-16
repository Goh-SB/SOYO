<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 새로 받기</title>
<!-- jquery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 도로명주소 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 이메일 인증 스크립트 -->

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
        border: none;
    }

    button{
        width: 170px;
        height: 50px;
        border-radius: 8px;
        margin-top: 20px;
    }

    span{
        font-size: 25px;
        color: #546E7A;
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
        border: 3px solid #B0BEC5;
        background-color: #C3AED6;
        border-bottom-left-radius: 8px;
        border-bottom-right-radius: 8px;
    
    }


    .formTable{
        width: 100%;
        font-size: 20px;
        padding: 10px;
        height: 550px;
        padding-top: 50px;
    }

    .findId{
        width: 50%;
        border-top-left-radius: 9px;
        border-top: 3px solid #C3AED6;
        border-left: 3px solid #C3AED6;        
        height: 70px;
    }
    .findId a{
        display: block;
        width: 100%;
        height: 100%;
        padding-top: 10px;
    }

    .findId a:hover{
        background-color: #901dca45;
        border-top-left-radius: 8px;
    }

    .findPwd{
        width: 50%;
        border-top-right-radius: 8px;
        border: 3px solid #C3AED6;
        height: 70px;
        padding-top: 10px;
        background-color: #EADCF1;
    }

    /* 이메일 인증 버튼 */
    .validateBtn{
        width: 70%;
        height: 50px;
        font-size: 20px;
        margin-top: 20px;
        background-color: #6C5B7B;
        border-color: #901dca45;
        color: #F8F1FF;
    }

    /* 인증번호 발급버튼 */
    #sert{
        width: 70%;
        height: 50px;
        font-size: 20px;
        background-color: #6C5B7B;
        border-color: #901dca45;
        color: #F8F1FF;
    }

    .submitBtnTr{
        padding-top: 20px;
        
    }

    /* 찾기버튼 */
    .submitBtn{
        width: 70%;
        font-size: 20px;
        background-color: #6C5B7B;
        border-color: #901dca45;
        color: #F8F1FF;
    }

    #submitMsg{
        font-size: 19px;
    }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<br><br>
<div class="container">
	<div id="findIdContent">
        
        <div id="findIdform">
            <div class="findId"><a href="../member/findMemberId">ID 찾기</a></div>
            <div class="findPwd"><span>비밀번호 찾기</span></div>
            <div class="enrollform">
                <form action="../member/changePwd" method="post" onsubmit="return changeMemberPwd()">
                    <table class="formTable">
                        <tr>
                            <td><span>비밀번호 찾기</span></td>
                        </tr>
                        <tr>
                            <td><input name="memberId" type="text" placeholder="아이디" required></td>
                        </tr>
                        <tr>

                            <td><input id="email" name="email" type="email" maxlength="30" placeholder="이메일" required></td>
                            
                        </tr>
                        <tr>
                            <td><button type="button" id="sert" onclick="cert()">인증번호 발급</button></td>
                        </tr>

                        <!-- style="display: none;" -->
                        <tr style="display: none;">
                            <td><input type="text" id="emailCheck" placeholder="인증번호"><br><button type="button" class="validateBtn" id="validate" onclick="valid();">인증</button></td>
                        </tr>
                        <tr>
                            <td colspan="3"><span id="submitMsg"></span></td>
                        </tr>
                        <tr>
                            <td class="submitBtnTr" colspan="3"><button class="submitBtn" type="submit">찾기</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
<script>
let goInsert = 0;

// 이메일 인증번호 발급을 위한 함수
function cert() {
    let email = $("#email").val();

    const emailCheck = document.getElementById("emailCheck");
    const emailTr = emailCheck.parentElement.parentElement; // tr 태크 지목

    if(email == "" || !email.includes("@")){
        submitMsg.textContent = "유효한 이메일을 입력해주세요"
        return false;
    }

    $.ajax({
        url : "../member/cert",
        type : "post",
        data : { email : email },
        success : function(result) {

            alert(result);

            // 숨겨져있던 인증 요소 활성화 및 이메일 입력관련 요소 비활성화
            $("#emailCheck").closest("tr").css("display", "table-row");

            $("#emailCheck").val("").attr("disabled", false);
            $("#validate").attr("disabled", false);

            $("#email").attr("readonly", true);
            $("#sert").attr("disabled", true);
            submitMsg.textContent = "";
        },
        error : function() {

            console.log("인증번호 발급용 ajax 실패");
        }
    });
}

// 인증 버튼을 눌렀을 때 실행할 함수
function valid() {
			
    // 사용자가 입력했었던 이메일 주소와 인증번호를 변수에 담기
    let email = $("#email").val();
    let emailCheck = $("#emailCheck").val();

    $.ajax({
        url : "../member/validate",
        type : "post", 
        data : {
            email : email,
            emailCheck : emailCheck
        },
        success : function(result) {
            
            if(result == "인증성공") {
                submitMsg.textContent = "";
                $("#emailCheck").attr("readonly", true);
                $("#validate").attr("disabled", true);
                submitMsg.textContent = "인증성공";
                goInsert = 1;
                console.log(goInsert);
                
            } else {
                
                // 재인증을 위해 초기화
                $("#emailCheck").val("").attr("disabled", true);
                $("#validate").attr("disabled", true);
                
                $("#email").val("").attr("readonly", false);
                $("#sert").attr("disabled", false);
                goInsert = 0;
                submitMsg.textContent = "인증실패";
            }
            
        }, 
        error : function() {
            
            console.log("인증번호 확인용 ajax 통신 실패!");	
        }
    });
			
}

function changeMemberPwd(){
    
    if(goInsert != 1){
        submitMsg.textContent = "이메일 인증을 해주세요."
        return false;
    } else {
        return confirm("비밀번호가 임의로 재설정됩니다. 변경하시겠습니까?")
    }

    // 나머지는 존재여부만 체크하기 vs reqiurd로 때우기인데..흠


}

</script>
</body>
</html>