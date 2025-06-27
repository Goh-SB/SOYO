<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- jquery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 도로명주소 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 이메일 인증 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap');
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background: url('/soyo/resources/images/soyo-bg.jpg') no-repeat center center fixed;
        background-size: cover;
        min-height: 100vh;
        margin: 0;
    }

    .container {
        max-width: 480px;
        margin: 40px auto;
        margin-top: 110px;
        padding: 0 20px;
    }

    .page-title {
        text-align: center;
        margin-bottom: 20px;
        color: white;
        font-size: 2rem;
        font-weight: 700;
        text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

    .form-container {
        background: rgba(255, 255, 255, 0.97);
        border-radius: 20px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.08);
        padding: 40px 30px 30px 30px;
        margin-bottom: 40px;
    }

    .form-header {
        text-align: center;
        margin-bottom: 25px;
    }

    .form-title {
        font-size: 1.5rem;
        font-weight: 700;
        color: #333;
        margin-bottom: 5px;
    }

    .form-subtitle {
        color: #666;
        font-size: 0.9rem;
        font-weight: 400;
    }

    .form-grid, .form-column {
        display: block;
    }

    .form-group {
        margin-bottom: 22px;
        width: 100%;
    }

    .form-group.full-width {
        grid-column: 1 / -1;
    }

    .form-label {
        display: block;
        font-weight: 500;
        color: #333;
        margin-bottom: 7px;
        font-size: 1rem;
        width: 100%;
    }

    .input-group {
        display: flex;
        gap: 8px;
        align-items: center;
        width: 100%;
    }

    .input-field {
        width: 100%;
        min-width: 0;
        padding: 14px 16px;
        border: 2px solid #e1e5e9;
        border-radius: 10px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: white;
        color: #333;
        box-sizing: border-box;
    }

    .input-group .input-field {
        flex: 1 1 0;
    }

    .btn {
        padding: 14px 0;
        border: none;
        border-radius: 10px;
        font-size: 1rem;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        width: 120px;
        min-width: 120px;
        text-align: center;
    }

    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.15);
    }

    .btn-secondary {
        background: #f8f9fa;
        color: #666;
        border: 2px solid #e1e5e9;
    }

    .btn:disabled {
        opacity: 0.6;
        cursor: not-allowed;
        transform: none !important;
    }

    .radio-group {
        display: flex;
        gap: 20px;
        align-items: center;
        padding: 8px 0;
    }

    .radio-item {
        display: flex;
        align-items: center;
        gap: 6px;
        cursor: pointer;
    }

    .radio-item input[type="radio"] {
        width: 18px;
        height: 18px;
        accent-color: #667eea;
    }

    .radio-item label {
        font-size: 1rem;
        color: #333;
        cursor: pointer;
    }

    .message {
        font-size: 0.9rem;
        margin-top: 5px;
        padding: 8px 12px;
        border-radius: 8px;
        display: none;
    }

    .message.error {
        background: #fee;
        color: #e74c3c;
        border: 1px solid #fadbd8;
    }

    .message.success {
        background: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }

    .form-actions {
        display: flex;
        gap: 15px;
        justify-content: center;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #e1e5e9;
    }

    .form-actions .btn {
        min-width: 100px;
        padding: 12px 25px;
    }

    .hidden {
        display: none !important;
    }

    /* 반응형 디자인 */
    @media (max-width: 600px) {
        .container {
            max-width: 98vw;
            padding: 0 5vw;
        }
        .form-container {
            padding: 20px 5vw;
        }
        .btn {
            width: 100%;
            min-width: 0;
        }
        .form-actions {
            flex-direction: column;
        }
    }

    /* 애니메이션 효과 */
    .form-container {
        animation: slideUp 0.6s ease-out;
    }

    @keyframes slideUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .input-field.error {
        border-color: #e74c3c;
        box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.1);
    }

    .input-field.success {
        border-color: #27ae60;
        box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.1);
    }
</style>
<script>
// 도로명주소
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById("address").value = data.roadAddress;
        }
    }).open();
}

