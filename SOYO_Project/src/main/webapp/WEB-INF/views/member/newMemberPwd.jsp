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


    #findIdContent > button{
        width: 170px;
        height: 50px;
        border-radius: 8px;
        margin-top: 20px;
        cursor: pointer;
        
    }

    #findIdContent > span{
        font-size: 25px;
        color: #546E7A;
        
    }

    .container{
        width: 1200px;
        margin: auto;
        height: 800px;
    }

    #findIdContent {
        width: 500px;
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
        width: 500px;
        height: 600px;
        border: 3px solid #B0BEC5;
        background-color: rgba(255, 255, 255, 0.851);
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
        width: 30%;
        border-top-left-radius: 20px;
        border-top-right-radius: 9px;
        border-top: 3px solid lightgray;
        border-left: 3px solid lightgray;        
        height: 70px;
        background-color: rgba(113, 141, 150, 0.377);
        color: aliceblue;
    }
    .findId a{
        display: block;
        width: 100%;
        height: 100%;
        padding-top: 10px;
        color: lightcyan;
    }

    .findId a:hover{
        background-color: gray;
        border-top-left-radius: 15px;
        border-top-right-radius: 8px;
    }

    .findPwd{
        width: 70%;
        border-top-right-radius: 20px;
        border-top-left-radius: 8px;
        border: 3px solid lightgray;
        height: 70px;
        padding-top: 10px;
        background-color: rgb(245, 255, 254);
    }

    /* 이메일 인증 버튼 */
    .validateBtn{
        width: 70%;
        height: 50px;
        font-size: 20px;
        margin-top: 20px;
        background-color: lightcyan;
        color: #546E7A;
        border: 3px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    /* 인증번호 발급버튼 */
    #sert{
        width: 400px;
        height: 50px;
        font-size: 20px;
        background-color: lightcyan;
        color: #546E7A;
        border: 3px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    .submitBtnTr{
        padding-top: 20px;
        
    }

    /* 찾기버튼 */
    .submitBtn{
        width: 70%;
        font-size: 20px;
        background-color: lightcyan;
        color: #546E7A;
        border: 3px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    #submitMsg{
        font-size: 25px;
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
    <style>
    @keyframes spin {
        0% { transform: rotate(0deg);}
        100% { transform: rotate(360deg);}
    }
    #loadingOverlay {
        display: none; /* 기본적으로 숨김 */
    }

</style>
</head>
<body>
<div id="loadingOverlay" style="position:fixed; z-index:9999; top:0; left:0; width:100vw; height:100vh; background:rgba(0,0,0,0.4); align-items:center; justify-content:center;">
  <div style="background:white; padding:40px 60px; border-radius:16px; box-shadow:0 4px 24px rgba(0,0,0,0.15); display:flex; flex-direction:column; align-items:center;">
    <div class="spinner" style="width:48px; height:48px; border:6px solid #eee; border-top:6px solid #667eea; border-radius:50%; animation:spin 1s linear infinite;"></div>
    <div style="margin-top:18px; color:#333; font-size:1.1rem;">요청 처리 중입니다...</div>
  </div>
</div>
<jsp:include page="../common/menubar.jsp" />
<br><br>

<div class="container">
	<div id="findIdContent">
        
        <div id="findIdform">
            <div class="findId"><a href="../member/findMemberId" class="fontGowunD">ID 찾기</a></div>
            <div class="findPwd"><span class="fontGowunD">비밀번호 찾기</span></div>
            <div class="enrollform">
                <form action="../member/changePwd" method="post" onsubmit="return changeMemberPwd()">
                    <table class="formTable">
                        <tr>
                            <td><span style="font-size: 30px;" class="fontGowunD">비밀번호 찾기</span></td>
                        </tr>
                        <tr>
                            <td><input name="memberId" type="text" class="fontGowunB" placeholder="아이디" maxlength="20" required></td>
                        </tr>
                        <tr>

                            <td><input id="email" name="email" class="fontGowunB" type="email" maxlength="30" placeholder="이메일" required></td>
                            
                        </tr>
                        <tr>
                            <td><button style="cursor: pointer;" type="button" id="sert" class="fontGowunB" onclick="cert()">인증번호 발급</button></td>
                        </tr>

                        <!-- style="display: none;" -->
                        <tr style="display: none;">
                            <td><input type="text" id="emailCheck" maxlength="10" class="fontGowunB" placeholder="인증번호"><br><button type="button" style="cursor: pointer;" class="validateBtn fontGowunB" id="validate" onclick="valid();">인증</button></td>
                        </tr>
                        <tr>
                            <td colspan="3"><span style="box-shadow: none;" id="submitMsg" class="fontGowunB"></span></td>
                        </tr>
                        <tr>
                            <td class="submitBtnTr" colspan="3"><button style="cursor: pointer;" class="submitBtn fontGowunB" type="submit">찾기</button></td>
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

function showLoading() {
    document.getElementById('loadingOverlay').style.display = 'flex';
}

function hideLoading() {
    document.getElementById('loadingOverlay').style.display = 'none';
}

// 이메일 인증번호 발급을 위한 함수
function cert() {
    let email = $("#email").val();

    const emailCheck = document.getElementById("emailCheck");
    const emailTr = emailCheck.parentElement.parentElement; // tr 태크 지목

    if(email == "" || !email.includes("@")){
        submitMsg.textContent = "유효한 이메일을 입력해주세요"
        return false;
    }
    showLoading();
    $.ajax({
        url : "../member/cert",
        type : "post",
        data : { email : email },
        success : function(result) {
            hideLoading();
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
            hideLoading();
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