<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 새로 받기</title>
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
        비밀번호 재설정
        <div id="findIdform">
            <div><a href="../member/findMemberId">이동을해요</a></div>
            <div>이동을할가요</div>
            <div class="enrollform">
                <form action="../member/findId" method="post">
                    <table>
                        <tr>
                            <th>아이디</th>
                            <td><input name="memberName" type="text"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input id="email" name="email" type="email" maxlength="30"></td>
                            <td><button type="button" id="sert" onclick="cert()">인증번호 발급</button></td>
                        </tr>
                        <tr style="display: none;">
                            <th>인증번호</th>
                            <td><input type="text" id="emailCheck"></td>
                            <td><button type="button" id="validate" onclick="valid();">인증</button></td>
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
let goInsert = 0;

// 비밀번호    
const memberPwd = document.getElementById("memberPwd");

// 비밀번호 확인
const memberPwdCheck = document.getElementById("memberPwdCheck");

// 비밀번호 메세지
const pwdMsg = document.getElementById("pwdMsg");
const pwdMsgTd = pwdMsg.parentElement; // td 태그 선택

// 비밀번호 확인 메세지
const checkPwdMsg = document.getElementById("checkPwdMsg");
const checkPwdMsgTd = checkPwdMsg.parentElement; // td태그 선택

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


</script>
</body>
</html>