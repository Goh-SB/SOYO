<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 변경</title>
<!-- 도로명주소 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
    	.container{
            width: 1200px;
            margin: auto;
        }

        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        body{
            background-color: #f8f9fa;
        }

        #content{
            width: 1200px;
            height: 1150px; /* 여기 조절하기 */
            margin-top: 30px;
        }

        #content>div{
            float: left;
            display: block;
        }


        #myContent{
            width: 800px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 25px;
            background-color: rgba(254, 247, 253, 0.865);
            margin: 30px;
            margin-top: 40px;
        }

        #left-Menu{
        margin-top: 40px;
        margin-left: 20px;
    }

        table{
            text-align: left;
            margin: auto;
        }


        .fontsize20{
            font-size: 20px;
            color: rgb(43, 62, 115);
        }

        .updateInput{
            width: 400px;
            height: 50px;
            padding: 5px;
            margin-top: 10px;
            border-radius: 8px;
            border: 2px solid lightgray;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .btnSubmit{
            width: 100px;
            height: 40px;
            padding: 5px;
            margin: 30px;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: aliceblue;
            border-radius: 8px;
        }

        .resultDiv{
            width: 600px;
            border: 2px solid lightgrey;
            border-radius: 15px;
            margin: auto;
            margin-bottom: 30px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .searchAdd{
            width: 400px;
            height: 30px;
            border-radius: 10px;
            margin-bottom: 20px;
            cursor: pointer;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: aliceblue;
            
        }

        .title{
            background-color: rgb(252, 232, 255);
            border-top-left-radius: 25px;
            border-top-right-radius: 25px;
            font-size: 25px;
            height: 60px;
            padding-top: 12px;
            font-weight: bold;
            color: #7e4f8b85;
            font-family: 'LINESeedKR-Bd';
            text-align: center;
            margin-bottom: 30px;
        }

</style>

</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="container">
    <br>

        <div class="" id="content">
            <div class="" id="left-Menu">
                <jsp:include page="../member/leftMenu.jsp" />
            </div>
            <div class="" id="myContent">
                <div class="title">내 정보 변경</div>
                <form id="myupdate-form" action="../member/update" method="post" align="center">
                        	<input type="hidden" class="fontsize20 updateInput" name="memberId" value="${ sessionScope.loginUser.memberId }" >
                        
                            <div class="resultDiv">
                                <span class="fontsize20">이름</span><br>
                                <input maxlength="4" name="memberName" class="fontsize20 updateInput" type="text" value="${ sessionScope.loginUser.memberName }" > <br>
                            
                            <input type="password" name="memberPwd" class="fontsize20 updateInput" value="${ sessionScope.loginUser.memberPwd }" style="display: none;">
                            <span class="fontsize20">성별</span><br>
                            <div style="width: 400px; height: 50px; padding-top: 8px; margin-top: 10px;  margin: auto; margin-bottom: 10px; border-radius: 10px; border: 2px solid lightgrey;">
                                
                        		<input id="genderM" name="gender" type="radio" style="width: 20px; height: 20px;" value="M"><span class="fontsize20">&nbsp;남</span>
                                <input id="genderF" name="gender" type="radio" style="width: 20px; height: 20px; margin-left: 50px;" value="F"><span class="fontsize20">&nbsp;여</span>
                                <input id="genderX" name="gender" type="radio" style="width: 20px; height: 20px; margin-left: 50px;" value="X"><span class="fontsize20">&nbsp; 선택안함</span>
                            </div>
                                <span class="fontsize20">생년월일</span><br>
                                <input name="birthDate" type="date" id="memberDate" class="fontsize20 updateInput input-field" value="${ sessionScope.loginUser.birthDate }" ><br>
           
                                <span class="fontsize20">휴대전화번호</span><br>
                                <input name="phone" maxlength="11" oninput="this.value = this.value.replace(/[^0-9]/g, '')" type="text" class="fontsize20 updateInput" value="${ sessionScope.loginUser.phone }" ><br>
                            </div>

                            <div class="resultDiv">
                                <span class="fontsize20">주소</span><br>
                                <input style="margin-bottom: 5px;" type="text" id="address" class="updateInput"  name="address" maxlength="66" value="${ baseAddress }" required><br>
                            
                                
                                <input type="button" class="searchAdd" onClick="execDaumPostcode()" value="주소검색"><br>
                            
                                <span class="fontsize20">상세주소</span><br>
                                <input type="text" class="updateInput" id="addrDetail" name="addrDetail" maxlength="66" value="${ detailAddress }" required>
                            </div>
                        </tr>
                    
                    </table>

                    <div id="buttondiv">
                        <button type="submit" class="btnSubmit">수정완료</button>
                        <button type="button" class="btnSubmit" onclick="history.back();">취소</button>
                    </div>
                    
                </form>
                    
                
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
<script>
const today = new Date().toISOString().split('T')[0];

// 오늘이후 날짜 선택 불가능하게
document.getElementById('memberDate').setAttribute('max', today);


    function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById("address").value = data.roadAddress;
        }
    }).open();
}

    // 라디오버튼 성별 체크표시를 위한 스크립트
    if("${sessionScope.loginUser.gender}" == 'M') {
        document.getElementById("genderM").checked = true;
        // console.log("${sessionScope.loginUser.gender}");

    } else if("${sessionScope.loginUser.gender} == 'F'"){
        document.getElementById("genderF").checked = true;
    } else if("${sessionScope.loginUser.gender} == 'X'"){
        document.getElementById("genderX").checked = true;
    }
</script>
</html>