</script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="container">
    
    <div class="form-container">
        <div class="form-header">
            <h2 class="form-title">소요 - 회원가입</h2>
            <p class="form-subtitle">모든 항목은 필수로 입력해주세요</p>
        </div>
        
        <form id="myinsertForm" action="../member/insert" method="post" onsubmit="return insertMember()">
            <div class="form-grid">
                <!-- 왼쪽 열 -->
                <div class="form-column">
                    <!-- 아이디 -->
                    <div class="form-group">
                        <label class="form-label">아이디</label>
                        <div class="input-group">
                            <input type="text" class="input-field" name="memberId" maxlength="20" placeholder="영문, 숫자를 포함한 6~20 글자" required>
                            <button type="button" class="btn btn-primary" onclick="checkId();">중복확인</button>
                        </div>
                    </div>

                    <!-- 비밀번호 -->
                    <div class="form-group">
                        <label class="form-label">비밀번호</label>
                        <input type="password" class="input-field" id="memberPwd" name="memberPwd" placeholder="영문, 숫자, 특수기호를 포함한 8 ~ 20글자" maxlength="20" required>
                        <div id="pwdMsg" class="message hidden"></div>
                    </div>

                    <!-- 비밀번호 확인 -->
                    <div class="form-group">
                        <label class="form-label">비밀번호 확인</label>
                        <input type="password" class="input-field" id="memberPwdCheck" name="memberPwdCheck" maxlength="20" required>
                        <div id="checkPwdMsg" class="message error hidden">비밀번호가 다릅니다.</div>
                    </div>

                    <!-- 이름 -->
                    <div class="form-group">
                        <label class="form-label">이름</label>
                        <input type="text" name="memberName" class="input-field" maxlength="9" required>
                    </div>

                    <!-- 성별 -->
                    <div class="form-group">
                        <label class="form-label">성별</label>
                        <div class="radio-group">
                            <div class="radio-item">
                                <input id="genderM" name="gender" type="radio" value="M" required>
                                <label for="genderM">남성</label>
                            </div>
                            <div class="radio-item">
                                <input id="genderF" name="gender" type="radio" value="F" required>
                                <label for="genderF">여성</label>
                            </div>
                            <div class="radio-item">
                                <input id="genderX" name="gender" type="radio" value="X" required>
                                <label for="genderX">선택 안 함</label>
                            </div>
                        </div>
                    </div>

                    <!-- 생년월일 -->
                    <div class="form-group">
                        <label class="form-label">생년월일</label>
                        <input name="birthDate" class="input-field" type="date" required>
                    </div>
                </div>

                <!-- 오른쪽 열 -->
                <div class="form-column">
                    <!-- 이메일 -->
                    <div class="form-group">
                        <label class="form-label">이메일</label>
                        <div class="input-group">
                            <input id="email" class="input-field" name="email" type="email" maxlength="30" placeholder="이메일 주소를 입력하세요">
                            <button type="button" class="btn btn-primary" id="sert" onclick="cert()">인증번호 발급</button>
                        </div>
                        <div id="emailCheckGroup" class="input-group hidden" style="margin-top: 8px;">
                            <input type="text" class="input-field" id="emailCheck" placeholder="인증번호를 입력하세요">
                            <button type="button" class="btn btn-primary" id="validate" onclick="valid();">인증</button>
                        </div>
                        <div id="emailMsg" class="message hidden"></div>
                    </div>

                    <!-- 전화번호 -->
                    <div class="form-group">
                        <label class="form-label">전화번호</label>
                        <input name="phone" class="input-field" type="text" placeholder="- 없는 11자리 숫자" maxlength="11" required>
                    </div>

                    <!-- 주소 -->
                    <div class="form-group">
                        <label class="form-label">주소</label>
                        <div class="input-group">
                            <input type="text" id="address" class="input-field" name="address" maxlength="66" placeholder="주소를 검색하세요" required>
                            <button type="button" class="btn btn-primary" onClick="execDaumPostcode()">주소검색</button>
                        </div>
                    </div>

                    <!-- 상세주소 -->
                    <div class="form-group">
                        <label class="form-label">상세주소</label>
                        <input type="text" id="addrDetail" class="input-field" name="addrDetail" maxlength="66" placeholder="상세주소를 입력하세요">
                    </div>
                </div>
            </div>

            <!-- 제출 메시지 -->
            <div id="submitMsg" class="message hidden"></div>

            <!-- 버튼 그룹 -->
            <div class="form-actions">
                <button type="submit" class="btn btn-primary" disabled>가입하기</button>
                <button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
            </div>
        </form>
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

// 비밀번호 확인 메세지
const checkPwdMsg = document.getElementById("checkPwdMsg");

// 정규표현식 영어,숫자,특수문자를 포함한 8글자 이상
const pwdCondition = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/;

// 제출버튼 입력시 보여줄 문구를 띄우기 위한 함수
const submitMsg = document.getElementById("submitMsg");
submitMsg.textContent = "";

// 이메일 안내문구 출력용
const emailMsg = document.getElementById("emailMsg");
emailMsg.textContent = "";

// 메시지 표시 함수
function showMessage(element, message, type) {
    element.textContent = message;
    element.className = `message ${type}`;
    element.style.display = 'block';
}

function hideMessage(element) {
    element.style.display = 'none';
}

