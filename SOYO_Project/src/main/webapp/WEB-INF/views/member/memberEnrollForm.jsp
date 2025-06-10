<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
        .container{
            width: 1200px;
            margin: auto;
        }

        #myTitle{
            width: 1200px;
            height: 300px;
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
            회원탈퇴
        </div>
        <div class="" id="content">
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; text-align: center; margin: auto;
                padding: 15px;">회원가입</div>
                <form id="myinsertForm" action="../member/insert" align="center" method="post" onsubmit="return insertUser()">
                    <table>
                        <tr>
                            <th width="200px">아이디</th>
                            <td width="500px"><input type="text" name="memberId"></td>
                            <td width="100px"><input type="button" style="width: 100px;" value="중복확인"></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" name="memberPwd"></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="password" name="memberPwdCheck"></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="memberName"></td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td style="padding: 10px; font-size: 17px;">
                        		<input id="genderM" name="gender" type="radio" style="width: 20px; height: 20px;" value="M">&nbsp;남
                                <input id="genderF" name="gender" type="radio" style="width: 20px; height: 20px; margin-left: 50px;" value="F">&nbsp;여
                        	</td>
                        </tr>
                        <tr>
                            <th>생일</th>
                            <td><input name="birthDate" type="date">
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input name="email" type="email" ></td>
                            <td><input type="button" style="width: 100px;" value="인증번호 발급"></td>
                        </tr>
                        <tr style="display: none;">
                            <th>인증번호</th>
                            <td><input type="text"  name="emailCheck"></td>
                            <td><input type="button" style="width: 100px;" value="인증확인"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input name="phone" type="text"></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input type="text" id="address"  name="address"></td>
                            <td><input type="button" style="width: 100px;" onClick="execDaumPostcode()" value="주소검색"></td>
                        </tr>
                        <tr>
                            <th>상세주소</th>
                            <td><input type="text" id="addrDetail"  name="addrDetail"></td>
                        </tr>
                    </table>

                    <div class="btndivform">
                        <button type="submit">가입하기</button>
                        <button type="button" onclick="history.back();">취소</button>
                    </div>
                    
                </form>
                    
                
            </div>
        </div>
    </div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>