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
        .container{
            width: 1200px;
            margin: auto;
        }

        #myTitle{
            width: 1200px;
            height: 200px;
            font-size: 40px;
            text-align: center;
            vertical-align: middle;
        }

        #content{
            width: 1200px;
            height: 1000px; /* 여기 조절하기 */
        }

        #content>div{
            float: left;
            display: block;
        }


        #myContent{
            width: 1200px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            vertical-align: middle;
        }

        .btndivform{
            margin-top: 50px;
            margin-bottom: 50px;
        }


        table{
            text-align: left;
            margin: auto;
        }

        td>input {
            width: 400px;
            height: 40px;
            margin-top: 15px;
            font-size: 15px;
            padding: 5px;
            cursor: default;
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
        <div class="" id="myTitle">
            회원가입
        </div>
        <div class="" id="content">
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; text-align: center; margin: auto;
                padding: 15px;">회원가입</div>
                <div style="text-align: center; color: thistle;">모두 필수로 입력해주세요</div>
                <form id="myinsertForm" action="../member/insert" align="center" method="post" onsubmit="return insertMember()">
                    <table>
                        <tr>
                            <th width="200px">아이디</th>
                            <td width="500px"><input type="text" name="memberId" maxlength="20" placeholder="영문, 숫자를 포함한 6~20 글자" required></td>
                            <td width="100px"><input type="button" onclick="checkId();" style="width: 100px;" value="중복확인"></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" id="memberPwd" name="memberPwd" placeholder="영문, 숫자, 특수기호를 포함한 8 ~ 20글자" maxlength="20" required></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="2" style="display: none;"><span id="pwdMsg">올바른 비밀번호를 입력해주세요.</span></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="password" id="memberPwdCheck" name="memberPwdCheck" maxlength="20" required></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td style="display: none;"><span id="checkPwdMsg">비밀번호가 다릅니다.</span></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="memberName" maxlength="9" required></td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td style="padding: 10px; font-size: 17px;">
                        		<input id="genderM" name="gender" type="radio" style="width: 20px; height: 20px;" value="M" required>&nbsp;남
                                <input id="genderF" name="gender" type="radio" style="width: 20px; height: 20px; margin-left: 50px;" value="F" required>&nbsp;여
                        	</td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input name="birthDate" type="date" required>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input id="email" name="email" type="email" maxlength="30" required></td>
                            <td><button type="button" id="sert" onclick="cert()">인증번호 발급</button></td>
                        </tr>
                        <tr style="display: none;">
                            <th>인증번호</th>
                            <td><input type="text" id="emailCheck" required></td>
                            <td><input type="button" style="width: 100px;" value="인증확인"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input name="phone" type="text" placeholder="- 없는 11자리 숫자" maxlength="11" required></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input type="text" id="address"  name="address" maxlength="66" required></td>
                            <td><input type="button" style="width: 100px;" onClick="execDaumPostcode()" value="주소검색"></td>
                        </tr>
                        <tr>
                            <th>상세주소</th>
                            <td><input type="text" id="addrDetail"  maxlength="66"></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><span id="submitMsg"></span></td>
                        </tr>
                    </table>

                    <div class="btndivform">
                        <button type="submit" disabled>가입하기</button>
                        <button type="button" onclick="history.back();">취소</button>
                    </div>
                    
                </form>
                    
                
            </div>
        </div>
    </div>
<jsp:include page="../common/footer.jsp" />
<script>

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

// 정규표현식 영어,숫자,특수문자를 포함한 8글자 이상
const pwdCondition = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/;

// 제출버튼 입력시 보여줄 문구를 띄우기 위한 함수
const submitMsg = document.getElementById("submitMsg");
submitMsg.textContent = "";

// 이메일 인증번호 발급을 위한 함수
function cert() {
    let email = $("#email").val();

    const emailCheck = document.getElementById("emailCheck");
    const emailTr = emailCheck.parentElement.parentElement; // tr 태크 지목

    $.ajax({
        url : "../member/cert",
        type : "post",
        data : { email : email },
        success : function(result) {

            alert(result);

            // 숨겨져있던 인증 요소 활성화 및 이메일 입력관련 요소 비활성화
            $("#emailCheck").closest("tr").css("display", "table-row");

            $("#email").attr("readonly", true);
            $("#sert").attr("disabled", true);
        },
        error : function() {

            console.log("인증번호 발급용 ajax 실패");
        }
    });
}

// 비밀번호칸을 벗어났을때 실행할 이벤트
memberPwd.addEventListener("blur", function(){

    // 정규표현식 검사
    if(!pwdCondition.test(memberPwd.value)){
        // 정규 표현식에 안맞을 경우
        pwdMsgTd.style.display = "table-cell";
        pwdMsg.textContent = "조건에 맞지 않은 비밀번호입니다.";
        pwdMsg.style.color = "red";

    } else {

        // pwdMsgTd.style.display = "none";
        pwdMsgTd.style.display = "table-cell";
        pwdMsg.textContent = "올바른 비밀번호입니다.";
        pwdMsg.style.color = "green";

    }

});

// 비밀번호 확인창을 벗어났을때 실행할 이벤트
memberPwdCheck.addEventListener("blur", function(){
    
    if(memberPwd.value != memberPwdCheck.value){
        // 만약 비밀번호가 다르다면
        checkPwdMsgTd.style.display = "table-cell"; // 보이게하기
    } else {
        // 같다면
        checkPwdMsgTd.style.display = "none"; // 숨김
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
                alert("제대로된 아이디를 입력해주세요.");
                
                    // 아이디 재입력
                    $memberId.css("border", "1px solid red");
                    
            } else {

                if(result == "NNNNN"){
                    
                    alert("이미 사용중이거나 탈퇴한 회원의 아이디 입니다.");
                
                    // 아이디 재입력
                    $memberId.css("border", "1px solid red");
                } else {
                    
                    if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
                        
                        // 수정 못하게 읽기 전용으로
                        $memberId.attr("readonly", true);
                        
                        // 테두리 되돌리기
                        $memberId.css("border", "");
                        
                        // 회원가입 버튼 키기
                        $("#myinsertForm button[type=submit]").removeAttr("disabled");

                    } else {
                        // 아이디 입력창 테두리 색칠하기
                        $memberId.css("border", "1px solid red");
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
        submitMsg.textContent = "비밀번호가 다릅니다.";
        return false;
    }

    if(!memberPwd.value || !memberPwdCheck.value){
        // 비밀번호와 비밀번호 확인창이 비어있을경우
        submitMsg.textContent = "비밀번호를 입력해주세요."
        return false;
    }

    if(!pwdCondition.test(memberPwd.value)){
        // 비밀번호가 정규표현식에 맞게 작성되었는지 확인
        submitMsg.textContent = "조건에 맞춰 비밀번호를 입력해주세요."
        return false;
    } else {
        return confirm("회원가입 하시겠습니까?")
    }

    // 나머지는 존재여부만 체크하기 vs reqiurd로 때우기인데..흠


}

</script>
</body>
</html>