// 이메일 인증번호 발급을 위한 함수
function cert() {
    let email = $("#email").val();

    const emailCheck = document.getElementById("emailCheck");
    const emailCheckGroup = document.getElementById("emailCheckGroup");

    if(email == "" || !email.includes("@")){
        showMessage(emailMsg, "유효한 이메일을 입력해주세요", "error");
        return false;
    }

    $.ajax({
        url : "../member/cert",
        type : "post",
        data : { email : email },
        success : function(result) {

            alert(result);

            // 숨겨져있던 인증 요소 활성화 및 이메일 입력관련 요소 비활성화
            emailCheckGroup.classList.remove("hidden");

            $("#emailCheck").val("").attr("disabled", false);
            $("#validate").attr("disabled", false);

            $("#email").attr("readonly", true);
            $("#sert").attr("disabled", true);
            hideMessage(emailMsg);
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
                hideMessage(emailMsg);
                $("#emailCheck").attr("readonly", true);
                $("#validate").attr("disabled", true);
                showMessage(emailMsg, "인증성공", "success");
                goInsert = 1;
                
                
            } else {
                
                // 재인증을 위해 초기화
                $("#emailCheck").val("").attr("disabled", true);
                $("#validate").attr("disabled", true);
                
                $("#email").val("").attr("readonly", false);
                $("#sert").attr("disabled", false);
                goInsert = 0;
                showMessage(emailMsg, "인증실패", "error");
            }
            
        }, 
        error : function() {
            
            console.log("인증번호 확인용 ajax 통신 실패!");	
        }
    });
			
}

// 비밀번호칸을 벗어났을때 실행할 이벤트
memberPwd.addEventListener("blur", function(){

    // 정규표현식 검사
    if(!pwdCondition.test(memberPwd.value)){
        // 정규 표현식에 안맞을 경우
        showMessage(pwdMsg, "조건에 맞지 않은 비밀번호입니다. (영문, 숫자, 특수문자를 포함한 8글자 이상)", "error");
        memberPwd.classList.add("error");
        memberPwd.classList.remove("success");

    } else {

        showMessage(pwdMsg, "올바른 비밀번호입니다.", "success");
        memberPwd.classList.remove("error");
        memberPwd.classList.add("success");

    }

});

// 비밀번호 확인창을 벗어났을때 실행할 이벤트
memberPwdCheck.addEventListener("blur", function(){
    
    if(memberPwd.value != memberPwdCheck.value){
        // 만약 비밀번호가 다르다면
        checkPwdMsg.style.display = "block";
        memberPwdCheck.classList.add("error");
        memberPwdCheck.classList.remove("success");
    } else {
        // 같다면
        checkPwdMsg.style.display = "none";
        memberPwdCheck.classList.remove("error");
        memberPwdCheck.classList.add("success");
    }
});

// 아이디 중복확인 버튼 클릭시
function checkId(){
	
    let $memberId = $("#myinsertForm input[name=memberId]");
	
	$.ajax({
		url : "../member/checkId",
		type : "get",
		data : {
			checkId : $memberId.val()
		},
		success : function(result){
			
            // 아이디가 빈 문자열이거나 정규표현식에 맞지 않을경우
            if(result == "NNNNT"){
                alert("조건에 맞는 아이디를 입력해주세요.\n(영문, 숫자를 포함한 6~20 글자)");
                
                    // 아이디 재입력
                    $memberId.addClass("error");
                    
            } else {

                if(result == "NNNNN"){
                    
                    alert("이미 사용중이거나 탈퇴한 회원의 아이디 입니다.");
                
                    // 아이디 재입력
                    $memberId.addClass("error");
                } else {
                    
                    if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
                        
                        // 수정 못하게 읽기 전용으로
                        $memberId.attr("readonly", true);
                        
                        // 테두리 되돌리기
                        $memberId.removeClass("error").addClass("success");
                        
                        // 회원가입 버튼 키기
                        $("#myinsertForm button[type=submit]").removeAttr("disabled");

                    } else {
                        // 아이디 입력창 테두리 색칠하기
                        $memberId.addClass("error");
                    }
                }
            }
			
		},
		error : function() {
			
			console.log("ajax 로그인 실패")
		}
	});
	
}

// 회원가입 버튼을 눌렀을 때 실행할 함수
function insertMember(){
    
    
    if(memberPwd.value != memberPwdCheck.value){
        // 비밀번호와 비밀번호 확인 값이 다르다면
        showMessage(submitMsg, "비밀번호가 다릅니다.", "error");
        return false;
    }

    if(!memberPwd.value || !memberPwdCheck.value){
        // 비밀번호와 비밀번호 확인창이 비어있을경우
        showMessage(submitMsg, "비밀번호를 입력해주세요.", "error");
        return false;
    }

    if(!pwdCondition.test(memberPwd.value)){
        // 비밀번호가 정규표현식에 맞게 작성되었는지 확인
        showMessage(submitMsg, "조건에 맞춰 비밀번호를 입력해주세요.", "error");
        return false;
    } 

    if(goInsert != 1){
        showMessage(submitMsg, "이메일 인증을 해주세요.", "error");
        return false;
    } else {
        return confirm("회원가입 하시겠습니까?")
    }

    // 나머지는 존재여부만 체크하기 vs reqiurd로 때우기인데..흠


}

</script>
</body>
</html>