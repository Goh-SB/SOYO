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

        #myTitle{
            width: 1200px;
            height: 120px;
            font-size: 40px;
            text-align: center;
            vertical-align: middle;
        }

        #content{
            width: 1200px;
            height: 800px; /* 여기 조절하기 */
        }

        #content>div{
            float: left;
            display: block;
        }

        #left-Menu{
            width: 180px;
        }

        #left-MenuList{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
            font-size: 23px;
            height: 50px;
        }

        #left-MenuList li{
            margin-top: 5px;
            padding-left: 7px;
            
        }

        #left-MenuList li:hover{
            background-color: rgba(252, 206, 255, 0.821);
            border-top-right-radius: 25px;
            border-bottom-right-radius: 25px;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;
            width: 166px;
            
        }

        #left-MenuList a{
            text-decoration: none;
            color: gray;
            display: block;
            width: 170px;
            /* border: 1px solid lightgray; */
            
        }

        #myContent{
            width: 800px;
             /*border: 2px solid rgb(122, 64, 126);*/
            box-sizing: border-box;
            box-shadow: 0px 0px 2px 3px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            background-color: rgba(255, 242, 253, 0.663);
        }


        #order-List>ul{
            list-style-type: none;
            margin: 0px;
            padding: 0px;
        }

        #order-List>ul>li{
            border: 2px solid rgb(225, 168, 255);
            padding: 10px;
            border-radius: 5px;
            margin: 20px;
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
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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

</style>

</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="container">
        <div class="" id="myTitle">
            마이페이지
        </div>
        <div class="" id="content">
            <div class="" id="left-Menu">
                <jsp:include page="../member/leftMenu.jsp" />
            </div>
            <div class="" id="myContent">
                <div style="height: 5%; font-size: 30px; text-align: center;
                padding: 15px;">내 정보 변경</div>
                <form id="myupdate-form" action="../member/update" method="post" align="center">
                    <table>
                        
                        <tr>
                        	<td colspan="3"><input type="hidden" class="fontsize20 updateInput" name="memberId" value="${ sessionScope.loginUser.memberId }" ></td>
                        </tr>
                        <tr>
                            <th width="200px"><span class="fontsize20">이름</span></th>
                            <td width="400px"><input name="memberName" class="fontsize20 updateInput" type="text" value="${ sessionScope.loginUser.memberName }" ></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="memberPwd" class="fontsize20 updateInput" value="${ sessionScope.loginUser.memberPwd }" style="display: none;"></td>
                        </tr>
                        <tr>
                        	<th><span class="fontsize20">성별</span></th>
                        	<td style="padding: 10px; font-size: 17px;">
                        		<input id="genderM" name="gender" type="radio" style="width: 20px; height: 20px;" value="M"><span class="fontsize20">&nbsp;남</span>
                                <input id="genderF" name="gender" type="radio" style="width: 20px; height: 20px; margin-left: 50px;" value="F"><span class="fontsize20">&nbsp;여</span>
                        	</td>
                        </tr>
                        <tr>
                            <th><span class="fontsize20">생년월일</span></th>
                            <td><input name="birthDate" type="date" class="fontsize20 updateInput" value="${ sessionScope.loginUser.birthDate }" ></td>
                        </tr>
                        <tr>
                            <th><span class="fontsize20">휴대전화번호</span></th>
                            <td><input name="phone" type="text" class="fontsize20 updateInput" value="${ sessionScope.loginUser.phone }" ></td>
                        </tr>
                        <tr>
                            <th><span class="fontsize20">주소</span></th>
                            <td><input type="text" id="address" class="updateInput"  name="address" maxlength="66" value="${ baseAddress }" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="button" style="margin: 5px;" class="btnSubmit" onClick="execDaumPostcode()" value="주소검색"></td>
                        </tr>
                        <tr>
                            <th><span>상세주소</span></th>
                            <td><input type="text" class="updateInput" id="addrDetail" name="addrDetail" maxlength="66" value="${ detailAddress }" required></td>
                            
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
    }
</script>
</html>